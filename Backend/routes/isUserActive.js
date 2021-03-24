const Administrator = require("../models/Administrator");
const Monitor = require('../models/Monitor');

module.exports.monitor = async (req, res, next) => {
	const user = await Monitor.findOne({ email: req.body.email });
	if(!user)
        return res.status(400).send({ error: 'Email does not exist' });

	if(!user.active)
		return res.status(400).send({ error: 'User inactive' });
    
    next();
};

module.exports.administrator = async (req, res, next) => {
	const user = await Administrator.findOne({ email: req.body.email });
	if(!user)
        return res.status(400).send({ error: 'Email does not exist' });

	if(!user.active)
		return res.status(400).send({ error: 'User inactive' });
    
    next();
};