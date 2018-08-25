const Certifier = artifacts.require('./Certifier');

chai = require('chai');

expect = chai.expect;

contract('Certifier', accounts => {
  describe('Instance', () => {
    it('should get an instance of Certifier', () => {
      Certifier.deployed().then(instance => {
        certifier = instance;
        expect(certifier).not.to.be.an('error');
      })
    });
  });
  describe('Flow', () => {
    it('should allow the certifier to create the course', () => {
      certifier.addCourse('Solidity', 'SE', 30, 1, 5, 45, 80, ['a', 'b', 'c', 'xyz', 'abc'], 3)
        .then(response => {
          expect(reponse.tx).to.match(/\w{66}/)
        })
    });
  });
  describe('Finishing', () => {
    it('should assert true is true');
  })
});