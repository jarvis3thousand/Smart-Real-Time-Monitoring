import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config();

const app = express();
app.use(cors());
app.use(express.json({ limit: '10mb' }));

const inspections = [
  { id: 'IN-26095', title: 'Road & Site Safety Inspection', location: 'Kanpur Zone 04', status: 'Assigned', inspector: 'Demo Inspector' }
];

app.get('/api/health', (_req, res) => res.json({ ok: true, service: 'Inovexa Inspection API' }));
app.get('/api/inspections', (_req, res) => res.json(inspections));
app.get('/api/inspections/:id', (req, res) => {
  const item = inspections.find(x => x.id === req.params.id);
  if (!item) return res.status(404).json({ error: 'Inspection not found' });
  res.json(item);
});

app.post('/api/inspections/:id/submit', (req, res) => {
  const item = inspections.find(x => x.id === req.params.id);
  if (!item) return res.status(404).json({ error: 'Inspection not found' });
  item.status = 'Submitted';
  res.json({ message: 'Inspection submitted', inspection: item, sync: 'queued' });
});

app.post('/api/evidence/check', (req, res) => {
  const { gpsAccuracy, capturedAt, imageName } = req.body;
  res.json({
    prototype: true,
    image: imageName || null,
    checks: {
      gpsConsistency: Number(gpsAccuracy ?? 0) <= 25 ? 'PASS' : 'REVIEW',
      timestampPresent: Boolean(capturedAt),
      duplicateCheck: 'DEMO_PASS',
      suspiciousActivity: 'NO_ALERT'
    }
  });
});

const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Inovexa API running on http://localhost:${port}`));
