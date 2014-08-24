/**
 * Dependencies
 */
var CoffeeScript= require("coffee-script");

// Register CoffeeScript if exits
if(CoffeeScript.register) CoffeeScript.register();

var Translator = require('./lib/translator');

/**
 * Exports
 */
module.exports = new Translator();
