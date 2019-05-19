pragma solidity ^0.4.25;
contract iot{
    address public manager;
    address[] public devices;
    address public toAddress;
    string public privateData;
     string public publicData;
    address public fromAddress;
    bool public all = false;

    constructor() public {
        manager = msg.sender;

    }

    /*function enter() public payable{
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }*/

    function enterDevice(address _iotaddress)public restricted{
    devices.push(_iotaddress);

    }

    /*function random() private view returns (uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,now , players)));
    }*/

    function inData(string _data, address _toAddress )public {
       privateData= _data;
       toAddress =_toAddress;
        fromAddress = msg.sender;
    }

    function publishData(string _data)public restricted{
        all = true;
        publicData =_data;

    }


    function readData() public view returns(string){
        require(
            msg.sender==toAddress , "Data is not meant to be read by you");

            return privateData;


    }

    function realAllData() public  view returns(string){
        require(all == true,"Data present is not to be public");

        return publicData;
    }
    /*function pickWinner() public restricted{
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players =new address[](0);
    }*/

    modifier restricted(){
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns( address[]){
        return devices;
    }

}
