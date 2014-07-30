###
# Depedencies
###
Args         = require 'args-js'
_            = require 'lodash'


# -- PRIVATE ------------------------------------------------------------

###
A function to take a string written in dot notation style, and use it to
find a nested object property inside of an object.

Useful in a plugin or module that accepts a JSON array of objects, but
you want to let the user specify where to find various bits of data
inside of each custom object instead of forcing a standardized
property list.

@param String nested A dot notation style parameter reference (ie "urls.small")
@param Object object (optional) The object to search

@return the value of the property in question
###
_getProperty = (propertyName, object) ->
  parts = propertyName.split(".")
  length = parts.length
  i = undefined
  property = object or this
  i = 0
  while i < length
    property = property[parts[i]]
    i++
  property

###
Default language
###
_lang = 'en'

class Translator

  # -- PUBLIC ------------------------------------------------------------

  constructor: (lang) ->
    args = Args([
      {lang: Args.STRING | Args.Optional, _default: _lang}
      ], arguments)

    @_translate = {}
    @_language = args.lang
    this

  get_list: ->
    @_translate

  get_lang: ->
    @_language

  # -- API ------------------------------------------------------------

  ###
  Set up the language to access to the Translator
  ###
  lang: ->
    @_language
    this

  ###
  Add new *object of the Translator
  ###
  add: (objects...)->

    console.log objects

    # _.forEach arguments, (object) ->
      # @_translate = _.assign(@_translate, object)


    @_translate = _.assign(@_translate, object)
    this

  ###
  Get a determinate key of the Translator
  ###
  get: (path) ->
    args = Args([
      {path: Args.STRING | Args.Required}
      ], arguments)

    query = "#{@get_lang()}.#{args.path}"
    result = _getProperty(query, @get_list())

    return result if result isnt undefined

    if @get_lang() isnt _lang
      @lang()
      query = "#{@get_lang()}.#{args.path}"
      result = _getProperty(query, @get_list())
      return result if result isnt undefined

    throw new Error("Translator key doesn't exist");


# -- EXPORTS -------------------------------------------------------------

exports = module.exports = Translator
