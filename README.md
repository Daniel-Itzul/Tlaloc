# Inspiration
I have always liked data analysis and also blockchain technology. This triggered my research of oracles and my interest in learning how to work with Chainlink.

# What it does
Tlaloc is a rain insurance contract. Anyone can request a rain insurance contract by submitting the insured amount, the covered city, the acceptable levels of rain in millimeters, and the prime. Any party that feels the deal is attractive can take the contract by submitting the insured amount. Submission of the insured amount releases the prime to the taker. After the covered time has expired it is possible to trigger the contract confirmation to get the actual levels of rain and define if the insured amount returns to the taker or goes to the requester.

# How I built it
I built it in solidity.

# Challenges I ran into
I couldn't find a chainlink node that provided weather data in the test-net, so I mocked the oracle. Also, I mocked contract expiration.

# Accomplishments that I'm proud of
Disregarding the mocking parts it works.

# What I learned
I learned the basics of working with Chainlink though I was not able to integrate.

# What's next for TLALOC - The Rain Insurance
I will build an external connector to call the API of open weather and make the contract work with full oracle integration. Besides, I will include the time management framework.

# Built With
remix
solidity
Try it out
