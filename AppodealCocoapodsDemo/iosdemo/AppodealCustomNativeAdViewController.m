//
//  AppodealCustomNativeAdViewController.m
//  iosdemo
//
//  Created by Stanislav  on 05/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealCustomNativeAdViewController.h"
#import <Appodeal/AppodealNativeAd.h>
#import <SVProgressHUD.h>

@interface AppodealCustomNativeAdViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *ctaLabel;


@end

@implementation AppodealCustomNativeAdViewController

-(void) viewDidLoad{
    if (_nativeAd.title)
        _titleLabel.text = _nativeAd.title;
    if (_nativeAd.descriptionText)
        _descriptionLabel.text = _nativeAd.descriptionText;
    if (_nativeAd.subtitle)
        _subtitleLabel.text = _nativeAd.subtitle;
    if (_nativeAd.callToActionText)
        _ctaLabel.text = _nativeAd.callToActionText;
    if (_nativeAd.image)
        _imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:_nativeAd.image.imageUrl]];
    if (_nativeAd.icon)
        _iconView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:_nativeAd.icon.imageUrl]];
    if (_nativeAd.starRating)
        _ratingLabel.text = [NSString stringWithFormat:@"%1.1f", [_nativeAd.starRating floatValue ]];
}
@end
