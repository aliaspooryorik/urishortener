<cfscript>

Encoder = application.NumberEncoder;

// tests
i = 100000;
while (i < 200000) {
  expected = i;
  encoded = Encoder.encode(i);
  actual = Encoder.decode(encoded);
  if (expected != actual) {
    writeoutput("fail: expected #expected# got #actual# (#encoded#)<br>");
  }
  i++;
}

</cfscript>
