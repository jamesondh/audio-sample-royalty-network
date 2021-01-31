const { expect } = require("chai");

describe("AudioRoyaltyNetwork", function() {
  it("Should register projects correctly", async function() {
    const AudioRoyaltyNetwork = await ethers.getContractFactory("AudioRoyaltyNetwork");
    const audioRoyaltyNetwork = await AudioRoyaltyNetwork.deploy();
    
    await audioRoyaltyNetwork.deployed();
   
    const allAddresses = await ethers.getSigners();

    let registerProject = await audioRoyaltyNetwork.registerProject("MyFirstProject", [], [], "picture", "blurb", false);
    expect(registerProject);

  });
});
