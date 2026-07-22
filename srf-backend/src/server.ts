import 'dotenv/config';
import express, { type Application } from 'express';
import cors from 'cors';
import { router } from './routes/index';
import { prisma } from './index';

export const app: Application = express();
app.use(express.json());
app.use(cors({
    origin: process.env.FRONTEND_URL,
    credentials: true
}));

// Endpoint de health check — deve ser pingado por um serviço externo (ex: cron-job.org)
// a cada ~14 min para manter o Render ativo e o banco da Aiven vivo.
app.get('/health', async (_req, res) => {
    try {
        await prisma.$queryRaw`SELECT 1`;
        res.status(200).json({ status: 'ok', db: 'connected', timestamp: new Date().toISOString() });
    } catch (error) {
        console.error(`[health-check] Falha ao pingar o banco — ${new Date().toISOString()}`, error);
        res.status(500).json({ status: 'error', db: 'disconnected', timestamp: new Date().toISOString() });
    }
});

app.use(router);

const PORT: number = Number(process.env.PORT) || 3333;
app.listen(PORT, () => {
    console.log(`App is running at port ${PORT}`);
})