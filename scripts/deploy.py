import os
from brownie import network, accounts, config, Hello

def main():
    my_account = accounts.add(os.getenv(config['wallets']['from_key']))
    hello = Hello.deploy({'from': my_account})
    print(hello.address)