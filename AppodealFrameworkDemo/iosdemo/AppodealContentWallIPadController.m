//
//  AppodealContentWallIPad.m
//  iosdemo
//
//  Created by Stanislav  on 06/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealContentWallIPadController.h"
#import "RSSParser.h"
#import "RSSModel.h"
#import <Appodeal/AppodealNativeAd.h>
#import <Appodeal/AppodealNativeAdView.h>
#import "SVProgressHUD.h"
#import "Masonry.h"

@interface AppodealContentWallIPadController ()

@property (nonatomic, strong) NSArray* data;
@property (nonatomic, strong) AppodealNativeAd* nativeAd;
@property (nonatomic, strong) AppodealNativeAdViewAttributes* attributes;

@end

@implementation AppodealContentWallIPadController

//- (void) viewDidLoad{
//    [SVProgressHUD show];
//    _nativeAd = [[AppodealNativeAd alloc] init];
//    [_nativeAd setDelegate:self];
//    [_nativeAd loadAd];
//    RSSParser* parser = [[RSSParser alloc] init];
//    [parser setDelegate:self];
//    [parser startWithURL:@"http://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss"];
//}
//
//- (void) makeAttributes{
//    _attributes = [[AppodealNativeAdViewAttributes alloc] init];
//    _attributes.width = self.view.frame.size.width;
//    _attributes.heigth = 80;
//    _attributes.iconHeigtht = 50;
//    _attributes.iconWidth = 50;
//    _attributes.heigth = _nativeAd.image.size.height/_nativeAd.image.size.width*(_attributes.width-10)+95+_attributes.iconHeigtht;
//    _attributes.sponsored = YES;
//    _attributes.buttonColor = [UIColor blueColor];
//}
//
//- (void) nativeAdDidLoad:(AppodealNativeAd *)nativeAd{
//    [self makeAttributes];
//    [self.collectionView reloadData];
//}
//
//- (void) didEndParsWithArray:(NSArray *)array{
//    _data = array;
//    [self.collectionView reloadData];
//    [SVProgressHUD dismiss];
//}
//
//- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//
//- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return [_data count];
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if ([self adsCell] && [indexPath row] == 4 )
//        return CGSizeMake(_attributes.width, _attributes.heigth);
//    return CGSizeMake(self.view.frame.size.width/2-10, 250);
//}
//
//- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if ([self adsCell] && indexPath.row == 4)
//        return [self adsCell];
//    return [self newsCellForRow:indexPath];
//}
//
//
//- (UICollectionViewCell*) adsCell{
//    if (_nativeAd.isReady) {
//        AppodealNativeAdView* adView = [[AppodealNativeAdView alloc] init];
//        adView = [AppodealNativeAdView nativeAdViewWithType:AppodealNativeAdTypeContentWall
//                                                andNativeAd:_nativeAd
//                                              andAttributes:_attributes
//                                         rootViewController:self];
//        UICollectionViewCell* cell = [[UICollectionViewCell alloc] init];
//        [cell.contentView addSubview:adView];
//        [adView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(cell.contentView);
//        }];
//        return cell;
//    }
//    return nil;
//}
//
//- (UICollectionViewCell*) newsCellForRow: (NSIndexPath*) index{
//    UICollectionViewCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Item" forIndexPath:index];
//    UILabel* titleLabel = (UILabel*) [cell viewWithTag:11];
//    UIImageView* imgView = (UIImageView*) [cell viewWithTag:22];
//    
//    RSSModel* entity = [_data objectAtIndex:[index row]];
//    
//    titleLabel.text = entity.title;
//    imgView.image = entity.img;
//    
//    
//    return cell;
//}


@end
