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
app.use(router);

const KEEP_ALIVE_INTERVAL_MS = 12 * 60 * 60 * 1000; // 12 horas

async function keepDatabaseAlive() {
    try {
        await prisma.$queryRaw`SELECT 1`;
        console.log(`[keep-alive] Ping ao banco realizado com sucesso — ${new Date().toISOString()}`);
    } catch (error) {
        console.error(`[keep-alive] Falha ao pingar o banco — ${new Date().toISOString()}`, error);
    }
}

setInterval(keepDatabaseAlive, KEEP_ALIVE_INTERVAL_MS);

const PORT: number = Number(process.env.PORT) || 3333;
app.listen(PORT, () => {
    console.log(`App is running at port ${PORT}`);
    // Ping inicial ao iniciar o servidor
    keepDatabaseAlive();
})