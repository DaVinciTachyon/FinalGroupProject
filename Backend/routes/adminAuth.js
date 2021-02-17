const router = require('express').Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const randomstring = require('randomstring');
const validate = require('./validation');
const Administrator = require('../models/Administrator')

router.use(function(req, res, next) {
	next();
});

router.post('/register/administrator', async (req, res) => {
	const { error } = validate.administrator.register(req.body);
	if (error) return res.status(400).send(error.details[0].message);

	const salt = await bcrypt.genSalt(10);
	const hashedPassword = await bcrypt.hash(req.body.password, salt);

	const existingUser = await Administrator.findOne({ email: req.body.email });
	if(existingUser)
		return res.status(400).send('Email already exists');

	let id = randomstring.generate(30);

	const user = new Administrator({
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

router.post('/login/administrator', async (req, res) => {
	const { error } = validate.administrator.login(req.body);
	if (error) return res.status(400).send(error.details[0].message);

	const user = await Administrator.findOne({ email: req.body.email });
	if(!user)
		return res.status(400).send('User does not exist');

	const validPass = await bcrypt.compare(req.body.password, user.password);
	if (!validPass) return res.status(400).send('Invalid Password');

	const token = jwt.sign({ _id: user.id }, process.env.ADMIN_TOKEN_SECRET);
	res.header('auth-token', token).send(token);
});

module.exports = router;