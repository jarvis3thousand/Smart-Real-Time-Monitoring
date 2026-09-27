# Architecture

Inspector mobile/web UI
        ↓
Node.js + Express API
        ↓
PostgreSQL / Firebase + object storage
        ↓
AI evidence-check service
        ↓
Supervisor dashboard / alerts

Offline capture should queue records locally and sync when connectivity returns. Production GPS, camera, authentication and storage integrations must be configured and tested.
