# TLALOC

## The What? 

Tlaloc was the God of rain of the ancient Aztects.  

Tlaloc is a framework that allows the creation of precipitation weather hedging by leveraging ChainLink oracles and the open weather map API.

## The Why?

Precipitation is a significant factor for agriculture, without enough rain some crops will yield far less, will be expensive to operate, due to higher irrigation costs, or will simply be lost. For other crops, excessive rain can be problem.

Even outside the realm of agriculture, low precipitation in places like Taiwan would affect the global supply of semiconductors. Foundries being one of the most heavy water consumers in the island. 

Though it is possible to hedge the risks of abnormal precipitation levels through traditional insurance the process takes aditional paperwork and time to settle. Smart contracts and oracles allow to automate the process.

The platform allows parties without the backing of a formal corporate identity to hedge this type of risk.

## The How?

The requesters: Requesters trigger the contract with the following parameters: a location, precipitation range in milimeters, premium in ETH, insured ammount in ETH, covered timeframe, and expiration date.

The takers: Take the contract by submitting the insured ammount to the contract address before the expiration date. Several takers can pool resources to fund the contract.

Once funded with the insured amount the contract releases the premium, or proportional ammount of the premium to the address of the takers. 

After the covered timeframe has passed the oracle is queried about precipitation levels. If precipitation levels are within the specified precipitation range, the contract will proportionally refund the insured ammount to the takers. If the precipitation level is outside of the specified amount, the insured ammount will be transfered to the requester.

Gas fees apply to each transmission of funds to the contract. 
Platform transaction fees apply upon closing of the contract, this include platform fee plus operational fees to pay oracles in link.

