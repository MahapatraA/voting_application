const { isNumber } = require('lodash');
const mongoose = require('mongoose');
//const bcrypt = require('bcrypt');


const cadidateSchema = new mongoose.Schema({
    name:{
        type : String,
        require : true
    },
    age:{
        type: Number,
        require: true
    },
    party:{
        type: String,
        require: true
    },
    votes: [
        {
            user:{
                type: mongoose.Schema.Types.ObjectId,
                ref: 'User',
                require: true
            },
            votedAt:{
                type: Date,
                default: Date.now(),
                require: true
            }
        }
    ],
    voteCount:{
        type: Number,
        default: 0
    }
});

const Candidate = mongoose.model('Candidate', cadidateSchema);
module.exports = Candidate;
