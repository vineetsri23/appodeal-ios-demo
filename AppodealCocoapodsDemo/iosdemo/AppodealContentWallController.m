//
//  AppodealContentWallController.m
//  iosdemo
//
//  Created by Stanislav  on 05/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealContentWallController.h"
#import "iCarousel.h"
#import "RSSParser.h"
#import "RSSModel.h"
#import <Appodeal/Appodeal.h>
#import <SVProgressHUD.h>

@interface AppodealContentWallController () <iCarouselDelegate, iCarouselDataSource>

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) AppodealNativeAdViewAttributes* attributes;
@property (nonatomic, strong) iCarousel* carousel;

@end

@implementation AppodealContentWallController

-(void) viewDidLoad{
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [_carousel setDataSource:self];
    [_carousel setDelegate:self];
    [_containerView addSubview:_carousel];
}

-(AppodealNativeAdViewAttributes*) attributes {
    if (!_attributes){
        _attributes = [[AppodealNativeAdViewAttributes alloc] init];
        _attributes.width = 200;
        _attributes.heigth = 200;
        _attributes.sponsored = YES;
    }
    return _attributes;
}

- (BOOL) ads: (id) object{
    return [object isKindOfClass:[AppodealNativeAd class]];
}

-(NSInteger) numberOfItemsInCarousel:(iCarousel *)carousel{
    return [self.dataArray count];
}

-(UIView*) adsItem: (AppodealNativeAd*) ad{
    AppodealNativeAdView* adView = [AppodealNativeAdView nativeAdViewWithType: AppodealNativeAdTypeContentWall
                                                                  andNativeAd: ad
                                                                andAttributes: self.attributes
                                                           rootViewController: self];
    [adView setFrame:CGRectMake(20, 200, adView.frame.size.width, adView.frame.size.height)];
    return adView;
}

-(UIView*) carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    id object = [self.dataArray objectAtIndex:index];
    if ([self ads:object])
        return [self adsItem:(AppodealNativeAd*) object];
    return [self newsItem:(RSSModel*) object];

}

-(UIView*) newsItem: (RSSModel*) entity{
    
    UIView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    ((UIImageView *)view).contentMode = UIViewContentModeScaleAspectFit;
    ((UIImageView *)view).image = entity.img;
    
    return view;
}


@end
