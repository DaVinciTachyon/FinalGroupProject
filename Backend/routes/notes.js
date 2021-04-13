const router = require('express').Router();
const Note = require('../models/Note');
const verify = require('./verifyToken');

router.use(function(req, res, next) {
	next();
});

router.post('/', verify.monitor, async (req, res) => {
    const note = new Note({
        monitorID: req.user._id,
        createDate: req.body.createDate,
        editDate: req.body.editDate,
        content: req.body.content
    });
    try {
        await note.save();
        res.status(200).send({ _id: note._id });
    } catch (err) {
        res.status(400).send({ error: err });
    }
})

router.post('/edit/', verify.monitor, async (req, res) => {
    if(!req.body._id)
        return res.status(400).send({ error: "_id required" });

    if(!req.body.content)
        return res.status(400).send({ error: "content required" });

    if(!req.body.editDate)
        return res.status(400).send({ error: "editDate Required" });

    const note = await Note.findById(req.body._id)
    try {
        note.content = req.body.content;
        note.editDate = req.body.editDate;
        
        await note.save();
        res.sendStatus(200);
    } catch (err) {
        res.status(400).send({ error: err });
    }
})

router.post('/delete/', verify.monitor, async (req, res) => {
    if(!req.body._id)
        return res.status(400).send({ error: "_id required" });

    Note.findByIdAndDelete(req.body._id, (err) => {
        if(err)
            return res.status(400).send({ error: err });
        res.sendStatus(200);
    });
})

router.get('/', verify.monitor, async (req, res) => {
    const notes = await Note.find({ monitorID: req.user._id });
    res.status(200).send({
        notes: notes,
    });
})

module.exports = router;