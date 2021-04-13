const router = require('express').Router();
const Form = require('../models/Form');
const verify = require('./verifyToken');

router.use(function(req, res, next) {
	next();
});

router.post('/', verify.monitor, async (req, res) => {
    const form = new Form({
        monitorID: req.user._id,
        incidentDate: req.body.incidentDate,
        attentionDate: req.body.attentionDate,
        gender: req.body.gender,
        ageRange: req.body.ageRange,
        municipality: req.body.municipality,
        community: req.body.community,
        seekedAttention: req.body.seekedAttention,
        offeredAttention: req.body.offeredAttention,
        referredAttention: req.body.referredAttention,
        classification: req.body.classification,
        rightDenied: req.body.rightDenied,
        perpetrator: req.body.perpetrator
    });
    try {
        await form.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
    }
})

router.get('/', verify.admin, async (req, res) => {
    const forms = await Form.find();
    res.status(200).send({
        forms: forms,
    });
})

module.exports = router;