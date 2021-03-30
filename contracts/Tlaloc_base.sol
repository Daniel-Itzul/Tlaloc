pragma solidity ^0.8.1;

contract Tlaloc_base {

    address payable public requester;
    address payable public taker;
//    string public location;
//    uint public precLowMM;
//    uint public precHighMM;
    uint public premiumETH;
    uint public insuredAmountETH;
    uint public amountTakenETH;
//    uint public timeDateStart;
//    uint public timeDateEnd;
//    uint public expirationDate;

    constructor (uint _insuredAmountETH) payable {
        //expirationDate = block.timestamp + 6;
        requester = payable(msg.sender);
        premiumETH = msg.value;
        insuredAmountETH = _insuredAmountETH;
    }


    function take() external payable{
        require(msg.value == insuredAmountETH*10**18, 'you must submit the insured amount');
        taker = payable(msg.sender);
        amountTakenETH == msg.value;
        taker.transfer(premiumETH);
    }

}