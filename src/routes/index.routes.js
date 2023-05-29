import { Router } from "express";
import usersRouter from "./users.routes.js";
import postsRouter from "./posts.routes.js";
import followsRouter from "./follows.routes.js";

const router = Router()

router.use(usersRouter)
router.use(postsRouter)
router.use(followsRouter)

export default router