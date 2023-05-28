import { Router } from "express";
import { signIn, signUp } from "../controllers/users.controllers.js";

const usersRouter = Router()

usersRouter.post("/signUp", signUp)
usersRouter.post("/signIn", signIn)

export default usersRouter