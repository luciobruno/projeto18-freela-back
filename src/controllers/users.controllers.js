import { v4 as uuid } from "uuid";
import bcrypt from "bcrypt";
import { createSession, createUser, getUserByEmail } from "../repositories/user.repository.js";


export async function signUp(req, res) {
    const { name, email, image, biography, password } = req.body

    try {

        const user = await getUserByEmail(email)
        if (user.rowCount !== 0) {
            return res.status(409).send({ message: "E-mail já cadastrado!" })
        }

        const hash = bcrypt.hashSync(password, 10)

        await createUser(name, email, image, biography, hash)

        res.sendStatus(201)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function signIn(req, res) {
    const { email, password } = req.body

    try {
        const user = await getUserByEmail(email)

        if (user.rowCount === 0) {
            return res.status(409).send({ message: "E-mail ou senha incorretos!" })
        }

        const correctPassword = bcrypt.compareSync(password, user.rows[0].password)

        if (!correctPassword) {
            return res.status(409).send({ message: "E-mail ou senha incorretos!" })
        }

        const token = uuid()

        await createSession(user.rows[0].id, token)

        res.send({ token })

    } catch (err) {
        res.status(500).send(err.message)
    }
}