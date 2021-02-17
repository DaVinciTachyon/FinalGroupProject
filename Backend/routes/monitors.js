const router = require('express').Router();
const Monitor = require('../models/Monitor');
const verify = require('./verifyToken');

router.use(function(req, res, next) {
	next();
});

router.get('/', verify.admin, async (req, res) => {
    const monitors = await Monitor.find();
    res.status(200).send({
        monitors: monitors,
    });
})

module.exports = router;