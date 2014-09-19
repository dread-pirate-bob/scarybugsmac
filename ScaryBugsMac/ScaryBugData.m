//
//  ScaryBugData.m
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

-(id)initWithTitle:(NSString *)title andRating:(float)rating
{
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
