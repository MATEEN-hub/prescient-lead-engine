CREATE TABLE sources_list (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  url TEXT NOT NULL,
  selector TEXT,
  type TEXT,
  dynamic BOOLEAN DEFAULT FALSE,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE raw_signals (
  id SERIAL PRIMARY KEY,
  domain TEXT NOT NULL,
  source_url TEXT,
  source_name TEXT,
  scraped_at TIMESTAMPTZ DEFAULT NOW(),
  processed BOOLEAN DEFAULT FALSE
);

CREATE TABLE dedupe_hashes (
  id SERIAL PRIMARY KEY,
  hash TEXT UNIQUE NOT NULL,
  domain TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE qualified_leads (
  id SERIAL PRIMARY KEY,
  domain TEXT NOT NULL,
  company_name TEXT,
  employee_count INT,
  estimated_arr TEXT,
  contact_name TEXT,
  contact_title TEXT,
  contact_email TEXT,
  email_verified BOOLEAN DEFAULT FALSE,
  source_name TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE heartbeat (
  id SERIAL PRIMARY KEY,
  component TEXT NOT NULL,
  last_ok TIMESTAMPTZ DEFAULT NOW()
);