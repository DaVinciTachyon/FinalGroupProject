const router = require('express').Router();
// const authRoute = require('./auth/auth');

router.use(function(req, res, next) {
	next();
});

// router.use('/user', authRoute);

module.exports = router;