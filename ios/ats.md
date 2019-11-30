# ats

## App Transport Security \(ATS\)

### Overview

App Transport Security \(ATS\) means the App must connect to server with HTTPS connections. In the past, we can add an ATS key in the plist to ignore this requirement. However, ATS is required for all apps as of JAN 2017.

### Exception

You can add the following ATS keys in the plist, but must provide justifications to explain why you need it.

* NSAllowsArbitraryLoads \(available &gt;= iOS 9\)
* NSAllowsArbitraryLoadsForMedia \(available &gt;= iOS 10\)
* NSAllowsArbitraryLoadsInWebContent \(available &gt;= iOS 10\)
* NSExceptionAllowsInsecureHTTPLoads \(available &gt;= iOS 10\)
* NSExceptionMinimumTLSVersion \(available &gt;= iOS 10\)

if NSAllowsArbitraryLoadsForMedia or NSAllowsArbitraryLoadsInWebContent is provided, NSAllowsArbitraryLoads will be ignored. NSAllowsArbitraryLoadsForMedia - if YES, disables all ATS restrictions for media loaded using APIs from the AV Foundation framework

### Diagnose ATS Connection Issues

use `nscurl` to check if the URL is ATS enabled

```text
nscurl --ats-diagnostics [--verbose] URL
```

examples:

```text
nscurl --ats-diagnostics --verbose https://apple.com
```

## References

* [Plist Key \| Apple Developer](https://developer.apple.com/library/prerelease/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW59)
* [App Transport Security Exception for AVFoundation \| Apple Developer Forums](https://forums.developer.apple.com/thread/51612)
* [App Transport Security REQUIRED January 2017 \|  Apple Developer Forums](https://forums.developer.apple.com/thread/48979)

