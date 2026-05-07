#!/usr/bin/env node

/**
 * Enhanced Batch Orchestrator for propose-ticket-resolution Skill
 * 
 * Orchestrates multi-session batch processing by identifying unresolved tickets
 * and preparing runSubagent invocations for each.
 * 
 * Usage:
 *   node orchestrate-batch.js [--all | FHIR-XXXXX]
 */

const fs = require('fs');
const path = require('path');

// Configuration
const JIRA_DIR = '/home/nly98977/SwArchives/hl7eu/imaging/jira';
const RESOLVED_STATUSES = [
  'Applied',
  'Not Persuasive with Modification',
  'Retracted',
  'Not Persuasive',
  'Declined'
];

/**
 * Extract Status from Metadata section of ticket
 */
function extractTicketStatus(ticketKey) {
  const ticketFile = path.join(JIRA_DIR, ticketKey, `${ticketKey}.md`);
  
  if (!fs.existsSync(ticketFile)) {
    return null;
  }
  
  const content = fs.readFileSync(ticketFile, 'utf-8');
  
  // Extract everything before the Resolution section to get Metadata
  const beforeResolution = content.split('## Resolution')[0];
  const statusMatch = beforeResolution.match(/^- Status: (.+)$/m);
  
  return statusMatch ? statusMatch[1].trim() : null;
}

/**
 * Check if a ticket is unresolved
 */
function isUnresolved(ticketKey) {
  const status = extractTicketStatus(ticketKey);
  if (!status) return false;
  
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
  
  return unresolvedTickets.sort((a, b) => {
    const aNum = parseInt(a.split('-')[1]);
    const bNum = parseInt(b.split('-')[1]);
    return aNum - bNum;
  });
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
 * Main function
 */
async function main() {
  const args = process.argv.slice(2);
  
  if (args.length === 0) {
    console.error('Usage: orchestrate-batch.js [--all | FHIR-XXXXX]');
    process.exit(1);
  }
  
  if (args[0] === '--all') {
    console.log('='.repeat(70));
    console.log('Batch Resolution Orchestrator');
    console.log('='.repeat(70));
    
    // Find unresolved tickets
    console.log('\nScanning for unresolved tickets...');
    const unresolvedTickets = findUnresolvedTickets();
    
    if (unresolvedTickets.length === 0) {
      console.log('✓ No unresolved tickets found.');
      process.exit(0);
    }
    
    console.log(`✓ Found ${unresolvedTickets.length} unresolved tickets\n`);
    
    // Check for existing resolutions
    let newTickets = [];
    let existingTickets = [];
    
    unresolvedTickets.forEach(ticketKey => {
      if (resolutionExists(ticketKey)) {
        existingTickets.push(ticketKey);
      } else {
        newTickets.push(ticketKey);
      }
    });
    
    console.log(`Tickets needing resolution files:  ${newTickets.length}`);
    console.log(`Tickets with existing files:      ${existingTickets.length}`);
    
    // Display invocation plan
    console.log('\n' + '='.repeat(70));
    console.log('Subagent Invocation Plan');
    console.log('='.repeat(70));
    
    newTickets.forEach((ticketKey, idx) => {
      const status = extractTicketStatus(ticketKey);
      console.log(`\n[${idx + 1}/${newTickets.length}] ${ticketKey}`);
      console.log(`  Status: ${status}`);
      console.log(`  Mode: Isolated session (separate Copilot chat)`);
      console.log(`  Output: jira/${ticketKey}/${ticketKey}-resolution.md`);
    });
    
    console.log('\n' + '='.repeat(70));
    console.log('Summary');
    console.log('='.repeat(70));
    console.log(`Total unresolved tickets:      ${unresolvedTickets.length}`);
    console.log(`New resolution files to create: ${newTickets.length}`);
    console.log(`Existing resolution files:     ${existingTickets.length}`);
    console.log('='.repeat(70));
    
    // Output JSON data for programmatic processing
    const orchestrationData = {
      totalUnresolved: unresolvedTickets.length,
      newTickets: newTickets,
      existingTickets: existingTickets,
      invocationPlan: newTickets.map(ticketKey => ({
        ticketKey: ticketKey,
        status: extractTicketStatus(ticketKey),
        outputFile: `jira/${ticketKey}/${ticketKey}-resolution.md`
      }))
    };
    
    // Write orchestration data to file for later use
    const planFile = path.join(JIRA_DIR, 'orchestration-plan.json');
    fs.writeFileSync(planFile, JSON.stringify(orchestrationData, null, 2));
    console.log(`\n✓ Orchestration plan saved to: jira/orchestration-plan.json`);
    
  } else {
    // Single ticket
    const ticketKey = args[0];
    const status = extractTicketStatus(ticketKey);
    
    if (!status) {
      console.error(`Error: Ticket ${ticketKey} not found in jira/ directory`);
      process.exit(1);
    }
    
    console.log(`Processing single ticket: ${ticketKey}`);
    console.log(`Status: ${status}`);
    console.log(`Output: jira/${ticketKey}/${ticketKey}-resolution.md`);
    
    if (resolutionExists(ticketKey)) {
      console.log('Note: Resolution file already exists and will be overwritten.');
    }
  }
}

main().catch(err => {
  console.error('Error:', err.message);
  process.exit(1);
});
