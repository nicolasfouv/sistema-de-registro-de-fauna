import { type GetAllApplicantOutput } from "srf-shared-types";
import { api } from "./api";

export const getApplicants = async (): Promise<GetAllApplicantOutput[]> => {
    const response = await api.get('/applicant/get-all');
    return response.data;
};

export const acceptApplicant = async (id: string): Promise<void> => {
    await api.post('/applicant/accept', { id });
};

export const rejectApplicant = async (id: string): Promise<void> => {
    await api.delete(`/applicant/reject?applicant_id=${id}`);
};