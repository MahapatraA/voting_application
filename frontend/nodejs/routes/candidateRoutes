const express = require('express');
const router = express.Router();

const Candidate = require('../models/candidate');
const User = require('../models/user');
const { jwtAuthMiddleware } = require('../jwt');

/**
 * GET all candidates
 * Public (used by Flutter voting screen)
 */
router.get('/', async (req, res) => {
  try {
    const candidates = await Candidate.find({}, 'name party votes');
    res.status(200).json(candidates);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

/**
 * POST vote for a candidate
 * Protected (JWT)
 */
router.post('/vote/:candidateId', jwtAuthMiddleware, async (req, res) => {
  console.log('VOTE API HIT by user:', req.user.id);
  try {
    const candidateId = req.params.candidateId;
    const userId = req.user.id;

    const candidate = await Candidate.findById(candidateId);
    if (!candidate) {
      return res.status(404).json({ error: 'Candidate not found' });
    }

    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    if (user.role === 'admin') {
      return res.status(403).json({ error: 'Admin cannot vote' });
    }

    if (user.isVoted) {
      return res.status(400).json({ error: 'User has already voted' });
    }

    // record vote
    candidate.votes.push({ user: userId });
    candidate.voteCount++;
    await candidate.save();

    // update user
    user.isVoted = true;
    await user.save();

    res.status(200).json({ message: 'Vote recorded successfully' });

  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

/**
 * GET vote count result
 */
router.get('/vote/count', async (req, res) => {
  try{
        // Find all candidates and sort them by voteCount in descending order
        const candidate = await Candidate.find().sort({voteCount: 'desc'});

        // Map the candidates to only return their name and voteCount
        const voteRecord = candidate.map((data)=>{
            return {
                party: data.party,
                count: data.voteCount
            }
        });

        return res.status(200).json(voteRecord);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
