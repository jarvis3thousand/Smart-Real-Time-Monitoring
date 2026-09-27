# Inovexa — Smart Real-Time Monitoring & Inspection

SIH26095 prototype repository for a field-inspection system.

## Repository structure
- `frontend/` — mobile-style web prototype (HTML/CSS/JS)
- `backend/` — Node.js + Express REST API starter
- `ai-service/` — Python AI/ML service starter for evidence checks
- `database/` — PostgreSQL schema
- `docs/` — architecture and API notes

## Main workflow
Inspector Login → Assignment → GPS/Time verification → Photo & checklist → AI/ML evidence checks → Submit → Sync → Supervisor dashboard.

## Run frontend
Open `frontend/index.html` in a browser.

## Run backend
```bash
cd backend
npm install
npm run dev
```

Copy `.env.example` to `.env` and configure values before connecting a real database/storage service.

## AI service
The Python service is a starter API. Its responses are clearly marked as prototype/demo results; production deployment should use a trained and validated model.

## Note
This repository is a hackathon prototype scaffold. GPS, camera, authentication, cloud storage, AI model inference and database persistence are represented as demo/starter integrations unless configured with real services.
