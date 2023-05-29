import { db } from "../database/database.connection.js";

export function getFollowsByUserId(userId) {
    return db.query(
        `SELECT follows.*, users.name AS name, users.image AS image, users.biography AS biography
        FROM follows JOIN users ON users.id = follows.follow
        WHERE "userId"=$1`, [userId]
    )
}

export function getWhoFollowsMeById(userId) {
    return db.query(
        `SELECT follows.*, users.name AS name, users.image AS image, users.biography AS biography
        FROM follows JOIN users ON users.id = follows."userId"
        WHERE follow=$1`, [userId]
    )
}

export function addFollowByUserId(follow, userId) {
    return db.query(
        `INSERT INTO follows (follow,"userId") VALUES ($1,$2);`, [follow, userId]
    )
}

export function addLikeById(id, likes) {
    return db.query(
        `UPDATE posts SET likes=$1 WHERE id=$2;`, [likes, id]
    )
}

export function postVerification(id){
    return db.query(
        `SELECT * FROM posts WHERE id=$1;`,[id]
    )
}

export function validationFollow(id, userId) {
    return db.query(
        `SELECT * FROM follows WHERE follow=$1 AND "userId"=$2;`, [id, userId]
    )
}