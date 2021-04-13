const mongoose = require('mongoose');

module.exports = mongoose.model('Note', new mongoose.Schema({
    monitorID: {
        type: String,
        required: true
    },
    createDate: {
        type: Date,
        default: Date.now(),
        required: true
    },
    editDate: {
        type: Date,
        default: Date.now(),
        required: true
    },
    content: {
        type: String,
        required: true
    }
}));
