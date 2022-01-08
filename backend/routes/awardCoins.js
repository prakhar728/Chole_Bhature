const express = require('express');
const router = express.Router();
const {awardCoin } = require('./../../web3Wrapper/index');

router.post('/',(req,res)=>{
    console.log(awardCoin(req.body.address,req.body.amount));
    console.log(`The coins awarded are ${req.body.numberofToken} to ${req.body.userAddress}`);
    res.send(`The coins awarded are ${req.body.numberofToken} to ${req.body.userAddress}`);
})

module.exports= router;