import { Router } from "express";
import { authorizationValidation } from "../middlewares/authorization.middleware.js";
import { addFollow, addLike, getFollows, getWhoFollowsMe } from "../controllers/follows.controllers.js";

const followsRouter = Router()

followsRouter.get("/follows", authorizationValidation, getFollows)
followsRouter.get("/follows/me", authorizationValidation, getWhoFollowsMe)
followsRouter.post("/follow/:id", authorizationValidation, addFollow)
followsRouter.post("/like/:id", authorizationValidation, addLike)

export default followsRouter