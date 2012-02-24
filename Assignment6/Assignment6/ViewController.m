//
//  ViewController.m
//  Assignment6
//
//  Created by Zachary Chen on 12/1/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)dealloc
{
    [musicList release];
    [searchMusicFeature release];
    [tableView release];
    [searchBar release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    if (self) {
        self.searchMusicFeature = [[[KKSearchSuggestion alloc] initWithDelegate:self] autorelease];
        self.musicList = nil;
        
        return self;
    }
    else {
        return nil;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.scrollEnabled = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableView = nil;
    self.searchBar = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.musicList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MusicListIdentifier = @"MusicList";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MusicListIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MusicListIdentifier] autorelease];
    }
    
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowValue = [self.musicList objectAtIndex:row];
    
    NSString *cellText = [[NSString alloc] initWithFormat:@"%@", [rowValue objectForKey:@"text"]];
    
    cell.textLabel.text = cellText;
    
    [cellText release];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowValue = [self.musicList objectAtIndex:row];
    
    NSString *alertViewTitle = [[NSString alloc] initWithFormat:@"%@", [rowValue objectForKey:@"keyword"]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertViewTitle message:nil delegate:nil cancelButtonTitle:@"Dismiss!" otherButtonTitles:nil];
    
    [alert show];
    
    [alert release];
    [alertViewTitle release];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{    
    NSString * searchTextByTrim = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSString * searhTextByTrimAndEscape = [searchTextByTrim stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self.searchMusicFeature searchWithKeyword:searhTextByTrimAndEscape];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

- (void)searchSuggestion:(KKSearchSuggestion *)inSearchSuggestion didSuccessWithMusicListArray:(NSArray *)inMusicListArray
{
    
    self.musicList = inMusicListArray;
    
    [self.tableView reloadData];
}

- (void)searchSuggestion:(KKSearchSuggestion *)inSearchSuggestion didFailWithError:(NSError *)inError
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[inError localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
    [alert show];
    
    [alert release];
}

@synthesize musicList;
@synthesize searchMusicFeature;
@synthesize tableView;
@synthesize searchBar;

@end
