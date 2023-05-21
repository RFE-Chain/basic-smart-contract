(async () => {
    let accounts = await web3.eth.getAccounts();
    console.log("Accounts: ", accounts);
    console.log("Accounts 1:", accounts[0]);
    let balance = await web3.eth.getBalance(accounts[0])
    console.log("Wei Balance:", balance);
    let ether = web3.utils.fromWei(balance.toString(), 'ether')
    console.log("ETH Balance:", ether);
})();