//
//  SUPGridView.m
//  Castro
//
//  Created by Padraig O Cinneide on 2014-03-24.
//  Copyright (c) 2014 Supertop. All rights reserved.
//

#import "SUPGridView.h"

@interface SUPGridView()

@property (nonatomic, strong) UIColor *lightColor;
@property (nonatomic, strong) UIColor *strongColor;

@end

CGFloat SUPRound(CGFloat f) {
#if __LP64__
    return round(f);
#else
    return roundf(f);
#endif
}

@implementation SUPGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.gridColor = [UIColor redColor];

        self.minorGridSize = CGSizeMake(5, 5);
        self.majorGridSize = CGSizeMake(20, 20);
        
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setGridColor:(UIColor *)gridColor
{
    _gridColor = gridColor;
    
    self.lightColor = [gridColor colorWithAlphaComponent:0.3];
    self.strongColor = [gridColor colorWithAlphaComponent:0.5];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSetShouldAntialias(context, NO);
    
    CGFloat dashes[2] = {1,1};
    
    for (CGFloat y = 0; y < self.bounds.size.height; y = y + self.minorGridSize.height)
    {
        if (fmodf(y, self.majorGridSize.height) == 0) {
            CGContextSetStrokeColorWithColor(context, self.strongColor.CGColor);
            CGContextSetLineDash(context, 1, dashes, 0);
        } else {
            CGContextSetStrokeColorWithColor(context, self.lightColor.CGColor);
            CGContextSetLineDash(context, 1, dashes, 2);
        }
        [self drawLineAtYPosition:y];
    }

    for (CGFloat x = 0; x < self.bounds.size.width; x = x + self.minorGridSize.width)
    {
        if (fmodf(x, self.majorGridSize.width) == 0) {
            CGContextSetStrokeColorWithColor(context, self.strongColor.CGColor);
            CGContextSetLineDash(context, 1, dashes, 0);
        } else {
            CGContextSetStrokeColorWithColor(context, self.lightColor.CGColor);
            CGContextSetLineDash(context, 1, dashes, 2);
        }
        [self drawLineAtXPosition:x];
    }
}

- (void)drawLineAtYPosition:(CGFloat)yPos
{
    yPos = SUPRound(yPos)+0.5;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 0.5f);
    
    CGContextMoveToPoint(context, 0, yPos); //start at this point
    CGContextAddLineToPoint(context, 320, yPos); //draw to this point
    
    CGContextStrokePath(context);
}

- (void)drawLineAtXPosition:(CGFloat)xPos
{
    xPos = SUPRound(xPos);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 0.5f);
    
    CGContextMoveToPoint(context, xPos, 0); //start at this point
    CGContextAddLineToPoint(context, xPos, self.bounds.size.height); //draw to this point
    
    CGContextStrokePath(context);
}

@end
