//
//  AppodealHubViewController.m
//  iosdemo
//
//  Created by Alexander on 30.07.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import "AppodealInitializationViewController.h"
#import "AppodealAdsViewController.h"


@interface AppodealInitializationViewController () <AppodealInterstitialDelegate,AppodealVideoDelegate>

- (IBAction)autocacheSwitch:(id)sender;
- (IBAction)debugSwitch:(id)sender;

@property (nonatomic, strong) NSString* apiKey;
@property (nonatomic) BOOL initalize;
@property (nonatomic) BOOL autocache;
@property (nonatomic) BOOL debug;
@property (assign, nonatomic) AppodealAdType types;


@end

@implementation AppodealInitializationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [ @"Initalization SDK v" stringByAppendingString: AppodealSdkVersionString( )];
    self.apiKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"AppodealAppKey"];
    self.types = AppodealAdTypeAll;    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.tag == 88)
    {
        // You can disable any network for any AdType before initaliztion by use
        // [Appodeal disableNetworkForAdType:AppodealAdTypeVideo name:@"yandex"];
        [Appodeal initializeWithApiKey:self.apiKey types:self.types];
        [Appodeal setDebugEnabled:self.debug];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - AppodealInterstitialDelegate

- (IBAction)adTypeSwitchValueChanged:(UISwitch *)sender {
    AppodealAdType type = (AppodealAdType)sender.tag;
    
    if (sender.isOn) {
        self.types |= type;
    } else {
        self.types ^= type;
    }
}

- (IBAction)autocacheSwitch:(UISwitch*)sender {
    self.autocache = sender.isOn;
    [Appodeal setAutocache:sender.isOn types:sender.tag];
    
}

- (IBAction)debugSwitch:(UISwitch*)sender {
    self.debug = sender.isOn;
    if (self.initalize)
        [Appodeal setDebugEnabled:self.debug];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Init"]) {
        [(AppodealAdsViewController *)segue.destinationViewController setAdType:self.types];
        [(AppodealAdsViewController *)segue.destinationViewController setAutocache:self.autocache];
    }
    
}

@end
