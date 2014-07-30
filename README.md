# Sailor Translate

[![Build Status](http://img.shields.io/travis/sailorjs/sailor-translate/master.svg?style=flat)](https://travis-ci.org/sailorjs/sailor-translate)
[![Dependency status](http://img.shields.io/david/sailorjs/sailor-translate.svg?style=flat)](https://david-dm.org/sailorjs/sailor-translate)
[![Dev Dependencies Status](http://img.shields.io/david/dev/sailorjs/sailor-translate.svg?style=flat)](https://david-dm.org/sailorjs/sailor-translate#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/sailor-translate.svg?style=flat)](https://www.npmjs.org/package/sailor-translate)
[![Gittip](http://img.shields.io/gittip/Kikobeats.svg?style=flat)](https://www.gittip.com/Kikobeats/)


> Create the interface to make easy use translation in Sailor!


## Usage

This package is included is sails core, but you can use in other proyect with:

```
var translate = require("sailor-translate");
```

## API

### .lang(<language>)

Set up the default language to resolve a key

### .get_lang()

Get the language to translate. By default is 'en'

### .add([Objects..])

Add new object to the Translator. Object structure are based in [angular-translate](https://github.com/angular-translate/angular-translate) objects.


### .get(<key>)


Get a determinate key of the translator. 

First try with the language that the user can be set, later with the default language (en) and finally throw a error is don't found the key.


## Additional

Is possible concatenate actions in the same object. For example.

```
Message = require './Message'
User    = require './User'

result = translate.add(User).lang("en").get("User.Username.Already")
console.log result # => "Username already exist."

```



## License

MIT © [Kiko Beats](http://www.kikobeats.com)


