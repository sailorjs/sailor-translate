# Sailor Translate

> Translation for Sailor

Create the interface to make easy use translation in Sailor!

This package is included in Sailor core.

## Usage

```
var translate = require("sailor-translate");
```

## API

```
translate["lang"].<module>.<section>
```

example:

```
translate["en"].User.Password.NotFound
// => "Password not found"

translate["es"].User.Password.NotFound
// => "No se encuentra la contraseña"
```

For use in Sails you can use `req.language` to get the language:

```
translate[req.locale].User.Password.NotFound
// => "Password not found"
```


## License

MIT © [Kiko Beats](http://www.kikobeats.com)


