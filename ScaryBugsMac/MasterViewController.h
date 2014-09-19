//
//  MasterViewController.h
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Rating View/EDStarRating.h"

@interface MasterViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate, EDStarRatingProtocol>

@property (strong) NSMutableArray *bugsArray;

@end
