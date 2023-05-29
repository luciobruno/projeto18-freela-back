import { addFollowByUserId, addLikeById, getFollowsByUserId, getWhoFollowsMeById, postVerification, validationFollow } from "../repositories/follow.repository.js"

export async function getFollows(req, res) {
    const { userId } = res.locals

    try {

        const follows = await getFollowsByUserId(userId)

        res.send(follows.rows)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getWhoFollowsMe(req,res){
    const { userId } = res.locals

    try {

        const follows = await getWhoFollowsMeById(userId)

        res.send(follows.rows)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function addFollow(req, res) {

    const { userId } = res.locals

    const { id } = req.params

    try {

        const follow = await validationFollow(id, userId)

        if (follow.rowCount !== 0) {
            return res.status(401).send({ message: "Você já segue esse usuário" })
        }

        if(userId == id){
            return res.sendStatus(401)
        }

        await addFollowByUserId(id, userId)

        res.sendStatus(200)

    } catch (err) {
        res.status(500).send(err.message)
    }

}

export async function addLike(req, res) {

    const { id } = req.params

    try {

        const post = await postVerification(id)

        if(post.rowCount === 0){
            return res.sendStatus(404)
        }

        const likes = post.rows[0].likes + 1 

        await addLikeById(id,likes)

        res.sendStatus(200)

    } catch (err) {
        res.status(500).send(err.message)
    }

}