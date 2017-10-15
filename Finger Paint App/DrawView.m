//
//  DrawView.m
//  Finger Paint App
//
//  Created by Carlo Namoca on 2017-10-13.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "DrawView.h"
#import "LineSegment.h"

@interface DrawView()
@property (nonatomic) UIColor *strokeColor;
@property (nonatomic) NSMutableArray<LineSegment *> *blackLine;
@property (nonatomic) NSMutableArray<LineSegment *> *redLine;

@end

@implementation DrawView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        _blackLine = [NSMutableArray new];
        _redLine = [NSMutableArray new];
        _strokeColor = [UIColor blackColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first andSecondPoint:first];
    
    if (self.strokeColor == [UIColor blackColor]){
        [self.blackLine addObject:segment];
    } else if (self.strokeColor == [UIColor redColor]){
        [self.redLine addObject:segment];
    }
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint second = [touch locationInView:self];
    CGPoint first = [touch previousLocationInView:self];
//    NSLog(@"%d: %@, %@", __LINE__, NSStringFromCGPoint(first), NSStringFromCGPoint(second));
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first andSecondPoint:second];
    
    if (self.strokeColor == [UIColor blackColor]){
        [self.blackLine addObject:segment];
    } else if (self.strokeColor == [UIColor redColor]){
        [self.redLine addObject:segment];
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 2.0;
        path.lineCapStyle = kCGLineCapRound;
        [[UIColor blackColor] setStroke];
        
        for (LineSegment *segment in self.blackLine){
            if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)){
                [path moveToPoint:segment.firstPoint];
                continue;
            }
            [path addLineToPoint:segment.firstPoint];
            [path addLineToPoint:segment.secondPoint];
            
            [path stroke];
        }
    }
    
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 2.0;
        path.lineCapStyle = kCGLineCapRound;
        [[UIColor redColor] setStroke];
        
        for (LineSegment *segment in self.redLine){
            if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)){
                [path moveToPoint:segment.firstPoint];
                continue;
            }
            [path addLineToPoint:segment.firstPoint];
            [path addLineToPoint:segment.secondPoint];
            
            [path stroke];
        }
    }
}

- (IBAction)clear:(UIButton *)sender
{
    [self.blackLine removeAllObjects];
    [self.redLine removeAllObjects];
    [self setNeedsDisplay];
}

-(IBAction)changeColor:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            self.strokeColor = [UIColor blackColor];
            break;
        case 1:
            self.strokeColor = [UIColor redColor];
            break;
            
        default:
            break;
    }
}


@end
