import { addPost, getPostsByUserId } from "../repositories/post.repository.js"

export async function getPostsMe(req, res) {

    const { userId } = res.locals

    try {

        const posts = await getPostsByUserId(userId)

        res.send(posts.rows)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function addPostMe(req, res) {
    const { userId } = res.locals
    const { image, description } = req.body

    try {

        await addPost(image, description, userId)

        res.sendStatus(201)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getPosts(req, res) {
    const { id } = req.params

    try {

        const posts = await getPostsByUserId(id)

        res.send(posts.rows)

    } catch (err) {
        res.status(500).send(err.message)
    }
}