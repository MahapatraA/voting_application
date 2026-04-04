const express = require('express');
const router = express.Router();

const User = require('../models/user');
const { generateToken } = require('../jwt');

// SIGNUP
router.post('/signup', async (req, res) => {
  try {
    const user = new User(req.body);
    const savedUser = await user.save();

    const token = generateToken({ id: savedUser._id });

    res.status(201).json({ token });
  } catch (err) {
    console.error('Signup error:', err);
    res.status(500).json({ error: err.message });
  }
});

// LOGIN
router.post('/login', async (req, res) => {
  try {
    const { aadharId, password } = req.body;

    const user = await User.findOne({ aadharId });
    if (!user) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    const isMatch = await user.comparePassword(password);
    if (!isMatch) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    const token = generateToken({ id: user._id });

    res.json({ token });
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
