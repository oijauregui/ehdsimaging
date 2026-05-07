#!/usr/bin/env node

/**
 * Batch Resolution Generator for propose-ticket-resolution Skill
 * 
 * Generates resolution proposals for multiple tickets efficiently.
 * Can process all unresolved tickets or a specific subset.
 * 
 * Usage:
 *   node generate-resolutions-batch.js              # Process batch from orchestration plan
 *   node generate-resolutions-batch.js --limit 10   # Process first 10 tickets
 */

const fs = require('fs');
const path = require('path');

// Configuration
const JIRA_DIR = '/home/nly98977/SwArchives/hl7eu/imaging/jira';

/**
 * Extract full ticket data from markdown
 */
function extractTicketData(ticketKey) {
  const ticketFile = path.join(JIRA_DIR, ticketKey, `${ticketKey}.md`);
  
  if (!fs.existsSync(ticketFile)) {
    return null;
  }
  
  const content = fs.readFileSync(ticketFile, 'utf-8');
  
  // Parse the entire ticket structure
  const ticket = {
    key: ticketKey,
    file: ticketFile,
    title: '',
    description: '',
    metadata: {},
    resolution: {},
    related: {},
    comments: [],
    content: content
  };
  
  // Extract title from heading
  const titleMatch = content.match(/^# FHIR-\d+: (.+)$/m);
  if (titleMatch) {
    ticket.title = titleMatch[1];
  }
  
  // Extract description section
  const descMatch = content.match(/^## Description\s*\n([\s\S]*?)(?:^##|$)/m);
  if (descMatch) {
    ticket.description = descMatch[1].trim();
  }
  
  // Extract metadata section (before ## Resolution)
  const metaStart = content.indexOf('## Metadata');
  const resStart = content.indexOf('## Resolution');
  if (metaStart !== -1) {
    const endIdx = resStart !== -1 ? resStart : content.length;
    const metaSection = content.substring(metaStart, endIdx);
    const lines = metaSection.split('\n');
    lines.forEach(line => {
      const match = line.match(/^- ([^:]+):\s*(.+)$/);
      if (match) {
        ticket.metadata[match[1].trim()] = match[2].trim();
      }
    });
  }
  
  // Extract resolution section (after ## Resolution)
  const relStart = content.indexOf('## Related');
  const resMatch = content.match(/^## Resolution\s*\n([\s\S]*?)(?:^##|$)/m);
  if (resMatch) {
    const lines = resMatch[1].split('\n');
    lines.forEach(line => {
      const match = line.match(/^- ([^:]+):\s*(.+)$/);
      if (match) {
        ticket.resolution[match[1].trim()] = match[2].trim();
      }
    });
  }
  
  // Extract related section (after ## Related)
  const relMatch = content.match(/^## Related\s*\n([\s\S]*?)$/m);
  if (relMatch) {
    const lines = relMatch[1].split('\n');
    lines.forEach(line => {
      const match = line.match(/^- ([^:]+):\s*(.+)$/);
      if (match) {
        ticket.related[match[1].trim()] = match[2].trim();
      }
    });
  }
  
  return ticket;
}

/**
 * Generate resolution proposal markdown
 */
function generateResolutionProposal(ticket) {
  const {
    key,
    title,
    description,
    metadata,
    resolution,
    related
  } = ticket;
  
  const status = metadata.Status || 'Unknown';
  const issueType = metadata['Issue Type'] || 'Unknown';
  const reporter = metadata.Reporter || 'Unassigned';
  const created = metadata.Created || 'Unknown';
  
  const proposalMarkdown = `# Proposed Resolution for ${key}

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | ${key} |
| Title | ${title} |
| Type | ${issueType} |
| Status | ${status} |
| Reporter | ${reporter} |
| Created | ${created} |

## Description

${description}

## Implementation Status

### Current Status: ${status}

### Disposition Classification

Based on the ticket status and metadata:

- **Status Field**: ${status}
- **Resolution**: ${resolution.Resolution || 'Not specified'}
- **Related Sections**: ${metadata['Related Sections'] || 'Not specified'}

## Disposition Analysis

### Ticket Metadata Analysis

The ticket is currently classified as **${status}** and requires governance review to determine final disposition.

### Evidence & Links

${related.Grouping ? `- **Grouping**: ${related.Grouping}` : ''}
${metadata.Assignee && metadata.Assignee !== 'Unassigned' ? `- **Assigned to**: ${metadata.Assignee}` : ''}

## Proposed Dispositions

### Disposition A: Accept & Implement

#### Proposal

Review the technical merits and feasibility of this proposal. If the underlying requirement is valid and aligns with FHIR imaging scope, accept and implement the requested change to the specification or examples.

#### Justification

- The request addresses a legitimate use case in imaging workflows
- Implementation would improve clarity or functionality
- Change is consistent with existing FHIR design principles

---

### Disposition B: Alternative Approach

#### Proposal

Address the underlying need through an alternative mechanism, such as:
- Using extensions instead of core elements
- Applying constraints through a profile
- Implementing in examples rather than core specification
- Different cardinality or data type

#### Justification

- Alternative approach achieves the same goals with fewer breaking changes
- Reduces implementation burden on existing systems
- Better aligns with FHIR architecture principles

---

### Disposition C: Decline

#### Proposal

The request should not be adopted. Clear rationale:
- Out of scope for imaging IG
- Insufficient use cases to justify change
- Addressed by existing mechanism
- Would introduce unnecessary complexity
- Breaking change not justified by value

#### Justification

Provide specific reasoning why declining is the right decision for the FHIR imaging community.

---

### Recommendation

**Recommended disposition:** [A / B / C to be determined by work group]

Work group should review this ticket and supporting evidence to determine the best path forward. Consider:
- Community feedback and use cases
- Alignment with FHIR design principles  
- Implementation complexity vs. value delivered
- Impact on existing implementers

## Related Tickets

${related.Grouping ? `- Part of grouping: ${related.Grouping}` : 'No related grouping specified'}

## Next Steps

1. Present to work group for review and discussion
2. Gather implementer feedback on proposed dispositions
3. Document final decision and rationale
4. If accepted, create implementation task with specific requirements
5. Track implementation in GitHub PRs/commits
6. Update specification and generate updated artifacts

## Verification Checklist

- [ ] Work group review completed
- [ ] Disposition approved
- [ ] Implementation (if accepted) committed to repository
- [ ] Changes verified in main branch
- [ ] Rendered output updated (igs/imaging-r4, igs/imaging-r5)
- [ ] Documentation updated if needed
- [ ] Resolution file finalized and committed

---

*Generated: ${new Date().toISOString()}*
*Ticket Status: ${status}*
`;
  
  return proposalMarkdown;
}

/**
 * Load orchestration plan
 */
function loadOrchestrationPlan() {
  const planFile = path.join(JIRA_DIR, 'orchestration-plan.json');
  
  if (!fs.existsSync(planFile)) {
    console.error('Error: orchestration-plan.json not found');
    console.log('Run: node orchestrate-batch.js --all');
    process.exit(1);
  }
  
  return JSON.parse(fs.readFileSync(planFile, 'utf-8'));
}

/**
 * Main function
 */
async function main() {
  const args = process.argv.slice(2);
  const limit = args.includes('--limit') 
    ? parseInt(args[args.indexOf('--limit') + 1])
    : null;
  
  console.log('='.repeat(70));
  console.log('Batch Resolution Generator');
  console.log('='.repeat(70));
  
  // Load orchestration plan
  console.log('\nLoading orchestration plan...');
  const plan = loadOrchestrationPlan();
  
  let ticketsToProcess = plan.newTickets;
  if (limit) {
    ticketsToProcess = ticketsToProcess.slice(0, limit);
    console.log(`Processing limited set: ${limit} tickets`);
  }
  
  console.log(`\nProcessing ${ticketsToProcess.length} unresolved tickets...\n`);
  
  let successful = 0;
  let failed = 0;
  const results = [];
  
  // Process each ticket
  ticketsToProcess.forEach((ticketKey, idx) => {
    try {
      // Extract ticket data
      const ticket = extractTicketData(ticketKey);
      
      if (!ticket) {
        console.log(`✗ ${ticketKey} - Not found`);
        failed++;
        return;
      }
      
      // Generate resolution proposal
      const proposal = generateResolutionProposal(ticket);
      
      // Determine output path
      const outputDir = path.join(JIRA_DIR, ticketKey);
      const outputFile = path.join(outputDir, `${ticketKey}-resolution.md`);
      
      // Ensure directory exists
      if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir, { recursive: true });
      }
      
      // Write resolution file
      fs.writeFileSync(outputFile, proposal, 'utf-8');
      
      console.log(`✓ [${idx + 1}/${ticketsToProcess.length}] ${ticketKey} → ${ticketKey}-resolution.md`);
      successful++;
      results.push({
        ticket: ticketKey,
        status: 'success',
        file: outputFile
      });
      
    } catch (err) {
      console.log(`✗ ${ticketKey} - Error: ${err.message}`);
      failed++;
      results.push({
        ticket: ticketKey,
        status: 'error',
        error: err.message
      });
    }
  });
  
  console.log('\n' + '='.repeat(70));
  console.log('Summary');
  console.log('='.repeat(70));
  console.log(`Successfully generated: ${successful} files`);
  console.log(`Failed: ${failed} tickets`);
  console.log(`Total processed: ${successful + failed}/${ticketsToProcess.length}`);
  
  // Save results
  const resultsFile = path.join(JIRA_DIR, 'batch-resolution-results.json');
  fs.writeFileSync(resultsFile, JSON.stringify({
    timestamp: new Date().toISOString(),
    plan: plan,
    processed: ticketsToProcess,
    results: results,
    summary: {
      successful,
      failed,
      total: successful + failed
    }
  }, null, 2));
  
  console.log(`\n✓ Results saved to: jira/batch-resolution-results.json`);
  console.log('='.repeat(70));
  
  // Next steps
  console.log('\nNext steps:');
  console.log('1. Review generated resolution files:');
  console.log('   find jira -name "*-resolution.md" -type f');
  console.log('2. Commit generated files:');
  console.log('   git add jira/FHIR-*/*-resolution.md');
  console.log('   git commit -m "Generate resolution proposals for unresolved tickets"');
  console.log('3. Present to work group for review and disposition decisions');
}

main().catch(err => {
  console.error('Error:', err.message);
  process.exit(1);
});
