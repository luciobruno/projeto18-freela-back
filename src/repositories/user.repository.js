import { db } from "../database/database.connection.js";

export function createSession(userId, token) {
    return db.query(
        `INSERT INTO sessions ("userId" , token) VALUES ($1,$2);`,
        [userId, token]
    )
}

export function findSession(token) {
    return db.query(
        `SELECT "userId" FROM sessions WHERE token=$1;`, [token]
    )
}

export function getUserByEmail(email) {
    return db.query(
        `SELECT * FROM users WHERE email=$1;`, [email]
    )
}

export function createUser(name, email, image, biography, password) {
    return db.query(
        `INSERT INTO users (name,email,image,biography, password)
        VALUES ($1,$2,$3,$4,$5);`, [name, email, image, biography, password]
    )
}

export function userById(id) {
    return db.query(
        `SELECT * FROM users WHERE id=$1;`, [id]
    )
}

export function usersByName(name) {
    return db.query(
        `SELECT * FROM users WHERE name=$1;`, [name]
    )
}