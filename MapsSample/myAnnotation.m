//
//  myAnnotation.m
//  MapsSample
//
//  Created by paradigm creatives on 10/1/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation

-(id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d
{
    self.title = title;
    self.coordinate =coordinate2d;
    return self;
}
@end
