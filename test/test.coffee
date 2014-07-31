
should     = require 'should'
Translator = require '../'
Message    = require './Message'
User       = require './User'

describe 'Translator', ->

  describe 'Create ::', ->

    it 'created a new translator as \'en\' with default language', ->
      translate = new Translator
      translate.should.be.an.instanceof(Translator)
      translate.get_lang().should.eql('en')

    it 'created a new translator with default language (en)', ->
      translate = new Translator('es')
      translate.should.be.an.instanceof(Translator)
      translate.get_lang().should.eql('es')

    it 'empty list of object in the begin', ->
      translate = new Translator
      translate.get_list().should.eql({})

  describe 'Add ::', ->

    it 'added new object to the translator', ->
      translate = new Translator
      translate.add User
      translate.get_list().should.not.empty
      translate.get('User.Username.NotFound').should.eql('Username not found.')

    it 'added different objects to the translator', ->
      translate = new Translator
      translate.add User
      translate.add Message
      translate.get('User.Username.NotFound').should.eql('Username not found.')
      translate.get('Message.Status.Error').should.eql('Error in the mensage.')

    it 'added different objects to the translator in the same function', ->
      translate = new Translator
      translate.add User, Message
      translate.get('User.Username.NotFound').should.eql('Username not found.')
      translate.get('Message.Status.Error').should.eql('Error in the mensage.')


  describe 'Set ::', ->
    it 'other language as default', ->
      translate = new Translator
      translate.add User, Message
      translate.lang('es')
      translate.get_lang().should.eql('es')
      translate.get('User.Username.NotFound').should.eql('Usuario no encontrado.')
      translate.get('Message.Status.Error').should.eql('Error en el mensaje.')

    it 'other language as default in a concatenate method', ->
      translate = new Translator
      translate.add User, Message
      translate.lang('es').get('User.Username.NotFound').should.eql('Usuario no encontrado.')
      translate.lang('es').get('Message.Status.Error').should.eql('Error en el mensaje.')

  describe 'Get ::', ->
    it 'a value of a key that exist in the default language', ->
      translate = new Translator
      translate.add User, Message
      translate.get('User.Username.Already').should.eql('Username already exist.')

    it 'a value of a key that desn\'t exist in the default language but exist in origin language', ->
      translate = new Translator
      translate.add User, Message
      translate.lang('pt').get('User.Username.Already').should.eql('Username already exist.')

    it 'a value of a key that desn\'t exist ', (done)->
      translate = new Translator
      translate.add User, Message
      try
        translate.lang('pt').get('User.Usernamasdade.Already').should.eql('Username already exist.')
      catch err
        done()
