//
//  AppodealNativeAdsController.m
//  iosdemo
//
//  Created by Stanislav  on 05/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealNativeAdsController.h"
#import <Appodeal/Appodeal.h>
#import "SVProgressHUD.h"

#import "RSSParser.h"
#import "RSSModel.h"

#import "AppodealNewsFeedController.h"
#import "AppodealContentStreamController.h"
#import "AppodealContentWallController.h"
#import "AppodealCustomNativeAdViewController.h"
#import "AppodealNativeBannerViewController.h"

NSString* const kSegueNewsFeed = @"NewsFeedSegue";
NSString* const kSegueContentStream = @"ContentStreamSegue";
NSString* const kSegueContentWall = @"ContentWallSegue";
NSString* const kSegueBanner = @"BannerSegue";
NSString* const kSegueCustom = @"CustomSegue";

@interface AppodealNativeAdsController () <AppodealNativeAdServiceDelegate, RSSParserDelegate> //UIPickerViewDataSource, UIPickerViewDelegate,

@property AppodealNativeAdService* nativeAdService;
@property (nonatomic, assign) AppodealNativeAdViewType adViewType;

@property (strong, nonatomic) NSMutableArray* adsArray;
@property (strong, nonatomic) NSArray* dataArray;

//@property (weak, nonatomic)   IBOutlet UIPickerView *capacityPckerView;

@end

@implementation AppodealNativeAdsController

-(void) viewDidLoad{
    
    RSSParser* parser = [[RSSParser alloc] init];
    [parser setDelegate:self];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [parser startWithURL:@"http://www.nasa.gov/rss/dyn/breaking_news.rss"];
        dispatch_async(dispatch_get_main_queue(), ^(void){
        });
    });
    
    //self.capacityPckerView.dataSource = self;
    //self.capacityPckerView.delegate = self;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0){
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        self.adViewType = cell.tag;
    }
    
    if (indexPath.section == 1){
        self.adViewType = 10;
    }
    
    self.nativeAdService = [[AppodealNativeAdService alloc] init];
    self.nativeAdService.delegate = self;
    [self.nativeAdService loadAd];
    [SVProgressHUD show];
}

//-(NSInteger) capacity {
//    return [self.capacityPckerView selectedRowInComponent:0]+1;
//}

-(void) showAds{
    if (![self.adsArray count] && ![self.dataArray count]){
        NSLog(@"No data to show");
        return;
    }
    switch (self.adViewType) {
        case AppodealNativeAdTypeNewsFeed:
            [self performSegueWithIdentifier: kSegueNewsFeed sender:nil];
            break;
        case AppodealNativeAdTypeContentStream:
            [self performSegueWithIdentifier: kSegueContentStream sender:nil];
            break;
        case AppodealNativeAdTypeContentWall:
            [self performSegueWithIdentifier: kSegueContentWall sender:nil];
            break;
        case AppodealNativeAdType320x50:
            [self performSegueWithIdentifier: kSegueBanner sender:nil];
            break;
        default:
            [self performSegueWithIdentifier:kSegueCustom sender:nil];
            break;
    }
}


-(NSArray*) adsAndDataArray{
    NSMutableArray* array = [[ self.dataArray arrayByAddingObjectsFromArray:self.adsArray] mutableCopy];
    for (NSInteger i = array.count-1; i > 0; i--) {
        [array exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
    }
    return array;
}


#pragma mark - AppodealNativeAdServiceDelegate

//-(void) nativeAdServiceDidLoad{
//    self.adsArray = [NSMutableArray new];
//    AppodealNativeAd* nativeAd;
//    int capacity = [self capacity];
//
//    for (int i = 0; i < capacity; i++){
//        nativeAd = [self.nativeAdService nextAd];
//        if (nativeAd){
//            [self.adsArray addObject:nativeAd];
//        }
//    }
//    [SVProgressHUD dismiss];
//    [self showAds];
//}

- (void) nativeAdServiceDidLoad:(AppodealNativeAd *)nativeAd {
    [SVProgressHUD dismiss];
    self.adsArray = [NSMutableArray arrayWithObject:nativeAd];
    [self showAds];
}

-(void) nativeAdServiceDidFailedToLoad{
    [SVProgressHUD showErrorWithStatus:@"Ads did failed to load"];
}


//#pragma mark - UIPickerViewDataSource
//
//- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    return 1;
//}
//
//- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    return 5;
//}
//
//
//#pragma mark - UIPickerViewDelegate
//
//- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return [NSString stringWithFormat:@"%d", row+1];
//}

#pragma mark - RSSParserDelegate

-(void) didEndParsWithArray:(NSArray *)array{
    self.dataArray = array;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:kSegueNewsFeed]){
        [(AppodealNewsFeedController*) segue.destinationViewController setDataArray:[self adsAndDataArray]];
    }
    if ([segue.identifier isEqualToString:kSegueContentStream]){
        [(AppodealContentStreamController*) segue.destinationViewController setDataArray:[self adsAndDataArray]];
    }
    if ([segue.identifier isEqualToString:kSegueContentWall]){
        [(AppodealContentWallController*) segue.destinationViewController setDataArray:[self adsAndDataArray]];
    }
    if ([segue.identifier isEqualToString:kSegueCustom]){
        [(AppodealCustomNativeAdViewController*) segue.destinationViewController setNativeAd:[[self adsArray] firstObject]];
    }
    if  ([segue.identifier isEqualToString:kSegueBanner]){
        [(AppodealNativeBannerViewController*) segue.destinationViewController setDataArray:[self adsArray]];
    }
}


@end
