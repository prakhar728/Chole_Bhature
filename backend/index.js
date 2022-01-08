const express = require('express');
const app = express();
const healthCheckRoute = require('./routes/healthCheck');
const balanceOfRoute= require('./routes/getBalance');
const awardCoinRoute = require('./routes/awardCoins');

const PORT =  process.env.PORT|| 3000 ;

app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use('/healthCheck',healthCheckRoute);
app.use('/balanceOf',balanceOfRoute);
app.use('/awardCoin',awardCoinRoute);
app.listen(PORT,()=>{
    console.log('Server running at ',PORT);
});