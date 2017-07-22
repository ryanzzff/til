# Failed to open Xcode (LSOpenURLsWithRole() failed with error -10699)

## Behavior

- Double click on the Xcode.app did nothing
- Use command line to open an xcode project also did nothing
- Can open Xcode on command line by execute the Xcode binary in /Applications/Xcode.app/Contents/MacOS/

## Solution

Delete Xcode and reinstall from Mac App Store fixes the problem, it may be caused by data corruption during the app update.

## References

- [LSOpenURLsWithRole() failed with error -10699 for the file /applications/safari.app](https://discussions.apple.com/thread/7749277)
