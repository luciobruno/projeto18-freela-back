import { v4 as uuid } from "uuid";
import bcrypt from "bcrypt";
import { createSession, createUser, getUserByEmail, userById, usersByName } from "../repositories/user.repository.js";

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

export async function getUserMe(req, res) {
    const { userId } = res.locals

    try {

        const user = await userById(userId)

        delete user.rows[0].password
        delete user.rows[0].email

        res.send(user.rows[0])

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getUser(req, res) {
    const { id } = req.params

    try {

        const user = await userById(id)

        delete user.rows[0].password
        delete user.rows[0].email

        res.send(user.rows)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function searchUser(req, res) {

    const { name } = req.body

    try {

        const users = await usersByName(name)

        if(users.rowCount === 0){
            return res.status(404).send({message: "Usuário não encontrado"})
        }

        for(let i=0;i<users.rowCount;i++){
            delete users.rows[i].password
            delete users.rows[i].email
        }

        res.send(users.rows)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getUsers(req,res){
    try{

        const users = await users()

        for(let i=0;i<users.rowCount;i++){
            delete users.rows[i].password
            delete users.rows[i].email
        }

        res.send(users.rows)

    }catch(err){
        res.status(500).send(err.message)
    }
}