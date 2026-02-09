import { Request, Response } from "express";
import { FormService } from "../services/formService";

class FormController {

    async getOptions(req: Request, res: Response) {
        const formService = new FormService();
        const options = await formService.getOptions();
        return res.status(201).json(options);
    }

}

export { FormController };