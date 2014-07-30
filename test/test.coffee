
should     = require 'should'
Translator = require '../'
Message    = require './Message'
User       = require './User'

describe 'Translator CRUD', ->

  describe 'Create ::', ->

    it 'created a new translator', ->
      translate = new Translator
      translate.should.be.an.instanceof(Translator)

    it 'empty list of object in the begin', ->
      translate = new Translator
      translate.get_list().should.eql({})

  describe 'Add ::', ->

    it 'added new object to the translator', ->
      translate = new Translator
      translate.add User
      translate.get_list().should.not.empty

    it 'added different objects to the translator', ->
      translate = new Translator
      translate.add User
      translate.add Message
      translate.get_list().should.not.empty

      result = translate.lang("en").get("Message.Status.Error")
      result.should.eql("Error in the mensage.")

  describe 'Language ::', ->

    it 'checked that default language is \'en\'', ->
      translate = new Translator
      translate.get_lang().should.eql('en')

    it 'created a Translator with \'es\' language', ->
      translate = new Translator('es')
      translate.get_lang().should.eql('es')

  describe 'Translate ::', ->

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


describe 'Translator Designed', ->

  describe 'Basic ::', ->

    it 'concatenated actions', ->
      translate = new Translator
      result = translate.add(User).lang("en").get("User.Username.Already")
      result.should.eql("Username already exist.")

    it 'added different object in one action', ->
      translate = new Translator
      result = translate.add(User, Message).lang("en").get("Message.Status.Error")
      result.should.eql("Error in the mensage.")

    it 'throwed Error if is not possible resolve the query', (done)->
      translate = new Translator
      translate.add User
      try
        translate.get("User.Username.Yet")
      catch err
        done()
