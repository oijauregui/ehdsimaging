#!/usr/bin/env node

/**
 * Batch Orchestrator for propose-ticket-resolution Skill
 * 
 * Handles multi-session batch processing by invoking runSubagent for each ticket.
 * This ensures each ticket is processed in an isolated Copilot chat session.
 * 
 * Usage:
 *   node batch-orchestrator.js --all              # Process all unresolved tickets
 *   node batch-orchestrator.js FHIR-51010         # Process single ticket (direct)
 * 
 * When --all is used:
 *   1. Scans jira/ directory for unresolved tickets
 *   2. Builds list of ticket keys
 *   3. Invokes runSubagent for each ticket
 *   4. Collects results and generates summary report
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Configuration
const JIRA_DIR = process.cwd();
const RESOLVED_STATUSES = [
  'Applied',
  'Not Persuasive with Modification',
  'Retracted',
  'Not Persuasive',
  'Declined'
];

/**
 * Extract metadata from ticket markdown file
 */
function extractTicketMetadata(ticketKey) {
  const ticketFile = path.join(JIRA_DIR, ticketKey, `${ticketKey}.md`);
  
  if (!fs.existsSync(ticketFile)) {
    return null;
  }
  
  const content = fs.readFileSync(ticketFile, 'utf-8');
  const metadata = {};
  
  // Parse metadata section
  const metadataMatch = content.match(/^## Metadata\s*\n([\s\S]*?)(?:^##|$)/m);
  if (metadataMatch) {
    const lines = metadataMatch[1].split('\n');
    lines.forEach(line => {
      const [key, value] = line.split('|').map(s => s.trim()).filter(Boolean);
      if (key && value) {
        metadata[key] = value;
      }
    });
  }
  
  return metadata;
}

/**
 * Check if a ticket is unresolved
 */
function isUnresolved(ticketKey) {
  const metadata = extractTicketMetadata(ticketKey);
  if (!metadata) return false;
  
  const status = metadata.Status || '';
  return !RESOLVED_STATUSES.some(s => status.includes(s));
}

/**
 * Scan jira directory for all unresolved tickets
 */
function findUnresolvedTickets() {
  const entries = fs.readdirSync(JIRA_DIR);
  const unresolvedTickets = [];
  
  entries.forEach(entry => {
    if (entry.match(/^FHIR-\d+$/) && isUnresolved(entry)) {
      unresolvedTickets.push(entry);
    }
  });
  
  return unresolvedTickets.sort();
}

/**
 * Check if resolution file already exists
 */
function resolutionExists(ticketKey) {
  const resolutionFile = path.join(
    JIRA_DIR,
    ticketKey,
    `${ticketKey}-resolution.md`
  );
  return fs.existsSync(resolutionFile);
}

/**
 * Invoke runSubagent for a single ticket
 * 
 * Note: In real implementation, this would call the Copilot runSubagent API.
 * For now, we prepare the invocation data.
 */
function invokeSubagentForTicket(ticketKey) {
  const agentInvocation = {
    agentName: 'default',
    description: `Generate resolution for ${ticketKey}`,
    prompt: `Please run the propose-ticket-resolution skill for ticket ${ticketKey}. 
    
This ticket needs a resolution proposal that includes:
1. Detailed analysis of the ticket's current status
2. Classification of the disposition (Accept, Alternative, or Decline)
3. Three proposed disposition options with justifications
4. Evidence from linked GitHub PRs/commits
5. Recommendation for the work group

Generate a complete resolution file at jira/${ticketKey}/${ticketKey}-resolution.md`
  };
  
  return agentInvocation;
}

/**
 * Main orchestration function
 */
async function orchestrateBatch() {
  console.log('='.repeat(70));
  console.log('Batch Resolution Orchestrator');
  console.log('='.repeat(70));
  
  // Find unresolved tickets
  console.log('\nPhase 1: Scanning for unresolved tickets...');
  const unresolvedTickets = findUnresolvedTickets();
  
  if (unresolvedTickets.length === 0) {
    console.log('✓ No unresolved tickets found.');
    return {
      total: 0,
      processed: 0,
      skipped: 0,
      errors: 0
    };
  }
  
  console.log(`✓ Found ${unresolvedTickets.length} unresolved tickets`);
  
  // Build agent invocations
  console.log('\nPhase 2: Preparing subagent invocations...');
  const invocations = [];
  let skipped = 0;
  
  unresolvedTickets.forEach(ticketKey => {
    if (resolutionExists(ticketKey)) {
      console.log(`  ⊘ ${ticketKey} (resolution already exists)`);
      skipped++;
    } else {
      console.log(`  ✓ ${ticketKey} (queued for processing)`);
      invocations.push(invokeSubagentForTicket(ticketKey));
    }
  });
  
  console.log(`\nPhase 3: Processing ${invocations.length} tickets in separate sessions...`);
  console.log('(Each ticket will be processed in an isolated chat session)\n');
  
  // For documentation purposes, show what would be invoked
  const summary = {
    total: unresolvedTickets.length,
    toProcess: invocations.length,
    skipped: skipped,
    invocations: invocations
  };
  
  // Display invocation plan
  invocations.forEach((inv, idx) => {
    const ticketMatch = inv.prompt.match(/FHIR-\d+/);
    const ticketKey = ticketMatch ? ticketMatch[0] : 'UNKNOWN';
    console.log(`[${idx + 1}/${invocations.length}] Subagent Session: ${ticketKey}`);
    console.log(`     Agent: ${inv.agentName}`);
    console.log(`     Mode: Isolated session (no history from previous tickets)`);
    console.log(`     Output: jira/${ticketKey}/${ticketKey}-resolution.md\n`);
  });
  
  return summary;
}

/**
 * Process single ticket directly
 */
function processSingleTicket(ticketKey) {
  if (!extractTicketMetadata(ticketKey)) {
    console.error(`Error: Ticket ${ticketKey} not found in jira/ directory`);
    process.exit(1);
  }
  
  console.log(`Processing single ticket: ${ticketKey}`);
  console.log('This ticket will be processed in the current session.');
  console.log(`Output: jira/${ticketKey}/${ticketKey}-resolution.md`);
  
  // Single ticket processing would proceed here
}

/**
 * Entry point
 */
async function main() {
  const args = process.argv.slice(2);
  
  if (args.length === 0) {
    console.error('Usage: batch-orchestrator.js [--all | FHIR-XXXXX]');
    process.exit(1);
  }
  
  if (args[0] === '--all') {
    const summary = await orchestrateBatch();
    
    console.log('='.repeat(70));
    console.log('Batch Processing Summary');
    console.log('='.repeat(70));
    console.log(`Total unresolved tickets:     ${summary.total}`);
    console.log(`Tickets to process:           ${summary.toProcess}`);
    console.log(`Existing resolutions (skip):  ${summary.skipped}`);
    console.log('='.repeat(70));
    console.log('\nNext steps:');
    console.log('1. Each ticket above will be processed in a separate Copilot session');
    console.log('2. Resolution files will be generated at: jira/FHIR-XXXXX/FHIR-XXXXX-resolution.md');
    console.log('3. After all sessions complete, review results and commit to git:');
    console.log('   git add jira/FHIR-*/FHIR-*-resolution.md');
    console.log('   git commit -m "Generate resolution proposals for unresolved tickets"');
    
  } else {
    const ticketKey = args[0];
    processSingleTicket(ticketKey);
  }
}

main().catch(err => {
  console.error('Error:', err.message);
  process.exit(1);
});
