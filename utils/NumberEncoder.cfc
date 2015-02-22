component {

  public any function init() {
    variables.characters = "abcdefghjkmnopqrstuvwxyz23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
    variables.base = variables.characters.length();
    return this;
  }

  public string function encode(required numeric id) {
    var result = "";
    var num = arguments.id;
    while (num > 0) {
      result = variables.characters.charAt(javacast("int", (num % variables.base))) & result;
      num = int(num / variables.base)
    }
    return reverse(result);
  }

  public numeric function decode(required string id) {
    var num = 0;
    var pos = 0;
    var code = reverse(arguments.id);
    for (var i = 0;i < code.length(); i++){
      pos = variables.characters.indexOf(code.charAt(javacast("int", i)));
      num = (num * variables.base) + pos;
    }
    return num;
  }
}
