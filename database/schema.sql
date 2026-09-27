CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  role VARCHAR(30) NOT NULL CHECK (role IN ('INSPECTOR','SUPERVISOR','ADMIN')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS inspections (
  id VARCHAR(40) PRIMARY KEY,
  inspector_id UUID REFERENCES users(id),
  title VARCHAR(200) NOT NULL,
  location_text VARCHAR(255),
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION,
  gps_accuracy_m DOUBLE PRECISION,
  assigned_at TIMESTAMPTZ,
  started_at TIMESTAMPTZ,
  submitted_at TIMESTAMPTZ,
  status VARCHAR(30) NOT NULL DEFAULT 'ASSIGNED',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS evidence (
  id UUID PRIMARY KEY,
  inspection_id VARCHAR(40) REFERENCES inspections(id),
  file_url TEXT NOT NULL,
  captured_at TIMESTAMPTZ,
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION,
  ai_status VARCHAR(30),
  review_status VARCHAR(30) DEFAULT 'PENDING',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS checklist_items (
  id UUID PRIMARY KEY,
  inspection_id VARCHAR(40) REFERENCES inspections(id),
  item_text TEXT NOT NULL,
  result VARCHAR(30),
  remarks TEXT
);
