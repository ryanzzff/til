# CocoaPods save project.pbxproj file in XML plist format on Xcode 7.3.1

## Environment

* OSX El Capitan
* Xcode 7.3.1
* CocoaPods 0.39.0

## XML plist Vs ASCII plist format

Both format are same for Xcode to read. For better merge/diff the file, prefer to use ASCII format, as it is used when a new Xcode project is created.

### ASCII plist

```text
$ head project.pbxproj
// !$*UTF8*$!
{
    archiveVersion = 1;
    classes = {
    };
    objectVersion = 46;
    objects = {

/* Begin PBXBuildFile section */
        2D5A0C331C9AE8D20056183D /* main.m in Sources */ = {isa = PBXBuildFile; fileRef = 2D5A0C321C9AE8D20056183D /* main.m */; };
```

### XML plist

```text
$ plutil -convert xml1 project.pbxproj
$ head project.pbxproj
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>archiveVersion</key>
    <string>1</string>
    <key>classes</key>
    <dict/>
    <key>objectVersion</key>
    <string>46</string>
```

## Conversion

### ASCII format to XML format

```text
$ plutil -convert xml1 project.pbxproj
```

### XML format to ASCII format

```text
$ brew install xcproj
$ xcproj touch
```

## Force CocoaPods to use ASCII format

At the end of Podfile, add the following line:

```text
system 'xcproj touch'
```

## References

* [CocoaPods 0.34.1 leaves pbxproject file in XML plist format](https://github.com/CocoaPods/CocoaPods/issues/2530#issuecomment-219663486)
* [Generate ASCII format xcodeproj](https://github.com/CocoaPods/CocoaPods/wiki/Generate-ASCII-format-xcodeproj)
* [Running command line commands within Ruby script](http://stackoverflow.com/a/3159997/3869284)

