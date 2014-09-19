//
//  ScaryBugData.h
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject

@property (strong) NSString *title;
@property (assign) float rating;

-(id)initWithTitle:(NSString *)title andRating:(float)rating;

@end
