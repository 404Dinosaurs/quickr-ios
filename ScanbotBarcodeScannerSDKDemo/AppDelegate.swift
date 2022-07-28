//
//  AppDelegate.swift
//  ScanbotBarcodeScannerSDKDemo
//
//  Created by Yevgeniy Knizhnik on 04.12.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        
        // Setup the default license failure handler for demo purposes. In case of expired license or expired trial period it will present an alert dialog.
        // See also the ScanbotSDK.setLicenseFailureHandler(..) to setup a custom handler.
        ScanbotSDK.setupDefaultLicenseFailureHandler()
        
        ScanbotSDK.setLoggingEnabled(true)
        
        // TODO: Add the Scanbot Barcode SDK license key here.
        let LICENSE_KEY =
          "CBlrvq7f7XAEydRnJpPQfI520R8o4r" +
          "6fNYiJCq9026xbs4MS/PZwmJEKMVSM" +
          "XiK+CXPG4XBWm3aJ56KLKoArDvGGvt" +
          "0zU3QDp0euDsedhAmDFBK/E7pG1xcZ" +
          "amtMXCD9Iln8HC1Dh2409kHNKcQdGb" +
          "TulnRUN23jNnXJtlvuKjwkVdUPl2M+" +
          "YNjShxEzn6LZK0nGPJ0IIxA2unIflt" +
          "VWPsVqqre2Lnsn/kkcQlRBE5bLa8ek" +
          "dMqOzFqsmHVZ+mzuX0x0NeCh53zh8e" +
          "eTECtbhPkhLF8tTT2dVV8LqA7NRwaJ" +
          "eLFqFkFOyH+Y6Goqd1/+7cbz7j6WZz" +
          "+cv0NUd1fRXw==\nU2NhbmJvdFNESw" +
          "pjb20uc2h1YmhhbmcucXVpY2tyCjE2" +
          "NTkzOTgzOTkKODM4ODYwNwoz\n";

         ScanbotSDK.setLicense(LICENSE_KEY)

        // Please note: The Scanbot Barcode SDK will run without a license key for one minute per session!
        // After the trial period is over all Scanbot SDK functions as well as the UI components will stop working.
        // You can get an unrestricted "no-strings-attached" 30 day trial license key for free.
        // Please submit the trial license form (https://scanbot.io/en/sdk/demo/trial) on our website by using
        // the app identifier (aka. bundle identifier) "io.scanbot.example.sdk.ios.barcode" of this example app
        // or of your own app (see "Bundle Identifier" in your Xcode project settings).
        //ScanbotSDK.setLicense("YOUR_SCANBOT_SDK_LICENSE_KEY")
        
        return true
    }
}

