const Joi = require('@hapi/joi');

let administrator = {};
let monitor = {};

administrator.register = (data) => {
	const schema = Joi.object({
		name: Joi.string().min(3).required(),
		email: Joi.string().min(5).required().email(),
		password: Joi.string().min(6).required()
	});
	return schema.validate(data);
};

administrator.login = (data) => {
	const schema = Joi.object({
		email: Joi.string().min(5).required().email(),
		password: Joi.string().min(6).required()
	});
	return schema.validate(data);
};

monitor.register = (data) => {
	const schema = Joi.object({
		name: Joi.string().min(3).required(),
		email: Joi.string().min(5).required().email(),
		macAddress: Joi.string(),
		password: Joi.string().min(6).required()
	});
	return schema.validate(data);
};

monitor.login = (data) => {
	const schema = Joi.object({
		email: Joi.string().min(5).email(),
		macAddress: Joi.string().required(),
		password: Joi.string().min(6).required()
	});
	return schema.validate(data);
};

module.exports = {
	administrator,
	monitor
};