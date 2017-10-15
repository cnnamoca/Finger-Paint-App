//
//  LineSegment.m
//  Finger Paint App
//
//  Created by Carlo Namoca on 2017-10-13.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment

- (instancetype)initWithFirstPoint:(CGPoint)first
                    andSecondPoint:(CGPoint)second
{
    self = [super init];
    if (self) {
        _firstPoint = first;
        _secondPoint = second;
    }
    return self;
}

@end
