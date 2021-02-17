const router = require('express').Router();
const formsRoute = require('./forms');

router.use(function(req, res, next) {
	next();
});

router.use('/forms', formsRoute);

module.exports = router;