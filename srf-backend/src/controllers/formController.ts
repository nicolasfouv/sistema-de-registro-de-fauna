import { Request, Response } from "express";
import { FormService } from "../services/formService";

class FormController {

    async getForms(req: Request, res: Response) {
        const formService = new FormService();
        const forms = await formService.getForms();
        return res.status(201).json(forms);
    }

}

export { FormController };