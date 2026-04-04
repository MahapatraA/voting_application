require('dotenv').config();

const express = require("express");
const cors = require("cors");
const app = express();

require('./db');

app.use(cors());         
app.use(express.json());

// routes
const userRoutes = require('./routes/userRoutes');
const candidateRoutes = require('./routes/candidateRoute');

app.use('/user', userRoutes);
app.use('/candidates', candidateRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
