# Redirect to Settings Page

## TLDR;

```text
// iOS 8/9
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];

// iOS 10 or later
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"App-Prefs:root=WIFI"]];
```

### iOS 9.2 need to add URL schemes `prefs`

```text
Go to Project settings --> Info --> URL Types --> Add New URL Schemes
```

* [https://stackoverflow.com/a/35987082](https://stackoverflow.com/a/35987082)

Redirect to Settings Page by `[UIApplication:openURL:]`:

```text
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:<path_to_settings>]];
```

## Format of the values for `<path_to_settings>`:

### For iOS 8/9

```text
pref:<path>
```

### For iOS 10 or later

```text
App-Prefs:<path>
```

## Some of the possible values for the path

```text
UIApplicationOpenSettingsURLString
root=General&path=About
root=AIRPLANE_MODE
root=Privacy&path=CAMERA
```

* [List of Settings Path \| StackOverflow](http://stackoverflow.com/a/38114529/3869284)
* [List of Settings Path \| PASTEBIN](https://pastebin.com/SrhqHjth)

## Will the app be rejected by Apple?

Still unclear but researched some of the cases:

* [iOS App Rejected because of settings redirection](http://stackoverflow.com/questions/37177928/ios-app-rejected-because-of-settings-redirection)
* [Custom URL Scheme for Setting on iOS 10?](https://forums.developer.apple.com/thread/49664)

