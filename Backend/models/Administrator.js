const mongoose = require('mongoose');

module.exports = mongoose.model('Administrator', new mongoose.Schema({
    id: {
        type: String,
        unique: true,
        required: true
    },
    name: {
        type: String,
        min: 3,
        required: true
    },
	email: {
        type: String,
        min: 6,
        required: true
    },
    password: {
        type: String,
        min: 6,
        required: true
    },
    dateJoined: {
        type: Date,
        default: Date.now()
    },
    active: {
        type: Boolean,
        default: true
    }
}));