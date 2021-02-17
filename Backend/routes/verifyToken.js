const jwt = require('jsonwebtoken');

module.exports.admin = (req, res, next) => {
	const token = req.header('auth-token');
	if (!token) return res.status(401).send('Access Denied');

	try {
		const verified = jwt.verify(token, process.env.ADMIN_TOKEN_SECRET);
		req.user = verified;
		next();
	} catch (err) {
		res.status(400).send('Invalid Token');
	}
};

module.exports.monitor = (req, res, next) => {
	const token = req.header('auth-token');
	if (!token) return res.status(401).send('Access Denied');

	try {
		const verified = jwt.verify(token, process.env.MONITOR_TOKEN_SECRET);
		req.user = verified;
		next();
	} catch (err) {
		res.status(400).send('Invalid Token');
	}
};