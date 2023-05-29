import { Router } from "express";
import { getUser, getUserMe, signIn, signUp } from "../controllers/users.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { userSchema, userSigninSchema } from "../schemas/users.schemas.js";
import { authorizationValidation } from "../middlewares/authorization.middleware.js";

const usersRouter = Router()

usersRouter.post("/signUp", validateSchema(userSigninSchema), signUp)
usersRouter.post("/signIn", validateSchema(userSchema), signIn)
usersRouter.get("/user/me", authorizationValidation, getUserMe)
usersRouter.get("/user/:id", getUser)

export default usersRouter