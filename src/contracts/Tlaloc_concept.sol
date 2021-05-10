pragma solidity ^0.8.1;

contract Tlaloc_base {

    address payable public requester;
    address payable public taker;
    string public city;
    uint public precLowMM;
    uint public precHighMM;
    uint public premiumETH;
    uint public insuredAmountETH;
    enum State {REQUESTED, TAKEN, COMPLETE}
    State public currState;
    bool public expired;

    constructor (uint _insuredAmountETH, string memory _city, uint _precLowMM, uint _precHighMM ) payable {
        requester = payable(msg.sender);
        premiumETH = msg.value;
        insuredAmountETH = _insuredAmountETH;
        city = _city;
        precLowMM = _precLowMM;
        precHighMM = _precHighMM;
        expired = false;
    }

    function take() external payable{
        require(currState == State.REQUESTED);
        require(msg.value == insuredAmountETH*10**18, 'you must submit the insured amount');
        taker = payable(msg.sender);
        taker.transfer(premiumETH);
        currState = State.TAKEN;
    }
    
    function retrieveWeather() private returns (uint) {
        return 20;
    }
    
    function expireContract() public {
        expired = true;
    }
    
    function confirm() external payable{
        require (expired, 'the contract time should be expired');
        require (currState == State.TAKEN);
        uint actual = retrieveWeather();
        if (actual >= precLowMM && actual <=precHighMM) {
            taker.transfer(address(this).balance);
        }
        else {
            requester.transfer(address(this).balance);
        }
    }
}