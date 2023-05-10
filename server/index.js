// IMPORT FORM PACKAGES
const express = require('express');
const mongoose = require('mongoose');

// IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth');

// INIT
const PORT = 3000
const app = express();
const DB = 'mongodb+srv://samuel:samuel123@cluster0.u9rbuwr.mongodb.net/?retryWrites=true&w=majority';


// MIDDLEWARE
app.use(express.json());
app.use(authRouter);

// CONNECTIONS
mongoose.connect(DB).then(() => {
    console.log('Connection Successfull');
}).catch((e) => {
    console.log(e);
})

app.listen(PORT, () => {
    console.log(`connected at port ${PORT}`);
})