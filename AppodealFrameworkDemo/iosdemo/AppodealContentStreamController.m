//
//  AppodealContentStreamController.m
//  iosdemo
//
//  Created by Stanislav  on 05/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealContentStreamController.h"
#import "RSSParser.h"
#import "RSSModel.h"
#import <Appodeal/AppodealNativeAd.h>
#import <Appodeal/AppodealNativeAdView.h>
#import "SVProgressHUD.h"
#import "Masonry.h"

@interface AppodealContentStreamController ()

@property (nonatomic, strong) AppodealNativeAdViewAttributes* attributes;

@end

@implementation AppodealContentStreamController

-(void) viewDidLoad{
}

-(AppodealNativeAdViewAttributes*) attributes {
    if (!_attributes){
        _attributes = [[AppodealNativeAdViewAttributes alloc] init];
        _attributes.width = self.view.frame.size.width;
        _attributes.heigth = _attributes.width;
        _attributes.sponsored = YES;
        _attributes.buttonColor = [UIColor blueColor];
    }
    return _attributes;
}


- (BOOL) ads: (id) object{
    return [object isKindOfClass:[AppodealNativeAd class]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self ads: [self.dataArray objectAtIndex:indexPath.row]]){
        return self.attributes.width;
    }
    return 200;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self ads: [self.dataArray objectAtIndex:indexPath.row]])
        return [self adsCell:[self.dataArray objectAtIndex:indexPath.row]];
    return [self newsCell:[self.dataArray objectAtIndex:indexPath.row]];
}

-(UITableViewCell*) adsCell: (AppodealNativeAd*) ad{
    AppodealNativeAdView* adView = [[AppodealNativeAdView alloc] init];
    adView = [AppodealNativeAdView nativeAdViewWithType: AppodealNativeAdTypeContentStream
                                            andNativeAd: ad
                                          andAttributes: self.attributes
                                     rootViewController: self];
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    [cell.contentView addSubview:adView];
    [adView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell.contentView);
    }];
    
    return cell;

}

-(UITableViewCell*) newsCell: (RSSModel*) entity{
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    UILabel* titleLabel = (UILabel*) [cell viewWithTag:22];
    UIImageView* imgView = (UIImageView*) [cell viewWithTag:11];
    
    titleLabel.text = entity.title;
    imgView.image = entity.img;
    
    return cell;
}
@end

