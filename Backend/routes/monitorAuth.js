const router = require('express').Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const randomstring = require('randomstring');
const validate = require('./validation');
const Monitor = require('../models/Monitor');
const isActive = require('./isUserActive');

router.use(function(req, res, next) {
	next();
});

router.post('/register', async (req, res) => {
	const { error } = validate.monitor.register(req.body);
	if (error) return res.status(400).send({ error: error.details[0].message });

	const salt = await bcrypt.genSalt(10);
	const hashedPassword = await bcrypt.hash(req.body.password, salt);

	const existingEmail = await Monitor.findOne({ email: req.body.email });
	if(existingEmail)
        return res.status(400).send({ error: 'Email already exists' });

	let id = randomstring.generate(30);

	const user = new Monitor({
		id: id,
		name: req.body.name,
        email: req.body.email,
		password: hashedPassword
	});
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

router.post('/login', isActive.monitor.isActive, async (req, res) => {
	const { error } = validate.monitor.login(req.body);
	if (error) return res.status(400).send({ error: error.details[0].message });

	if(req.body.email) {
		const user = await Monitor.findOne({ email: req.body.email });
		if(user && user.firstLogin) {
			user.firstLogin = false;
			user.macAddress = req.body.macAddress;

			try {
				await user.save();
				res.sendStatus(200);
			} catch (err) {
				res.status(400).send({ error: err });
			}
		}
	}
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
		return res.status(400).send({ error: 'User does not exist' });

	const validPass = await bcrypt.compare(req.body.password, user.password);
	if (!validPass) return res.status(400).send({ error: 'Invalid Password' });

	const token = jwt.sign({ _id: user.id }, process.env.MONITOR_TOKEN_SECRET);
	res.header('auth-token', token).send({ token });
});

router.post('/update/name', isActive.monitor.isActive, async (req, res) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'MAC Address does not exist' });

	if(!req.body.name)
		return res.status(400).send({ error: 'Name required' });

	user.name = req.body.name;
	
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

router.post('/update/password', isActive.monitor.isActive, async (req, res) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'MAC Address does not exist' });

	if(!req.body.password)
		return res.status(400).send({ error: 'Password required' });

	const salt = await bcrypt.genSalt(10);
	const hashedPassword = await bcrypt.hash(req.body.password, salt);

	user.password = hashedPassword;
	
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

router.post('/update/macAddress', isActive.monitor.isActive, async (req, res) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'MAC Address does not exist' });

	if(!req.body.newMacAddress)
		return res.status(400).send({ error: 'New MAC Address required' });

	user.macAddress = req.body.newMacAddress;
	
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

router.post('/deactivate', isActive.monitor.isActive, async (req, res) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'MAC Address does not exist' });

	user.active = false;
	
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

router.post('/activate', isActive.monitor.isInactive, async (req, res) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'MAC Address does not exist' });

	user.active = true;
	
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

router.post('/sos', isActive.monitor.isActive, async (req, res) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'MAC Address does not exist' });

	user.assistanceRequired = true;
	
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

router.post('/sos/stop', isActive.monitor.isActive, async (req, res) => {
	const user = await Monitor.findOne({ macAddress: req.body.macAddress });
	if(!user)
        return res.status(400).send({ error: 'MAC Address does not exist' });

	user.assistanceRequired = false;
	
    try {
        await user.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
	}
});

module.exports = router;
