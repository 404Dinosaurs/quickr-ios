//
//  SBSDKBarcodeScannerViewController.h
//  ScanbotSDK
//
//  Created by Yevgeniy Knizhnik on 29.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBSDKBaseScannerViewController.h"
#import "SBSDKBarcodeScanner.h"
#import "SBSDKBarcodeImageGenerationType.h"
#import "SBSDKBarcodeAdditionalParameters.h"

@class SBSDKBarcodeScannerViewController;
/**
 * A delegate protocol to customize the behavior, look and feel of the SBSDKBarcodeScannerViewControllerDelegate.
 */
@protocol SBSDKBarcodeScannerViewControllerDelegate <NSObject>
@optional
/**
 * Asks the delegate if the receiver should detect barcodes.
 * Optional.
 * @param controller The calling SBSDKBarcodeScannerViewController.
 */
- (BOOL)barcodeScannerControllerShouldDetectBarcodes:(nonnull SBSDKBarcodeScannerViewController *)controller;

/**
 * Informs the delegate that the receiver has detected some barcodes.
 * Optional.
 * @param controller The calling SBSDKBarcodeScannerViewController.
 * @param codes Array of SBSDKBarcodeScannerResult containing the detected barcodes.
 * @param image The image the barcodes have been detected on. The image is cropped to the visible area on the screen 
 * and to the view finder rectangle, if a view finder is enabled. 
 */
- (void)barcodeScannerController:(nonnull SBSDKBarcodeScannerViewController *)controller
               didDetectBarcodes:(nonnull NSArray<SBSDKBarcodeScannerResult *> *)codes
                         onImage:(nonnull UIImage *)image;


/**
 * Returns captured barcode image. Will fire only if `barcodeImageGenerationType` parameter is not `SBSDKBarcodeImageGenerationTypeNone`.
 * Optional.
 * @param controller The calling SBSDKBarcodeScannerViewController.
 * @param barcodeImage A captured device-orientation-corrected barcode image.
 */
- (void)barcodeScannerController:(nonnull SBSDKBarcodeScannerViewController *)controller
          didCaptureBarcodeImage:(nonnull UIImage *)barcodeImage;

@end

NS_ASSUME_NONNULL_BEGIN


/**
 * A UIViewController subclass to show a camera screen with the barcode detector.
 * This class cannot be instanced from a storyboard.
 * Instead it is installing itself as a child view controller onto a given parent view controller.
 */
@interface SBSDKBarcodeScannerViewController : SBSDKBaseScannerViewController
/**
 * The delegate. See SBSDKBarcodeScannerViewControllerDelegate protocol. Weak.
 */
@property (nonatomic, weak, nullable) id<SBSDKBarcodeScannerViewControllerDelegate> delegate;

/**
 * Machine code types (EAN, DataMatrix, Aztec, QR, etc) that can be returned in `didDetectBarcodes`
 * delegate method. When nil or empty - all codes can be returned.
 * Default is nil.
 */
@property (nonatomic, strong, nullable) NSArray<SBSDKBarcodeType *> *acceptedBarcodeTypes;

/**
 * Additional parameters for tweaking the detection of barcodes.
 */
@property (nonatomic, strong, nonnull) SBSDKBarcodeAdditionalParameters *additionalDetectionParameters;

/**
 * Bar code document types to limit detection results to. When nil or empty - all document can be returned.
 * Default is nil.
 */
@property (nonatomic, strong, nullable) NSArray<SBSDKBarcodeDocumentType *> *acceptedDocumentTypes;

/**
 * The barcode detectors engine mode.
 * The default value is SBSDKBarcodeEngineModeNextGen.
 */
@property (nonatomic, assign) SBSDKBarcodeEngineMode engineMode;

/**
 Specifies the way of barcode images generation or disables this generation at all.
 Use, if you want to receive a full sized image with barcodes.
 Defaults to SBSDKBarcodeImageGenerationTypeNone.
 */
@property (nonatomic, assign) SBSDKBarcodeImageGenerationType barcodeImageGenerationType;

/**
 * Specifies the amount of frames barcode scanner takes before detecting. Uses the sharpest frame.
 * So setting more frames generally improves recognition quality, but reduces recognition speed.
 * Keep in mind, that `detectionRate` also has influence on recognition speed, as it determines
 * the amount of frames that can be read  per second.
 * Default to 5.
 */
@property (nonatomic, assign) NSInteger barcodeAccumulatedFramesCount;

/** Not available. */
- (nonnull instancetype)init NS_UNAVAILABLE;

/** Not available. */
+ (nonnull instancetype)new NS_UNAVAILABLE;

/**
 * Designated initializer. Installs the receiver as child view controller onto the parent view controllers
 * view using its entire bounds area.
 * @param parentViewController The view controller the newly created instance is embedded into.
 * If parentViewController conforms to SBSDKBarcodeScannerViewControllerDelegate, it is automatically set as delegate.
 */
- (nullable instancetype)initWithParentViewController:(nonnull UIViewController *)parentViewController
                                           parentView:(nullable UIView *)containerView;

/**
 * Designated initializer. Installs the receiver as child view controller onto the parent view controllers
 * view using its entire bounds area.
 * @param parentViewController The view controller the newly created instance is embedded into.
 * @param delegate The delegate for the receiver.
 * If parentViewController conforms to SBSDKBarcodeScannerViewControllerDelegate, it is automatically set as delegate.
 */
- (nullable instancetype)initWithParentViewController:(nonnull UIViewController *)parentViewController
                                           parentView:(nullable UIView *)containerView
                                             delegate:(nullable id<SBSDKBarcodeScannerViewControllerDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
