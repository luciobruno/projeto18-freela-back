import { db } from "../database/database.connection.js";

export function getPostsByUserId(userId){
    return db.query(
        `SELECT * FROM posts WHERE "userId"=$1;`,[userId]
    )
}

export function addPost(image, description, userId) {
    return db.query(
        `INSERT INTO posts (image,description,"userId") 
        VALUES ($1,$2,$3);`, [image, description, userId]
    )
}