const Joi = require('@hapi/joi');

let validators = {};

validators.register = (data) => {
	const schema = Joi.object({
		name: Joi.string().min(3).required(),
		email: Joi.string().min(5).required().email(),
		password: Joi.string().min(6).required()
	});
	return schema.validate(data);
};

validators.login = (data) => {
	const schema = Joi.object({
		email: Joi.string().min(5).required().email(),
		password: Joi.string().min(6).required()
	});
	return schema.validate(data);
};

module.exports = validators;