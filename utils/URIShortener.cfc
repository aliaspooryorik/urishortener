component {

    public any function init(required NumberEncoder, required domain) {
      variables.NumberEncoder = arguments.NumberEncoder;
      variables.domain = arguments.domain;
      return this;
    }

    public string function shorten(required string uri) {
      var ShortLink = "";
      transaction {
        ShortLink = entityLoad("ShortLink", {uri=arguments.uri}, true);
        if (isnull(ShortLink)) {
          ShortLink = entityNew("ShortLink");
          ShortLink.setURI(arguments.uri);

          entitySave(ShortLink);

          // need to save it to get the primary key set
          // by the database as may be running in a cluster

          transaction action="commit";
          var key = variables.NumberEncoder.encode(ShortLink.getID());
          ShortLink.setKey(key);

          transaction action="commit";
        }
      }
      return variables.domain & ShortLink.getKey();
    }

    public string function getByKey(required string key) {
      ShortLink = entityLoad("ShortLink", {key=arguments.key}, true);
      if (!isNull(ShortLink)) {
        return ShortLink.getURI();
      }
      return variables.domain & "404.html";
    }

}
