//
//  MasterViewController.h
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MasterViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property (strong) NSMutableArray *bugsArray;

@end
