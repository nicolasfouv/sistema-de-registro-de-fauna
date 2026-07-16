import { api } from "../api";
import {
    type GetAllVeterinarianVisitOutput,
    type GetFormOptionsVeterinarianVisitOutput,
    type CreateVeterinarianVisitInput,
    type UpdateVeterinarianVisitInput
} from "srf-shared-types";

export async function getVeterinarianVisits(): Promise<GetAllVeterinarianVisitOutput[]> {
    const response = await api.get('/veterinarian-visit/get-all');
    return response.data;
}

export async function getVeterinarianVisitOptions(): Promise<GetFormOptionsVeterinarianVisitOutput> {
    const response = await api.get('/veterinarian-visit/form-options');
    return response.data;
}

export async function createVeterinarianVisit(data: CreateVeterinarianVisitInput) {
    const response = await api.post('/veterinarian-visit/create', data);
    return response.data;
}

export async function updateVeterinarianVisit(visitId: number, data: UpdateVeterinarianVisitInput) {
    const response = await api.put(`/veterinarian-visit/update/${visitId}`, data);
    return response.data;
}

export async function deleteVeterinarianVisit(id: number) {
    const response = await api.delete(`/veterinarian-visit/delete/${id}`);
    return response.data;
}
