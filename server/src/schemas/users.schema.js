const joi = require('joi');

module.exports = {
    createUserSchema: joi.object({
        Nombre: joi.string()
        .max(80)
        .required()
        .messages({
            'string.base': `"El campo Nombre" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Nombre" no puede estar vacio`,
            'string.max': `"El campo Nombre" no puede tener mas de 80 caracteres`,
            'any.required': `"El Nombre" es un campo requerido`,
          }),
        Apellido_P: joi.string()
        .max(45)
        .required()
        .messages({
            'string.base': `"El campo Apellido Paterno" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Apellido Paterno" no puede estar vacio`,
            'string.max': `"El campo Apellido Paterno" no puede tener mas de 45 caracteres`,
            'any.required': `"El Apellido Paterno" es un campo requerido`,
          }),
        Apellido_M: joi.string()
        .max(45).required()
        .messages({
            'string.base': `"El campo Apellido Materno" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Apellido Materno" no puede estar vacio`,
            'string.max': `"El campo Apellido Materno" no puede tener mas de 45 caracteres`,
            'any.required': `"El Apellido Materno" es un campo requerido`,
          }),
        Correo_Electronico: joi.string()
        .max(100)
        .required()
        .messages({
            'string.base': `"El campo Correo Electronico" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Correo Electronico" no puede estar vacio`,
            'string.max': `"El campo Correo Electronico" no puede tener mas de 100 caracteres`,
            'any.required': `"El Correo Electronico" es un campo requerido`,
          }),
        Telefono: joi.string()
        .max(10)
        .required()
        .messages({
            'string.base': `"El campo Telefono" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Telefono" no puede estar vacio`,
            'string.max': `"El Telefono" no puede tener mas de 10 caracteres`,
            'any.required': `"El Telefono" es un campo requerido`,
          }),
        Motivo: joi.number()
        .required()
        .messages({
            'number.base': `"El campo Motivo" debe ser de tipo 'numero'`,
            'any.required': `"El Motivo" es un campo requerido`,
          }),
        Escuela: joi.string()
        .max(100)
        .required()
        .messages({
            'string.base': `"El campo Escuela de procedencia" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Escuela de procedencia" no puede estar vacio`,
            'string.max': `"El campo Escuela de procedencia" no puede tener mas de 100 caracteres`,
            'any.required': `"El Escuela de procedencia" es un campo requerido`,
          }),
        Area_ID: joi.number()
        .required()
        .messages({
            'number.base': `"El campo Area" debe ser de tipo 'numero'`,
            'any.required': `"El Area" es un campo requerido`,
          }),
    }),
    updateUserSchema: joi.object({
        Nombre: joi.string().max(80)
        .messages({
            'string.base': `"El campo Nombre" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Nombre" no puede estar vacio`,
            'string.max': `"El campo Nombre" no puede tener mas de 80 caracteres`,
        }),
        Apellido_P: joi.string().max(45)
        .messages({
            'string.base': `"El campo Apellido Paterno" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Apellido Paterno" no puede estar vacio`,
            'string.max': `"El campo Apellido Paterno" no puede tener mas de 45 caracteres`,
        }),
        Apellido_M: joi.string().max(45)
        .messages({
            'string.base': `"El campo Apellido Materno" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Apellido Materno" no puede estar vacio`,
            'string.max': `"El campo Apellido Materno" no puede tener mas de 45 caracteres`,
        }),
        Correo_Electronico: joi.string().max(100)
        .messages({
            'string.base': `"El campo Correo Electronico" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Correo Electronico" no puede estar vacio`,
            'string.max': `"El Correo Electronico" no puede tener mas de 100 caracteres`,
        }),
        Telefono: joi.string().max(10)
        .messages({
            'string.base': `"El campo Telefono" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Telefono" no puede estar vacio`,
            'string.max': `"El Telefono" no puede tener mas de 10 caracteres`,
        }),
        Motivo: joi.number()
        .messages({
            'number.base': `"El campo Motivo" debe ser de tipo 'numero'`,
        }),
        Escuela: joi.string().max(100)
        .messages({
            'string.base': `"El campo Escuela de procedencia" debe ser de tipo 'texto'`,
            'string.empty': `"El campo Escuela de procedencia" no puede estar vacio`,
            'string.max': `"El campo Escuela de procedencia" no puede tener mas de 100 caracteres`,
        }),
        Area_ID: joi.number()
        .messages({
            'number.base': `"El campo Area" debe ser de tipo 'numero'`,
        }),
    }),
}