//config

global.config = {
	rpc: {
		host: "localhost",
		port: "8545"
	}
}

//load libraries
global.Web3 = require("web3")
global.fs = require("fs")
global.solc = require("solc")


//connect web3 interface
global.web3 = new Web3(new Web3.providers.HttpProvider(`http://localhost:8545`))

//global accessor accounts
global.acct1 = web3.eth.accounts[0]
global.acct2 = web3.eth.accounts[1]
global.acct3 = web3.eth.accounts[2]
global.acct4 = web3.eth.accounts[3]
global.acct5 = web3.eth.accounts[4]



require("repl").start({})