const mongoose = require('mongoose');

module.exports = mongoose.model('Form', new mongoose.Schema({
    //TODO - monitorID
    incidentDate: {
        type: Date,
        default: Date.now(),
        required: true
    },
    attentionDate: {
        type: Date,
        default: Date.now(),
        required: true
    },
    gender: {
        type: String,
        enum: ['male', 'female'],
        required: true
    },
    ageRange: {
        type: String,
        enum: ['0-9', '10-19', '20-29', '30-39', '40-49', '50+'],
        required: true
    },
    community: {
        type: String,
        required: true
    },
    seekedAttention: {
        information: {
            type: Boolean,
            default: false
        },
        legal: {
            type: Boolean,
            default: false
        },
        psychosocial: {
            type: Boolean,
            default: false
        },
        medical: {
            type: Boolean,
            default: false
        },
        other: {
            type: Boolean,
            default: false
        }
    },
    offeredAttention: {
        information: {
            type: Boolean,
            default: false
        },
        legal: {
            type: Boolean,
            default: false
        },
        psychosocial: {
            type: Boolean,
            default: false
        },
        medical: {
            type: Boolean,
            default: false
        },
        refuge: {
            type: Boolean,
            default: false
        },
        other: {
            type: Boolean,
            default: false
        }
    },
    referredAttention: {
        legal: {
            type: Boolean,
            default: false
        },
        psychosocial: {
            type: Boolean,
            default: false
        },
        medical: {
            type: Boolean,
            default: false
        },
        other: {
            type: Boolean,
            default: false
        }
    },
    rightDenied: {
        economicResources: {
            type: Boolean,
            default: false
        },
        opportunities: {
            type: Boolean,
            default: false
        },
        education: {
            type: Boolean,
            default: false
        },
        healthcare: {
            type: Boolean,
            default: false
        },
        resourceConflict: {
            type: Boolean,
            default: false
        },
        other: {
            type: Boolean,
            default: false
        },
    },
    classification: {
        physical: {
            hitting: {
                type: Boolean,
                default: false
            },
            pushing: {
                type: Boolean,
                default: false
            },
            choking: {
                type: Boolean,
                default: false
            },
            burning: {
                type: Boolean,
                default: false
            },
            weaponUsage: {
                type: Boolean,
                default: false
            },
            acid: {
                type: Boolean,
                default: false
            },
            painfulAttack: {
                type: Boolean,
                default: false
            }
        },
        psychological: {
            violenceThreats: {
                type: Boolean,
                default: false
            },
            murderThreats: {
                type: Boolean,
                default: false
            },
            intimidation: {
                type: Boolean,
                default: false
            },
            humiliation: {
                type: Boolean,
                default: false
            },
            isolation: {
                type: Boolean,
                default: false
            },
            stalking: {
                type: Boolean,
                default: false
            },
            verbalHarrassment: {
                type: Boolean,
                default: false
            },
            unwantedAttention: {
                type: Boolean,
                default: false
            },
            nonVerbalThreats: {
                type: Boolean,
                default: false
            },
            propertyDestruction: {
                type: Boolean,
                default: false
            },
            custody: {
                type: Boolean,
                default: false
            },
            childThreats: {
                type: Boolean,
                default: false
            }
        },
        sexual: {
            genitalTouching: {
                type: Boolean,
                default: false
            },
            genitalMutilation: {
                type: Boolean,
                default: false
            },
            attemptedRape: {
                type: Boolean,
                default: false
            },
            rape: {
                type: Boolean,
                default: false
            }
        },
        forcedMarriage: {
            type: Boolean,
            default: false
        }
    },
    perpetrator: {
        gender: {
            type: String,
            enum: ['male', 'female'],
            required: true
        },
        isKnown: {
            type: Boolean,
            default: false,
            required: true
        },
        relationship: {
            type: String,
            enum: ['current partner', 'former partner', 'relative', 'neighbour', 'friend', 'association', 'other' ]
        }
    }
}));