import { ethers } from 'ethers';
import React, { useState } from 'react';
import CholeBhature from '../abi/CholeBhature.json'

function Index() {
    const [address, setaddress] = useState('0');
    const [gotAccount, setgotAccount] = useState(false);
    const [error, seterror] = useState(null);
    const [provider, setprovider] = useState(null);
    const [signer, setsigner] = useState(null);
    const [contract, setcontract] = useState(null);
    const [txHash, settxHash] = useState(null);
    const [balance, setbalance] = useState(0);
    const [amount, setamount] = useState('0');
    const [sendAddress, setsendAddress] = useState('0');
    const [writeContract, setwriteContract] = useState(null)
    const connectTotheWallet = (e) => {
        e.preventDefault();
        if (window.ethereum) {
            window.ethereum.request({ method: "eth_requestAccounts" })
                .then(result => {
                    accountChangeHandler(result[0]);
                    setgotAccount(true);
                })
        } else {
            console.log('Install metamask');
            seterror('Install metamask');
        }
        console.log('Connecting to the wallet');
    }

    const accountChangeHandler =async (newAccount) => {
        setaddress(newAccount);
        await updateBalance(newAccount);
    }
    const updateBalance = async (newAccount) => {
        // let tempProvider = new ethers.providers.JsonRpcProvider('https://rpc-mumbai.maticvigil.com/v1/8672801189d10b2b2b6d4a3fae5c9e166a94c96f');
         let tempProvider = new ethers.providers.Web3Provider(window.ethereum);
        setprovider(tempProvider);
        // let tempSigner = tempProvider.getSigner('0xc9c59b672d75871adb234eb083b44dba3dd3c19f');
         let tempSigner = tempProvider.getSigner()
         await window.ethereum.enable();
        setsigner(tempSigner);
        let tempContract = new ethers.Contract('0x17BDD4610331654e7fC1443BA42d15DD00394C5a',CholeBhature.abi,tempSigner);
        let writeTempContract = new ethers.Contract('0x17BDD4610331654e7fC1443BA42d15DD00394C5a',CholeBhature.abi,tempProvider)
        setwriteContract(writeTempContract);
        setcontract(tempContract);
        let currentBalance = await tempContract.balanceOf(newAccount);
        console.log(currentBalance.toNumber());
        setbalance(currentBalance);
    }
    const handleSubmit = (e) =>{
        e.preventDefault();
        contract.transfer(sendAddress,amount)
        .then(res=>{
            console.log(res);
        })
        .catch(err=>
            {console.log(err);
            })
        console.log(amount,sendAddress);
    }
    return (
        <div>
            <div>
            {gotAccount && `Address is ${address}`}
            {!gotAccount && <button onClick={connectTotheWallet}>Connect to your Wallet</button>}
            {error}
            </div>
            <div>
            {balance && `Balance is ${balance}`}
            </div>
            <div>
                <form>
                    <label>Enter the amount</label>
                    <input value={amount} onChange={(e)=>setamount(e.target.value)}/>
                    <label>Enter the address</label>
                    <input value={sendAddress} onChange={(e)=>setsendAddress(e.target.value)}/>
                    <button type="submit" onClick={handleSubmit}>Submit</button>
                </form>
            </div>
            <div>
                {txHash}
                </div>
        </div>
    )
}

export default Index
