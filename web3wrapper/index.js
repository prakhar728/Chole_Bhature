const abiPresent = require('../blockchain/build/contracts/CholeBhature.json');
const Web3 = require('web3');
const dotenv = require('dotenv');

dotenv.config();
// Sign up for a free dedicated RPC URL at https://rpc.maticvigil.com/ or other hosted node providers.
const web3 = new Web3('https://rpc-mumbai.maticvigil.com/v1/8672801189d10b2b2b6d4a3fae5c9e166a94c96f');

const contract = new web3.eth.Contract(abiPresent.abi, '0x12E0F4C28F8B4D043e42C80b3Eb8ea85B65F5F22');
const account = web3.eth.accounts.privateKeyToAccount('0x' + process.env.privateKey);
;
web3.eth.accounts.wallet.add(account);
web3.eth.defaultAccount = account.address;

 const getBalance = (address)=>{
    return new Promise((res,rej)=>{
        contract.methods.balanceOf(address).call((err,resp)=>{
            if(err)
            rej(err);
            else{
            console.log('The balance is',resp);
          res(resp);
            }
        })
    })
}

const awardCoin = (address,amount)=>{
    return new Promise((res,rej)=>{
        contract.methods.transfer(address,amount).send( { from :account.address,
            gas:200000})
            .then((resp) => {
                if (resp) {
                    console.log(resp);
                    res(resp)
                }
            })
            .catch(err => {
                rej(err);
                  })
    })
}


module.exports = {getBalance, awardCoin};