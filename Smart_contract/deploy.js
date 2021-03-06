const HDWalletProvider =require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface , bytecode} = require('./compile');

const provider = new HDWalletProvider(
  '"Metmask secret words"',
  'https://rinkeby.infura.io/v3/"Infura api key"'
);

const web3 = new Web3(provider);

const deploy = async() =>{
  const accounts = await web3.eth.getAccounts();
  console.log(accounts);
  console.log('attemptig to deploy from',accounts[0]);
  const result = await new web3.eth.Contract(JSON.parse(interface))
  .deploy({data: '0x' + bytecode})
  .send({gas: '1000000', from: accounts[0]});
  console.log(interface);
  console.log('deployed at', result.options.address);
};
deploy();
