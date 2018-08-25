# Solidity I & II: Certifier DApp

## v0.1.0
To start coding for this project we ran the following commands to install `nvm`, `node`, and some `npm` packages.

```bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
exec $SHELL
command -v nvm
nvm install node
exec $SHELL
command -v npm
npm i -g truffle ganache-cli
```

We started a new project by creating an empty folder and running inside it the truffle init command.

```bash
mkdir ~/blockchain/certifier
cd ~/blockchain/certifier
truffle init
```

The last command creates the following folder and files structure

```
.
├── contracts
│   └── Migrations.sol
├── migrations
│   └── 1_initial_migration.js
├── test
├── truffle-config.js
└── truffle.js

```

Inside the project (at its root level) we installed the `chai` npm package as a development dependency.

```bash
npm i -D chai
```

With all of this we started the TDD and BDD process for the `Certifier.sol` smart contract. To do that we've created a file inside the test folder as follows:

```bash
test/01-certifier.js
```

While getting the tests inside it, we've created the contract file as follows:

```bash
contracts/Certifier.sol
```

We also let the local blockchain to know how to deploy the contracts for this app inside the following file:

```bash
migrations/2_deploy_contracts.js
```

To establish the connection to the local blockchain we ran the following command.

```bash
ganache-cli
``` 

And then we modified the file, in order to let truffle how to got a connection to the local blockchain:

```bash
truffle.js
```