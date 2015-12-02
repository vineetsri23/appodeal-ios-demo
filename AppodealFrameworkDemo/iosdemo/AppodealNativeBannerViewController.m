//
//  AppodealNativeBannerViewController.m
//  iosdemo
//
//  Created by Stas Kochkin on 17/11/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealNativeBannerViewController.h"
#import <Appodeal/Appodeal.h>

@implementation AppodealNativeBannerViewController

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 50 : 90;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    AppodealNativeAdViewAttributes* attrib = [[AppodealNativeAdViewAttributes alloc] init];
    attrib.heigth = 50;
    attrib.width = self.view.frame.size.width;
    attrib.buttonColor = [UIColor blueColor];
    attrib.buttonTitleFont = [UIFont systemFontOfSize:12];
    attrib.descriptionFontColor = [UIColor darkGrayColor];
    attrib.descriptionFont = [UIFont systemFontOfSize:12];
    attrib.titleFont = [UIFont systemFontOfSize:14];
    attrib.titleFontColor = [UIColor blackColor];
    attrib.starRatingColor = [UIColor orangeColor];
    AppodealNativeAdView* adView = [AppodealNativeAdView nativeAdViewWithType: UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? AppodealNativeAdType320x50 : AppodealNativeAdType728x90
                                                                  andNativeAd: [self.dataArray objectAtIndex:indexPath.row]
                                                                andAttributes: attrib
                                                           rootViewController: self];
    [cell.contentView addSubview:adView];
    return cell;

}

@end
