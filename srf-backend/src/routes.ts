import { Router } from "express";
import { UserController } from "./controllers/userController";
import { authMiddleware } from "./middlewares/authMiddleware";
import { ApplicantController } from "./controllers/applicantController";
import { FormController } from "./controllers/formController";
import { GroupController } from "./controllers/groupController";

const router = Router();

// Applicant routes
router.get('/applicant/get-all', authMiddleware('admin'), new ApplicantController().getApplicants);
router.post('/applicant/create', new ApplicantController().createApplicant);
router.post('/applicant/accept', authMiddleware('admin'), new ApplicantController().acceptApplicant);
router.delete('/applicant/reject', authMiddleware('admin'), new ApplicantController().rejectApplicant);

// User routes
router.get('/user/get-all', authMiddleware('admin'), new UserController().getUsers);
router.get('/user/user-access/:userId', authMiddleware('admin'), new UserController().getUserAccess);
router.post('/user/create', authMiddleware('admin'), new UserController().createUser);
router.post('/login', new UserController().login);
router.post('/forgot-password', new UserController().forgotPassword);
router.delete('/user/delete', authMiddleware('admin'), new UserController().deleteUser);
router.put('/user/update/details', authMiddleware('admin'), new UserController().updateUserDetails);
router.put('/user/update/pic', authMiddleware('admin'), new UserController().updateUserPic);
router.put('/user/update/access', authMiddleware('admin'), new UserController().updateUserAccess);
router.put('/user/update/password', authMiddleware('admin'), new UserController().updateUserPassword);


// Forms routes
router.get('/options', authMiddleware(), new FormController().getOptions);
router.get('/form/get-all', authMiddleware(), new FormController().getForms);
router.get('/access-level/get-all', authMiddleware(), new FormController().getAccessLevel);

// Group routes
router.get('/group/get-all', authMiddleware('admin'), new GroupController().getAllGroups);

export { router };