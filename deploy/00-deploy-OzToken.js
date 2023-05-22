const { network } = require("hardhat");
const INITIALSUPPLY = "100000000000000000000";
module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;

  const args = [INITIALSUPPLY];
  log("Deploying OzToken Please wait");
  const ozToken = await deploy("OzToken", {
    from: deployer,
    log: true,
    args: args,
  });
  log("OzToken deployed🤗🤗........");
  log(`OzToken deployed at ${ozToken.address}`);
  log("----------------------------------------------");
};

module.exports.tags = ["all", "ozToken"];
