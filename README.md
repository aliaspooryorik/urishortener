This is an experimental URL shortening project using a database based on
https://github.com/delight-im/ShortURL

If you are looking for a proven CFML URL shortening project have a look
at Tim Cunningham's https://github.com/boltz/CFShorty which uses MongoDB for
storage.

To use this project, create a database table like so:

```
CREATE TABLE IF NOT EXISTS `shortlink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uri` varchar(500) NOT NULL,
  `key` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
```

Shortened URLs are in the format: `domain?uniquekey`. It'll work without the `?`
it's used here to keep the examples simple and working across webservers
without additional configuration.

To stop your API being abused there is an `apikey` set in Application.cfc which
is required to get a shorten URI. For example:

`http://localhost/shortener.cfm?apikey=your_value&uri=https://github.com/aliaspooryorik/urishortener`
