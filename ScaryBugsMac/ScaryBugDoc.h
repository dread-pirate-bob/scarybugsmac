//
//  ScaryBugDoc.h
//  ScaryBugsMac
//
//  Created by Geo on 9/18/14.
//  Copyright (c) 2014 NWU. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScaryBugData;

@interface ScaryBugDoc : NSObject

@property (strong) ScaryBugData *data;
@property (strong) NSImage *thumbImage;
@property (strong) NSImage *fullImage;

-(id)initWithTitle:(NSString *)title andRating:(float)rating andThumb:(NSImage *)thumbImage andFullImage:(NSImage *)fullImage;

@end
