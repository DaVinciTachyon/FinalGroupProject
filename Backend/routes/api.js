const router = require('express').Router();
const formsRoute = require('./forms');
const monitorsRoute = require('./monitors');
const adminAuthRoute = require('./adminAuth');
const monitorAuthRoute = require('./monitorAuth');

router.use(function(req, res, next) {
	next();
});

router.use('/forms', formsRoute);
router.use('/monitors', monitorsRoute);
router.use('/', adminAuthRoute);
router.use('/', monitorAuthRoute);

module.exports = router;