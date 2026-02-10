import { Router } from "express";
import { UserController } from "./controllers/userController";
import { authMiddleware } from "./middlewares/authMiddleware";
import { ApplicantController } from "./controllers/applicantController";
import { FormController } from "./controllers/formController";

const router = Router();

// Applicant routes
router.get('/applicant/get-all', authMiddleware('admin'), new ApplicantController().getApplicants);
router.post('/applicant/create', new ApplicantController().createApplicant);
router.post('/applicant/accept', authMiddleware('admin'), new ApplicantController().acceptApplicant);
router.delete('/applicant/reject', authMiddleware('admin'), new ApplicantController().rejectApplicant);

// User routes
router.get('/user/get-all', authMiddleware('admin'), new UserController().getUsers);
router.post('/user/create', authMiddleware('admin'), new UserController().createUser);
router.post('/login', new UserController().login);
router.post('/forgot-password', new UserController().forgotPassword);
router.delete('/user/delete', authMiddleware('admin'), new UserController().deleteUser);
router.put('/user/update', authMiddleware('admin'), new UserController().updateUser);

// Forms routes
router.get('/options', authMiddleware(), new FormController().getOptions);

export { router };