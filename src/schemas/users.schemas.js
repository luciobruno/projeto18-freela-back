import joi from "joi";

export const userSchema = joi.object({
    name: joi.string().required(),
    email: joi.string().email().required(),
    image: joi.string().uri().required(),
    biography: joi.string().max(200).required(),
    password: joi.string().required()
})

export const userSigninSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().required()
})