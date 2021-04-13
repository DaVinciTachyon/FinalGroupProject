const router = require('express').Router();
const formsRoute = require('./forms');
const notesRoute = require('./notes');
const monitorsRoute = require('./monitors');
const adminAuthRoute = require('./adminAuth');
const monitorAuthRoute = require('./monitorAuth');

router.use(function(req, res, next) {
	next();
});

router.use('/forms', formsRoute);
router.use('/notes', notesRoute);
router.use('/monitors', monitorsRoute);
router.use('/administrator', adminAuthRoute);
router.use('/monitor', monitorAuthRoute);

module.exports = router;