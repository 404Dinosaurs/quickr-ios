# Scanbot Barcode Scanner SDK Example App for iOS

This example app shows how to integrate the [Scanbot Barcode Scanner SDK for iOS](https://scanbot.io/developer/ios-barcode-scanner-sdk/).


## What is Scanbot Barcode Scanner SDK?

Scanbot Barcode Scanner SDK is a simple to use high level API, providing a collection of classes and functions 
for scanning and parsing 1D and 2D barcodes from your mobile device's camera or other image sources like your photo library.


### Supported Barcode Types


- [1D codes](https://scanbot.io/products/barcode-software/1d-barcode-scanner/): [Code 39](https://scanbot.io/products/barcode-software/1d-barcode-scanner/code-39/), [Code 93](https://scanbot.io/products/barcode-software/1d-barcode-scanner/code-93/), [Code 128](https://scanbot.io/products/barcode-software/1d-barcode-scanner/code-128/), [Codabar](https://scanbot.io/products/barcode-software/1d-barcode-scanner/codabar/), [UPC-E](https://scanbot.io/products/barcode-software/1d-barcode-scanner/upc/), [ITF](https://scanbot.io/products/barcode-software/1d-barcode-scanner/itf/), [EAN-8](https://scanbot-sdk.com/products/barcode-software/1d-barcode-scanner/ean/), [EAN-13](https://scanbot-sdk.com/products/barcode-software/1d-barcode-scanner/ean/), [UPC-A](https://scanbot.io/products/barcode-software/1d-barcode-scanner/upc/)
- [2D codes](https://scanbot.io/products/barcode-software/2d-barcode-scanner/): [QR-Code](https://scanbot.io/products/barcode-software/2d-barcode-scanner/qr-code/), [Aztec](https://scanbot.io/products/barcode-software/2d-barcode-scanner/aztec/), [PDF-417](https://scanbot.io/products/barcode-software/2d-barcode-scanner/pdf417/), [Data Matrix](https://scanbot.io/products/barcode-software/2d-barcode-scanner/data-matrix/)

Also check out our blog post [Types of barcodes](https://scanbot.io/blog/types-of-barcodes/).


### Supported Data Parsers:

- From PDF-417 barcodes: AAMVA data coded on US driver's licenses, Boarding Pass data, German Medical Certificates data, ID Cards data.
- From Data Matrix codes: XML data coded in Medical Plans (German Medikationsplan).
- From QR-Codes: VCard data, SEPA payform data.

For more details please refer to the SDK documentation.


## Documentation

👉 [Scanbot Barcode Scanner SDK documentation](https://docs.scanbot.io/barcode-scanner-sdk/ios/introduction/)


## How to run this example app?

Make sure you have the latest versions of [Xcode](https://developer.apple.com/xcode/) and [CocoaPods](https://cocoapods.org) installed.

- Clone this repository to a local folder
- run `pod install --repo-update`
- Open `ScanbotBarcodeScannerSDKDemo.xcworkspace` (not `.xcodeproj`!) with Xcode, build and run


## Please note

The Scanbot Barcode Scanner SDK will run without a license for one minute per session!

After the trial period has expired, all SDK functions as well as the UI components will stop working.
You have to restart the app to get another trial period.

To get a free "no-strings-attached" trial license, please submit the [Trial License Form](https://scanbot.io/trial/) on our website.