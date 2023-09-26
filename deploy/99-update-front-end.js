const { ethers, network } = require("hardhat")
const fs = require("fs")

 /* const FRONT_END_ADDRESSES_FILE =
    "../nextjs-smartcontract-lottery-fcc/constants/contractAddresses.json" 

    const FRONT_END_ABI_FILE = /* "../BackgroundFactory-smartcontract-frontend/constants/abi.json" 
    
    */

module.exports = async function () {
    if (process.env.UPDATE_FRONT_END) {
        console.log("updating front end...")
        updateContractAddresses()
        updateAbi()
    }
}

async function updateAbi() {
    const raffle = await ethers.getContract("BackgroundFactory")
    fs.writeFileSync(FRONT_END_ABI_FILE, backgroundFactory.interface.format(ethers.FormatTypes.json))
}

async function updateContractAddresses() {
    const backgroundFactory = await ethers.getContract("BackgroundFactory")
    const chainId = network.config.chainId.toString()
    const currentAddresses = JSON.parse(fs.readFileSync(FRONT_END_ADDRESSES_FILE, "utf8"))
    if (chainId in currentAddresses) {
        if (!currentAddresses[chainId].includes(backgroundFactory.address)) {
            currentAddresses[chainId].push(backgroundFactory.address)
        }
    }
    {
        currentAddresses[chainId] = [backgroundFactory.address]
    }
    fs.writeFileSync(FRONT_END_ADDRESSES_FILE, JSON.stringify(currentAddresses))
}

module.exports.tags = ["all", "frontend"]
