const router = require('express').Router();
const formsRoute = require('./forms');
const authRoute = require('./adminAuth');

router.use(function(req, res, next) {
	next();
});

router.use('/forms', formsRoute);
router.use('/', authRoute);

module.exports = router;