const express = require('express');
const app = express();
// משיכת הפורט ממשתני הסביבה - פרקטיקה מעולה לפרודקשן
const PORT = process.env.PORT || 3000;

app.use(express.json());

// נקודת הקצה שקוברנטיס ידגום (Liveness/Readiness probes)
app.get('/health', (req, res) => {
    res.status(200).send({ status: 'OK', message: 'URL Shortener is healthy!' });
});

// סימולציה של פונקציית קיצור הכתובות
app.post('/shorten', (req, res) => {
    const { url } = req.body;
    if (!url) return res.status(400).send({ error: 'URL is required' });
    
    // יצירת קוד רנדומלי קצר
    const shortCode = Math.random().toString(36).substring(2, 8);
    res.status(200).send({ 
        original: url, 
        short: `http://localhost:${PORT}/${shortCode}` 
    });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server is running and listening on port ${PORT}`);
});