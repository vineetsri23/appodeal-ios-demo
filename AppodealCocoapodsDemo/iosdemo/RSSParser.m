//
//  RSSParser.m
//  iosdemo
//
//  Created by Stanislav  on 05/10/15.
//  Copyright © 2015 Appodeal. All rights reserved.
//

#import "RSSParser.h"
#import <MWFeedParser.h>
#import "RSSModel.h"

@interface RSSParser () <MWFeedParserDelegate>

@property (nonatomic) NSInteger counter;
@property (nonatomic, strong) NSMutableArray* arr;
@property (nonatomic, strong) MWFeedParser* feedParser;

@end

@implementation RSSParser

-(void) startWithURL:(NSString *)url{
    NSURL *feedURL = [NSURL URLWithString:url];
    _feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    _feedParser.delegate = self;
    _feedParser.feedParseType = ParseTypeItemsOnly;
    _arr = [[NSMutableArray alloc] init];
    _counter=0;
    [_feedParser parse];
}

-(void) feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item{
    _counter++;
    RSSModel* entity = [[RSSModel alloc] init];
    entity.title = item.title;
    entity.img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[item.enclosures firstObject] valueForKey:@"url"]]]];
    entity.descr = item.summary;
    [_arr addObject:entity];
    NSInteger threshold = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? 5 : 10;
    if (_counter > threshold)
        [_feedParser stopParsing];
    
}

-(void) feedParserDidFinish:(MWFeedParser *)parser{
    if (_delegate && [_delegate respondsToSelector:@selector(didEndParsWithArray:)]) {
        [_delegate performSelector:@selector(didEndParsWithArray:) withObject:_arr];
    }
}

@end
