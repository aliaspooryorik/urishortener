component {

  this.datasource = "shortlink";
  this.ormenabled = true;
  this.ormsettings = {
    flushatrequestend = false
    , automanagesession = false
    , cfclocation = "beans/"
  }

  void function onApplicationStart() {
    // Note: it's preferable to use a bean factory
    application.NumberEncoder = new utils.NumberEncoder();
    application.URIShortener = new utils.URIShortener(application.NumberEncoder, "http://" & CGI.SERVER_NAME & "/?");
  }

  void function onRequestStart() {
    if (structkeyexists(url, "reload")) {
      lock scope="application" timeout="20" {
        onApplicationStart();
      }
    }
  }

}
