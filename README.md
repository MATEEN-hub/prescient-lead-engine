# Prescient Lead Engine 🚀
> Autonomous B2B lead generation pipeline — 1,100+ qualified leads/month

## What it does
Automatically scrapes job boards and company directories, enriches 
company data, filters by ICP criteria, and delivers verified executive 
contacts to a Supabase database — fully hands-off after setup.

## Architecture
Apify (scraper)
→ Supabase raw_signals
→ N8N enrichment workflow
→ ICP filter
→ Supabase qualified_leads
→ Slack alert
## Stack
| Tool | Purpose |
|------|---------|
| Apify | Scrapes job boards (Builtin, Wellfound, Otta) |
| Supabase | PostgreSQL database — stores all signals and leads |
| N8N | Enrichment workflow — processes, filters, saves leads |
| Slack | Real-time alerts on new qualified leads |

## Key features
- Deduplication — never processes same company twice in 90 days
- ICP filtering — only saves companies matching 50-500 staff, B2B tech
- Heartbeat monitoring — self-reports failures to Slack instantly
- Fully autonomous — runs every 30 minutes with zero human input

## Results
- ~1,100 qualified leads per month
- <2 hours human maintenance per month
- $226/month total running cost

## Files
- `workflow.json` — N8N workflow (import directly into N8N)
- `schema.sql` — Supabase database schema

## Setup
1. Create Supabase project and run `schema.sql`
2. Sign up for N8N cloud and import `workflow.json`
3. Add Supabase credentials to all Supabase nodes in N8N
4. Sign up for Apify and configure Website Content Crawler
5. Connect Apify webhook to N8N webhook URL
6. Add Slack webhook URL to the Slack alert node
7. Execute workflow and verify leads appear in qualified_leads table
