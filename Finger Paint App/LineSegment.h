//
//  LineSegment.h
//  Finger Paint App
//
//  Created by Carlo Namoca on 2017-10-13.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface LineSegment : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;
- (instancetype)initWithFirstPoint:(CGPoint)first andSecondPoint:(CGPoint)second;

@end
