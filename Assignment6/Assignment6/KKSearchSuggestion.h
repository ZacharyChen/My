//
//  KKSearchMusicFeature.h
//  Assignment6
//
//  Created by ZacharyChen on 12/1/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KKSearchSuggestion;

@protocol KKSearchSuggestionDelegate <NSObject>

- (void)searchSuggestion:(KKSearchSuggestion *)inSearchSuggestion didSuccessWithMusicListArray:(NSArray *)inMusicListArray;
- (void)searchSuggestion:(KKSearchSuggestion *)inSearchSuggestion didFailWithError:(NSError *)inError;

@end

@interface KKSearchSuggestion : NSObject <NSURLConnectionDelegate>
{
    id<KKSearchSuggestionDelegate> delegate;
    NSMutableData *receiveData;
    NSURLConnection *connection;
}

- (KKSearchSuggestion *)initWithDelegate:(id)inDelegate;
- (void)searchWithKeyword:(NSString *)inKeyword;

@property (assign, nonatomic) id<KKSearchSuggestionDelegate> delegate;
@property (retain, nonatomic) NSMutableData *receiveData;
@property (retain, nonatomic) NSURLConnection *connection;

@end
