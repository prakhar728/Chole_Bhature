const express = require('express');
const router = express.Router();

router.post('/', (req, res) => {
    console.log(`Amount of coins to be transferred are ${req.body.numberOfTokens} to address ${req.body.userAddress}`);
    res.send(`Amount of coins to be transferred are ${req.body.numberOfTokens} to address ${req.body.userAddress}`);
})

module.exports = router;