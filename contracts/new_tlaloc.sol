pragma solidity ^0.8.1;
contract Tlaloc_base {
/* define contract statuses and global contract admin
- REQUESTED (Contract requested 5% of insurance amount submitted by requester)
- AWAITING_TAKERS (No potential takers submitted offers)
- SELECTING_TAKER (When at least one taker has submitted offer)
- AWAITING_PRIME (If the prime required by the selected taker is greater than 4.5% of the insured amount, the buyer should post the difference to the contract escrow)
- AWAITING_FUNDING (When the total of the prime required by the selected taker is placed into escrow)
- STARTED (From the time insured amount is placed into escrow and the prime paid to the selected taker)
- COMPLETED (When the condition has been verified and according to the result the insured amount was returned to the taker or transfered to the requester)
*/

    enum contractState {REQUESTED, AWAITING_TAKERS, SELECTING_TAKER, AWAITING_PRIME, AWAITING_FUNDING, STARTED, COMPLETED}
    enum offerState {OFFERED, ACCEPTED, PAID}
    address payable public contractsAdmin;
    uint currID;


/* define rain insurance contract elements 

*/
   struct offer{
        uint offerID;
        address payable offerer;
        offerState currOfferState;
        uint premiumAmount;
    }
    
    struct rainContract {
        uint rainContractId;
        address payable requester;
        contractState currConState;
        uint observLower;
        uint observHigher;
        uint preciptLower;
        uint preciptHigher;
        uint insuredAmount;
        uint balance;
    }
    
    rainContract[] public rainContracts;

/* contract workflow
- requester submit request to create the scrow by depositing 5% of the insured amount, 0.5% goes to the platform, 4.5% is a deposit for the prime.
- potential takers send offers to cover the insured ammounts for a given prime amount (this can be done offchain the production in a centralized database to reduce costs)
- requester selects one of the takers 
- if the prime required by the selected taker is equal or lower than 4.5% of the insured amount the contract goes to AWAITING_FUNDING stage if not it goes to AWAITING_PRIME
- if contract is in AWAITING_PRIME stage the requester must submit the amount needed to complete the prime to the contract.
- if contract is in AWAITING_FUNDING stage the taker can submit the insured ammount in order to START the contract.
- selected taker submits the insured ammount to escrow contract state changes to STARTED
- after the observation range has passed the contract calls the oracle 
- if the observed precipitation is within the expected range then the insured ammount is returned to the taker, if the observed precipitation is outside the expected range the insured ammount goes to the requester
*/
    constructor (address payable _contractsAdmin) {
        contractsAdmin = _contractsAdmin;
        currID = 0;
    }
    
    function requestContract (address payable _requester, uint _observLower, uint _observHigher, uint _pLower, uint _pHigher, uint _insuredAmount) payable public {
        //require(msg.value >= _insuredAmount*50*10**15);
        rainContracts.push(
            rainContract({rainContractId: currID+1, 
            requester: _requester, 
            observLower: _observLower,
            observHigher:_observHigher,
            preciptLower: _pLower,
            preciptHigher: _pHigher,
            insuredAmount: _insuredAmount,
            balance: _insuredAmount*10**15*45,
            currConState: contractState.REQUESTED
            })    
        );
        currID += 1;
//        return rainContracts[uint(currID-1)];
    }
}
    
    