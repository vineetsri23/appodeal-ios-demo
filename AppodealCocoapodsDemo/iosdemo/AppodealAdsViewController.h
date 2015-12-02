//
//  AppodealAdsViewController.h
//  iosdemo
//
//  Created by Учитель on 20.08.15.
//  Copyright (c) 2015 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Appodeal/Appodeal.h>


@interface AppodealAdsViewController : UITableViewController

@property (assign, nonatomic) AppodealAdType adType;
@property (assign, nonatomic) BOOL autocache;

@end
