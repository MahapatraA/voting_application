const mongoose = require('mongoose');
require('dotenv').config();

// MongoDB connection URL
const mongoURL = process.env.MONGODB_URL_LOCAL;

mongoose.connect(mongoURL)
  .then(() => {
    console.log('Connected to MongoDB server');
  })
  .catch((err) => {
    console.error('MongoDB connection error:', err);
  });

// Connection events (optional but good practice)
const db = mongoose.connection;

db.on('disconnected', () => {
  console.log('MongoDB disconnected');
});

module.exports = db;
