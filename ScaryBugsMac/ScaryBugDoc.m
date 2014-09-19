//
//  ScaryBugDoc.m
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import "ScaryBugDoc.h"
#import "ScaryBugData.h"

@implementation ScaryBugDoc

-(id)initWithTitle:(NSString *)title andRating:(float)rating andThumb:(NSImage *)thumbImage andFullImage:(NSImage *)fullImage
{
    if ((self = [super init])) {
        self.data = [[ScaryBugData alloc] initWithTitle:title andRating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
    }
    return self;
}

@end
