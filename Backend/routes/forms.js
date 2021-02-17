const router = require('express').Router();
const Form = require('../models/Form');

router.use(function(req, res, next) {
	next();
});

router.post('/', async (req, res) => {
    const form = new Form(req.body);
    try {
        await form.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
    }
})

router.get('/', async (req, res) => {
    const forms = await Form.find();
    res.status(200).send({
        forms: forms,
    });
})

module.exports = router;