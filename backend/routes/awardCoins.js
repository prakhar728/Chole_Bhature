const express = require('express');
const router = express.Router();
const {awardCoin } = require('../wrapper');

router.post('/',(req,res)=>{
    awardCoin(req.body.userAddress ,req.body.numberofToken).then(
        resp=>
       { console.log(resp,'Awarded succesfully');
           res.status(200).send(resp.transactionHash);}
    )
    .catch(err=>
    { console.log('Error Found');
           console.log(err);
           res.status(400).send(err)})
    
})

module.exports= router;