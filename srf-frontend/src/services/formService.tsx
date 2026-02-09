import { api } from "./api";

export async function getOptions() {
    const request = await api.get('/options');
    return request.data;
}