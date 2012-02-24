//
//  ViewController.h
//  Assignment6
//
//  Created by Zachary Chen on 12/1/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKSearchSuggestion.h"

@interface ViewController : UIViewController<KKSearchSuggestionDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSArray *musicList;
    KKSearchSuggestion *searchMusicFeature;
    UITableView *tableView;
    UISearchBar *searchBar;
}

@property (retain, nonatomic) NSArray *musicList;
@property (retain, nonatomic) KKSearchSuggestion *searchMusicFeature;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

@end
