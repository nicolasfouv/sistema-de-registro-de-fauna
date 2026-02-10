import { type Applicant } from "../contents/admin/applicants";
import { api } from "./api";

export const getApplicants = async (): Promise<Applicant[]> => {
    const response = await api.get('/applicant/get-all');
    return response.data;
};