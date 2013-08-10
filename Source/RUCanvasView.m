//
//  RUCanvasView.h
//  DrawingTest
//
//  Created by Raul on 8/9/13.
//  Copyright (c) 2013 Raul Uranga. All rights reserved.
//

#import "RUCanvasView.h"
@interface RUCanvasView () {
    CGPoint lastPoint;
    BOOL mouseSwiped;
}

@property (nonatomic) UIImageView *mainImage;
@property (nonatomic) UIImageView *tempDrawImage;
@property(nonatomic) RULine *currentLine;

@end

@implementation RUCanvasView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    
    UIGraphicsBeginImageContext(self.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.currentLine.brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.currentLine.red, self.currentLine.green, self.currentLine.blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempDrawImage setAlpha:self.currentLine.opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.currentLine.brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.currentLine.red, self.currentLine.green, self.currentLine.blue, self.currentLine.opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:self.currentLine.opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}

-(void) clearCanvas {
     self.mainImage.image = nil;
}

#pragma mark - Initialization

- (void)setup
{
    self.currentLine = [[RULine alloc] init];
    self.backgroundColor = [UIColor clearColor];
    self.mainImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.tempDrawImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self addSubview:self.mainImage];
    [self addSubview:self.tempDrawImage];
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end

#pragma mark -
#pragma mark Line implementation


@implementation RULine

-(id) init {
    self = [super init];
    if (self != nil) {
        self.red = 0.0/255.0;
        self.green = 0.0/255.0;
        self.blue = 0.0/255.0;
        self.brush = 10.0;
        self.opacity = 1.0;
    }
    return self;
}

-(id) initWithRedColor:(CGFloat)red blueColor:(CGFloat)blue greenColor:(CGFloat)green brushSize:(CGFloat)brush opacity:(CGFloat)opacity {
    self = [self init];
    if (self != nil) {
        self.red = red;
        self.green = green;
        self.blue = blue;
        self.brush = brush;
        self.opacity = opacity;
    }
    return self;
}

@end
