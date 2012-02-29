//
//  UnitTest.m
//  UnitTest
//
//  Created by ZacharyChen on 12/2/29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UnitTest.h"
#import "KKSearchSuggestion.h"

@implementation UnitTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSearchWithKeywory
{
    KKSearchSuggestion *searchSuggestion = [[KKSearchSuggestion alloc] initWithDelegate:self];
    
    [searchSuggestion searchWithKeyword:@"Jolin"];
}

- (void)searchSuggestion:(KKSearchSuggestion *)inSearchSuggestion didSuccessWithMusicListArray:(NSArray *)inMusicListArray
{
    STAssertNotNil(inMusicListArray, @"\"inMusicListArray\" Must Not Be nil.");
}

- (void)searchSuggestion:(KKSearchSuggestion *)inSearchSuggestion didFailWithError:(NSError *)inError
{
    STFail(@"%s, Error: %@", __PRETTY_FUNCTION__, [inError localizedDescription]);
}

//- (void)testExample
//{
//    STFail(@"Unit tests are not implemented yet in UnitTest");
//}

@end
