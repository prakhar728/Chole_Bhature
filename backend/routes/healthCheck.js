const express = require('express');
const router = express.Router();

router.get('/',(req,res)=>{
    console.log('This server is on!!');
    res.send('This server is on!!');
})

module.exports= router;