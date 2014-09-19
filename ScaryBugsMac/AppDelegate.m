//
//  AppDelegate.m
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import "AppDelegate.h"
#import"MasterViewController.h"
#import "ScaryBugDoc.h"

// private interface
@interface AppDelegate ()
@property (nonatomic,strong)IBOutlet MasterViewController *masterVC;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // insert code here to initialize your application
    self.masterVC = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:[NSBundle mainBundle]];
    
    // setup sample data
    ScaryBugDoc *bug1 = [[ScaryBugDoc alloc] initWithTitle:@"Potato Bug" andRating:1.0 andThumb:[NSImage imageNamed:@"potatoBugThumb"] andFullImage:[NSImage imageNamed:@"potatoBug"]];
    ScaryBugDoc *bug2 = [[ScaryBugDoc alloc] initWithTitle:@"Centipede" andRating:4.0 andThumb:[NSImage imageNamed:@"centipedeThumb"] andFullImage:[NSImage imageNamed:@"centipede"]];
    ScaryBugDoc *bug3 = [[ScaryBugDoc alloc] initWithTitle:@"Wolf Spider" andRating:5.0 andThumb:[NSImage imageNamed:@"wolfSpiderThumb"] andFullImage:[NSImage imageNamed:@"wolfSpider"]];
    ScaryBugDoc *bug4 = [[ScaryBugDoc alloc] initWithTitle:@"Lady Bug" andRating:0.0 andThumb:[NSImage imageNamed:@"ladybugThumb"] andFullImage:[NSImage imageNamed:@"ladybug"]];
    
    // set the masterVC's data array
    NSMutableArray *bugs = [NSMutableArray arrayWithObjects:bug1, bug2, bug3, bug4, nil];
    self.masterVC.bugsArray = bugs;
    
    // show masterVC
    self.masterVC.view.frame = ((NSView *)self.window.contentView).bounds;
    [self.window.contentView addSubview:self.masterVC.view];
}

@end
