const express = require('express');
const router = express.Router();
const {getBalance } = require('./../../web3Wrapper/index');
router.post('/',(req,res)=>{
    getBalance(req.body.userAddress).then(resp=>{
        console.log(`Here\'s the balance of the aaccount address ${req.body.userAddress} balance is ${resp}`);
        res.send(`${resp}`);
    })
    .catch(err=>{
        console.log(err);
        res.send(err);
    })
    
})

module.exports= router;