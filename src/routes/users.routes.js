import { Router } from "express";
import { getUser, getUserMe, getUsers, searchUser, signIn, signUp } from "../controllers/users.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { searchUsersSchema, userSchema, userSigninSchema } from "../schemas/users.schemas.js";
import { authorizationValidation } from "../middlewares/authorization.middleware.js";

const usersRouter = Router()

usersRouter.post("/signUp", validateSchema(userSchema), signUp)
usersRouter.post("/signIn", validateSchema(userSigninSchema), signIn)
usersRouter.get("/user/me", authorizationValidation, getUserMe)
usersRouter.get("/user/:id", getUser)
usersRouter.post("/search/users", validateSchema(searchUsersSchema), searchUser)
usersRouter.get("/users", getUsers)

export default usersRouter