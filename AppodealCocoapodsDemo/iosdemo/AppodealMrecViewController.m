//
//  AppodealMrecViewController.m
//  iosdemo
//
//  Created by Stas Kochkin on 17/12/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "AppodealMrecViewController.h"
#import <Appodeal/Appodeal.h>

@interface AppodealMrecViewController () <AppodealBannerViewDelegate>

@end

@implementation AppodealMrecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppodealMRECView* mrecView = [[AppodealMRECView alloc] initWithRootViewController:self];
    mrecView.delegate = self;
    [mrecView loadAd];
    [self.view addSubview:mrecView];
    [mrecView setCenter:self.view.center];
}

- (void) bannerView:(AppodealBannerView *)bannerView didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"Mrec did fail load with error: %@", error);
}

- (void) bannerViewDidLoadAd:(AppodealBannerView *)bannerView {
    NSLog(@"Mrec did load");

}

- (void) bannerViewDidInteract:(AppodealBannerView *)bannerView {
    NSLog(@"Banner did interact did load");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
