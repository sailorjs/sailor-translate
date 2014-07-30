
should     = require 'should'
Translator = require '../'
Message    = require './Message'
User       = require './User'
assert     = require 'assert'

describe 'Translator', ->

  it 'created a new translator', ->
    translate = new Translator
    translate.should.be.an.instanceof(Translator)

  it 'empty list of object in the begin', ->
    translate = new Translator
    translate.get_list().should.eql({});

  it 'added new object to the translator', ->
    translate = new Translator
    translate.add User
    translate.get_list().should.not.empty

  it 'checked that default language is \'en\'', ->
    translate = new Translator
    translate.get_lang().should.eql('en');

  it 'created a Translator with \'es\' language', ->
    translate = new Translator('es')
    translate.get_lang().should.eql('es');

  it 'translated specifing the language and the key exists', ->
    translate = new Translator
    translate.add User
    result = translate.lang("en").get("User.Username.Already")
    result.should.eql("Username already exist.")

  it 'translated without specifing the language and the key exists', ->
    translate = new Translator
    translate.add User
    result = translate.get("User.Username.Already")
    result.should.eql('Username already exist.')

  it 'tried to translate when language specifing language doesnt exists but is possible translate with the default language', ->
    translate = new Translator
    translate.add User
    result = translate.lang("pt").get("User.Username.Already")
    result.should.eql("Username already exist.")

  it 'Works with different objects without problems', ->
    translate = new Translator
    translate.add User
    result = translate.lang("pt").get("User.Username.Already")
    result.should.eql("Username already exist.")

  xit "Singleton Pattern to access", ->

  xit 'throwed Error if is not possible resolve the query', ->
    translate = new Translator
    translate.add User
    assert.throws translate.get("User.Username.Yet"), Error, "Translator key doesn't exist"

