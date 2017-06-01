# Retrieve expiry date of Provisioning Profile Certificate from .ipa

```
$ unzip -q MyApp.ipa
$ codesign -d --extract-certificates Payload/*.app
$ openssl x509 -inform DER -in codesign0 -noout -nameopt -oneline -dates
```

Output:

The expiry date show as the value of `notAfter`:

```
notBefore=May 21 02:04:15 2008 GMT
notAfter=May 21 02:04:15 2020 GMT
```

References: 
- [Retrieve certificate expiration date from an .ipa file?](https://stackoverflow.com/questions/36453102/retrieve-certificate-expiration-date-from-an-ipa-file)