/**
 * Dependencies
 */
var should    = require("should");
var assert    = require("assert");


var translate = require('../');
var msg_en    = 'Password not found';
var msg_es    = 'Contraseña no encontrada';

// console.log(translate);
/**
 * Tests
 */
describe('API', function() {

  describe('Access to a property that exist in a one language', function() {

    it('should be \'' + msg_en + '\'', function() {
      translate["en"].User.Password.NotFound.should.eql(msg_en);
    });

    it('should be \'' + msg_es + '\'', function() {
      translate["es"].User.Password.NotFound.should.eql(msg_es);
    });

  });

});
