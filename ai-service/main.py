from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title='Inovexa AI Evidence Service')

class Evidence(BaseModel):
    image_name: str | None = None
    gps_accuracy: float | None = None
    captured_at: str | None = None

@app.get('/health')
def health():
    return {'ok': True, 'service': 'ai-service', 'prototype': True}

@app.post('/check')
def check(e: Evidence):
    return {
        'prototype': True,
        'gps_consistency': 'PASS' if (e.gps_accuracy or 999) <= 25 else 'REVIEW',
        'timestamp_present': bool(e.captured_at),
        'duplicate_photo': 'DEMO_PASS',
        'suspicious_activity': 'NO_ALERT',
        'message': 'Demo response — connect a trained/validated model for production inference.'
    }
