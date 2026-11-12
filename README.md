# SeatGeekSDK Demo

SeatGeekSDK Demo repository contains basic examples of how to integrate and use the [SeatGeek iOS SDK](https://github.com/seatgeek/seatgeek-ios-sdk) in an iOS app, including both UIKit and SwiftUI examples.

For the SeatGeek SDK documentation, please refer to our [developer documentation](https://developer.seatgeek.com/).

![ios](https://img.shields.io/cocoapods/p/ios?color=lightgrey)

## Requirements
- iOS 17.5+
- XCode 26+

## Installation & Usage

1. Pull down the repository and open `SDKDemo.xcodeproj` in Xcode.
2. Fill in your client details before running the project. The two demos show the two ways to configure the SDK:
   - The SwiftUI demo configures it in code. Fill in your `clientId`, `instanceName` and `redirectURI` in the `SeatGeek.configure(...)` call in `SDKDemo/SeatGeekView.swift`.
   - The UIKit demo reads them from Info.plist. Fill in your `ClientId`, `InstanceName` and `RedirectURI` in `SDKDemo-UIKit/Info.plist`.

- Use the `SDKDemo` target to run the SwiftUI demo app.
- Use the `SDKDemo-UIKit` target to run the UIKit demo app.

## Communication
If you have any questions, please contact us via Slack for details.
