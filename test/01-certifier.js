const Certifier = artifacts.require('./Certifier')

chai = require('chai')

expect = chai.expect

const willBeRejected = promise => {
  promise
    .then(result => {expect(result).to.be.an('error')})
    .catch(error => {expect(error).to.be.an('error')})
}

const willBeFulfilled = promise => {
  promise
    .then(result => {expect(result).not.be.an('error')})
    .catch(error => {expect(error).not.be.an('error')})
}

contract('Certifier', accounts => {
  describe('Instance', () => {
    it('should get an instance of Certifier', () => {
      Certifier.deployed().then(instance => {
        certifier = instance
        expect(certifier).not.to.be.an('error')
      })
    })
  })
  describe('Flow', () => {
    it('should allow the certifier to create the course and return the tx', () => {
      const response = await certifier.addCourse('Solidity', 'SE', 30, 1, 5, 45, 80, ['a', 'b', 'c', 'xyz', 'abc'], 3);
      expect(response.tx).to.have.length(66);
    });
    it('should avoid other accounts to create courses', () => {
      willBeRejected(certifier.addCourse('Solidity', 'SE', 30, 1, 5, 45, 80, ['a', 'b', 'c', 'xyz', 'abc'], 3, {from: accounts[1]}))
    })
    it('should allow a student to subscribe to a given course', () => {
      willBeFulfilled(certifier.subscribe('SE', 'Pepito', 'Perez', 'CC123', 0, 'p@per.ez', {from: accounts[2], value: 3000000000000000000}));
    });
    it('should fail if value is not exactly 3 ether', () => {
      willBeRejected(certifier.subscribe('SE', 'Pepito', 'Pereza', 'CC124', 0, 'p@per.eza', {from: accounts[3], value: 2700000000000000000}));
    });
    it('should assert true is true', () => {expect(true).to.be.true})
  })
  describe('Finishing', () => {
    it('should assert true is true', () => {expect(true).to.be.true})
  })
})