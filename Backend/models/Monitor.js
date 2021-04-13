const mongoose = require('mongoose');

module.exports = mongoose.model('Monitor', new mongoose.Schema({
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
    macAddress: {
        type: String,
        unique: true
    },
    firstLogin: {
        type: Boolean,
        default: true
    },
    assistanceRequired: {
        type: Boolean,
        default: false
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