###
# Depedencies
###
Args = require 'args-js'
_    = require 'lodash'


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

  # -- API ------------------------------------------------------------

  default: ->
    _lang

  lang: (language) ->
    return @_language unless language?
    @_language = language
    this

  add: (objects...)->
    for object in objects
      result = _.merge(@_translate, object)

    this

  get: (path) ->
    return @_translate unless path?

    query = "#{@_language}.#{path}"
    try _getProperty("#{@_language}.#{path}", @_translate)
    catch err
      query = "#{_lang}.#{path}"
      try _getProperty(query, @_translate)
      catch e
        throw new Error("Translator error: the key '#{path}' doesn't exist")

# -- EXPORTS -------------------------------------------------------------

exports = module.exports = Translator
