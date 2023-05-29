import { Router } from "express"
import { authorizationValidation } from "../middlewares/authorization.middleware.js"
import { addPostMe, getPosts, getPostsMe } from "../controllers/posts.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { postSchema } from "../schemas/posts.schema.js"

const postsRouter = Router()

postsRouter.get("/posts/me", authorizationValidation, getPostsMe)
postsRouter.post("/addPost", authorizationValidation, validateSchema(postSchema), addPostMe)
postsRouter.get("/posts/:id", getPosts)

export default postsRouter