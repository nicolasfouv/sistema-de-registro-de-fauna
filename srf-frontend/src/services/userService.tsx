import { api } from "./api";

export async function login(email: string, password: string) {
    const response = await api.post('/login', { email, password });
    return response.data;
}

export async function register(name: string, email: string, password: string, message: string) {
    const response = await api.post('/applicant/create', { name, email, password, message });
    return response.data;
}

export async function forgotPassword(email: string) {
    const response = await api.post('/forgot-password', { email });
    return response.data;
}
