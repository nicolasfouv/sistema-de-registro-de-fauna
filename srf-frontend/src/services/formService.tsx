import { api } from "./api";

export async function getForms() {
    const request = await api.get('/form/get-all');
    return request.data;
}