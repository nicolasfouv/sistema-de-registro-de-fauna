import { api } from "./api";

export async function getOptions() {
    const request = await api.get('/options');
    return request.data;
}

export async function getForms() {
    const request = await api.get('/form/get-all');
    return request.data;
}

export async function getAccessLevelOptions() {
    const request = await api.get('/access-level/get-all');
    return request.data;
}