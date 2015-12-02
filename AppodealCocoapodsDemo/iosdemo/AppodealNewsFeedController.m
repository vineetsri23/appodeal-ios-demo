//
//  AppodealNewsFeedController.m
//  iosdemo
//
//  Created by Stanislav  on 05/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealNewsFeedController.h"
#import "RSSParser.h"
#import "RSSModel.h"
#import <Appodeal/AppodealNativeAd.h>
#import <Appodeal/AppodealNativeAdView.h>
#import <SVProgressHUD.h>
#import <Masonry.h>

@interface AppodealNewsFeedController ()

@end

@implementation AppodealNewsFeedController

-(void) viewDidLoad{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id object = [self.dataArray objectAtIndex:indexPath.row];
    if ([object isMemberOfClass:[RSSModel class]])
        return [self newsCell:[self.dataArray objectAtIndex:indexPath.row]];
    else return [self adsCell:[self.dataArray objectAtIndex:indexPath.row]];
}

-(UITableViewCell*) adsCell: (AppodealNativeAd*) ad{
    AppodealNativeAdViewAttributes* attributes = [[AppodealNativeAdViewAttributes alloc] init];
    attributes.width = self.view.frame.size.width;
    attributes.heigth = 80;
    attributes.iconHeigtht = 50;
    attributes.iconWidth = 50;
    attributes.roundedIcon = YES;
    AppodealNativeAdView* adView = [AppodealNativeAdView nativeAdViewWithType: AppodealNativeAdTypeNewsFeed
                                            andNativeAd: ad
                                          andAttributes: attributes
                                     rootViewController: self];
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AdsCell"];
    [cell.contentView addSubview: adView];
    [adView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell.contentView);
    }];
    return cell;
}

-(UITableViewCell*) newsCell: (RSSModel*) entity{
   
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    UILabel* titleLabel = (UILabel*) [cell viewWithTag:22];
    UILabel* descrLabel = (UILabel*) [cell viewWithTag:33];
    UIImageView* imgView = (UIImageView*) [cell viewWithTag:11];
    
    titleLabel.text = entity.title;
    descrLabel.text = entity.descr;
    imgView.image = entity.img;
    
    return cell;
}

@end
