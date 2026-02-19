import { api } from "./api";

export async function getGroups(): Promise<{ id: string, name: string }[]> {
    const response = await api.get('/group/get-all');
    return response.data;
}