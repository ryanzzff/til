# Catalina failed to sync iPhone with Finder

## Solution

* kill process `AMPDevicesAgent` in Activity Monitor and try to plugin the iPhone again

## Expected Behavior

* can display the iPhone info in the finder and back it up

## Actual Behavior

* iPhone appeared for a few seconds in Finder's location then disappear
* therefore failed to backup iPhone

Error log:

```text
error    13:48:42.469764+0800    kernel    Sandbox: AMPDeviceDiscove(1256) deny(1) mach-lookup com.apple.softwareupdated
error    13:48:42.559814+0800    AMPDevicesAgent    device 36eab8738ff347598081ccbc37c933cf9e71f4cd not found, adding request to queue
...
error    13:48:43.966976+0800    AMPDevicesAgent    Assertion failure: err == (1100)
...
error    13:48:48.377666+0800    AMPDevicesAgent    Assertion failure: err == (-402653163)
error    13:48:48.453419+0800    AMPDevicesAgent    Assertion failure: err == (-42408)
error    13:48:48.453450+0800    AMPDevicesAgent    Assertion failure: err == (-42408)
error    13:48:48.453598+0800    AMPDevicesAgent    setup> failed to read database for device id 37C933CF9E71F4CD (-42408), device GUID is <private>
error    13:48:48.965780+0800    deleted    unable to create CacheDeleteDaemonVolume for <private>
error    13:48:49.104055+0800    deleted    fs_snapshot_list failed: Operation not supported
error    13:48:49.104082+0800    deleted    Failed to enumerate snapshots for volume <private>: Operation not supported
error    13:48:49.107496+0800    deleted_helper    APFSIOC_GET_PURGEABLE_STATS: Inappropriate ioctl for device
error    13:48:49.272258+0800    AMPDevicesAgent    device 36eab8738ff347598081ccbc37c933cf9e71f4cd not found, adding request to queue
...
error    13:48:50.595524+0800    AMPDevicesAgent    no XPC UI connection after waiting 2.0 seconds!
error    13:48:50.652919+0800    AMPDevicesAgent    Assertion failure: err == (-42408)
error    13:48:50.688035+0800    com.apple.amp.devicesui    error fetching device totals Error Domain=NSCocoaErrorDomain Code=4099 UserInfo={NSDebugDescription=<private>}
error    13:48:50.688126+0800    com.apple.amp.devicesui    fetchTotalsForDevice: Error Domain=NSCocoaErrorDomain Code=4099 UserInfo={NSDebugDescription=<private>}
error    13:48:50.688226+0800    com.apple.amp.devicesui    fetchBatteryInfoForDevice: Error Domain=NSCocoaErrorDomain Code=4099 UserInfo={NSDebugDescription=<private>}
error    13:48:50.688318+0800    com.apple.amp.devicesui    fetchTotalsForDevice: Error Domain=NSCocoaErrorDomain Code=4099 UserInfo={NSDebugDescription=<private>}
error    13:48:50.688409+0800    com.apple.amp.devicesui    fetchBatteryInfoForDevice: Error Domain=NSCocoaErrorDomain Code=4099 UserInfo={NSDebugDescription=<private>}
error    13:48:51.729748+0800    runningboardd    RBSStateCapture remove item called for untracked item 403-149-357 (target:daemon<com.apple.UserNotificationCenterAgent(501)>)
...
error    13:48:55.902677+0800    AMPDevicesAgent    client connection timed out waiting for device 36eab8738ff347598081ccbc37c933cf9e71f4cd
error    13:48:55.903240+0800    AMPDeviceDiscoveryAgent    checkForSyncWhenConnectedForDevice failed: Error Domain=NSOSStatusErrorDomain Code=1119 UserInfo={NSLocalizedDescription=<private>, NSLocalizedRecoverySuggestion=}
```

## Environment

* macOS Catalina 10.15 Beta \(19A546d\)
* iMac \(Retina 5K, 27-inch, Late 2015\)
* iPhone 8 Plus
* iOS 12.4

