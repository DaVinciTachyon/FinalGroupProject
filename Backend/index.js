const express = require('express');
const app = express();
const apiRoute = require('./routes/api');
const dotenv = require('dotenv');
const cors = require('cors');

dotenv.config();

mongoose.connect(
    process.env.DB_CONNECT,
    { useNewUrlParser: true, useUnifiedTopology: true },
    () => console.log("Connected To Database")
);
mongoose.set("useFindAndModify", false);
mongoose.set("useCreateIndex", true);

//TODO - create db

app.use(cors());
app.use(express.json());
app.use(express.static('public'));
app.use('/api', apiRoute);

const port = process.env.PORT || 8080;
app.listen(port, () => console.log('Server up and running'));