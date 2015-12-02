//
//  AppodealBannersViewController.m
//  iosdemo
//
//  Created by Alexander on 30.07.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import "AppodealBannersViewController.h"

#import <Appodeal/Appodeal.h>

@interface AppodealBannersViewController () <AppodealBannerDelegate>


@property (strong, nonatomic) IBOutlet UITableViewCell *AppodealBannerCell;

@end

@implementation AppodealBannersViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [Appodeal setBannerDelegate:self];
    [super viewDidLoad];
    UIEdgeInsets insets = UIEdgeInsetsMake(50.0f, 0.0f, 0.0f, 0.0f);
    self.tableView.contentInset = insets;
   // UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemCancel target:self action:@selector(hide:)];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Hide" style:UIBarButtonItemStylePlain target:self action:@selector(hide:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

-(void) hide: (id) sender
{
    [Appodeal hideBanner];
}
-(void) viewWillDisappear:(BOOL)animated
{
    [Appodeal hideBanner];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([indexPath section] == 0) {
            AppodealShowStyle style = (AppodealShowStyle)cell.tag;
            [Appodeal showAd:style rootViewController:self.parentViewController];
    }
    if ([indexPath section] == 1) {
        CGFloat height = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 50.0f : 90.0f;
        CGRect frame = CGRectMake(0.0f, 0.0f, 320.0f, height);
        
        [Appodeal hideBanner];
        tableView.tableFooterView = nil;
        
        UIView *banner = [Appodeal banner];
        [banner setFrame:frame];
        
        tableView.tableFooterView = banner;
    }
    
    if ([indexPath section] == 2){
        CGFloat height = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 50.0f : 90.0f;
        CGFloat width = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 320.0f : 768;
        CGRect frame = CGRectMake(0.0f, 0.0f, width, height);
        
        [Appodeal hideBanner];
        tableView.tableFooterView = nil;
        
        UIView *banner = [Appodeal banner];
        [banner setFrame:frame];
        
        [_AppodealBannerCell.contentView addSubview: banner];
    }

    
}

#pragma mark - AppodealBannerDelegate

- (void)bannerDidLoadAd {
    NSLog(@"banner did load");
}

- (void)bannerDidFailToLoadAd {
    NSLog(@"banner did fail to load");
}

- (void)bannerDidClick {
    NSLog(@"banner did click");
}

@end
