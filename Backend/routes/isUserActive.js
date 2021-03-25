const Administrator = require("../models/Administrator");
const Monitor = require('../models/Monitor');

monitor = {}
administrator = {}

monitor.isActive = async (req, res, next) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'macAddress does not exist' });

	if(!user.active)
		return res.status(400).send({ error: 'User inactive' });
    
    next();
};

monitor.isInactive = async (req, res, next) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'macAddress does not exist' });

	if(user.active)
		return res.status(400).send({ error: 'User active' });
    
    next();
};

administrator.isActive = async (req, res, next) => {
	const user = await Administrator.findOne({ email: req.body.email });
	if(!user)
        return res.status(400).send({ error: 'Email does not exist' });

	if(!user.active)
		return res.status(400).send({ error: 'User inactive' });
    
    next();
};

administrator.isInactive = async (req, res, next) => {
	const user = await Administrator.findOne({ email: req.body.email });
	if(!user)
        return res.status(400).send({ error: 'Email does not exist' });

	if(user.active)
		return res.status(400).send({ error: 'User active' });
    
    next();
};

module.exports = {
	monitor,
	administrator
}