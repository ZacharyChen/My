//
//  KKSearchMusicFeature.m
//  Assignment6
//
//  Created by ZacharyChen on 12/1/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KKSearchSuggestion.h"

static NSString *const kSearchSuggestionAPIUrl = @"http://www.kkbox.com.tw/ajax/ac_search.php?query=?";

@implementation KKSearchSuggestion

- (void)dealloc
{
    [receiveData release];
    [connection release];
    
    [super dealloc];
}

- (KKSearchSuggestion *)initWithDelegate:(id)inDelegate
{
    self = [super init];
    
    if (self) {
        self.delegate = inDelegate;
        self.receiveData = [NSMutableData data];
        return self;
    } 
    else {
        return nil;
    }
}

- (void)searchWithKeyword:(NSString *)inKeyword
{
    if (self.connection) {
        [self.connection cancel];
        self.connection = nil;
    }
    
    NSString *stringURL = [[NSString alloc] initWithFormat:@"%@%@", kSearchSuggestionAPIUrl, inKeyword];
    
    NSURL *url = [[NSURL alloc] initWithString:stringURL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [self.receiveData setData:nil];
    
    NSURLConnection *newConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    self.connection = newConnection;
    
    [stringURL release];
    [url release];
    [request release];
    [newConnection release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{    
    [self.receiveData setData:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.delegate searchSuggestion:self didFailWithError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{  
    NSString *receiveDataString = [[NSString alloc] initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    
    NSString *receiveDataStringByTrim = [receiveDataString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSArray *receiveDataLines = [receiveDataStringByTrim componentsSeparatedByString:@"\n"];
    
    NSMutableArray *musicList = [NSMutableArray array];
    
    for (NSString *lineStringValue in receiveDataLines) {
        if (lineStringValue == [receiveDataLines lastObject]) {
            continue;
        }
        
        NSArray *lineValaues = [lineStringValue componentsSeparatedByString:@"\t"];
        
        if ([lineValaues count] != 2) {
            continue;
        }
        
        NSDictionary *musicKeywordAndText = [[NSDictionary alloc] initWithObjectsAndKeys:[lineValaues objectAtIndex:0], @"keyword", [lineValaues objectAtIndex:1], @"text", nil];
        
        [musicList addObject:musicKeywordAndText];
        
        [musicKeywordAndText release];        
    }
    
    [self.delegate searchSuggestion:self didSuccessWithMusicListArray:musicList];
    
    [receiveDataString release];
}

@synthesize delegate;
@synthesize receiveData;
@synthesize connection;

@end
