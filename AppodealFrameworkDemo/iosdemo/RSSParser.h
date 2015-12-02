//
//  RSSParser.h
//  iosdemo
//
//  Created by Stanislav  on 05/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSParserDelegate<NSObject>

-(void) didEndParsWithArray:(NSArray*) array;

@end

@interface RSSParser : NSObject

@property (nonatomic, assign)id <RSSParserDelegate> delegate;

-(void) startWithURL: (NSString*) url;

@end
