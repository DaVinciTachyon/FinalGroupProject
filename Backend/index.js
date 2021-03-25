const dotenv = require('dotenv');
const mongoose = require('mongoose');
const express = require('express');
const cors = require('cors');
const apiRoute = require('./routes/api');
const app = express();

dotenv.config();

mongoose.connect(
    process.env.DB_CONNECT,
    { useNewUrlParser: true, useUnifiedTopology: true },
    (err) => {
        if(err)
            console.log(err);
        else
            console.log("Connected To Database");
    }
);
mongoose.set("useFindAndModify", false);
mongoose.set("useCreateIndex", true);

app.use(cors());
app.use(express.json());
// app.use(express.static('public'));
app.use('/api', apiRoute);

const port = process.env.PORT || 3030;
app.listen(port, () => console.log('Server up and running'));