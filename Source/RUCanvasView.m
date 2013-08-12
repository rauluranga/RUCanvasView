//
//  RUCanvasView.h
//  DrawingTest
//
//  Created by Raul on 8/9/13.
//  Copyright (c) 2013 Raul Uranga. All rights reserved.
//

// All source code from Ray Wenderlich tutorial
//@see http://www.raywenderlich.com/18840/how-to-make-a-simple-drawing-app-with-uikit

#import "RUCanvasView.h"

@interface RUBrush : NSObject

@property (nonatomic, assign) CGFloat red;
@property (nonatomic, assign) CGFloat green;
@property (nonatomic, assign) CGFloat blue;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGFloat opacity;

@end

@interface RUCanvasView () {
    CGPoint lastPoint;
    BOOL mouseSwiped;
}

@property (nonatomic) UIImageView *mainImage;
@property (nonatomic) UIImageView *tempDrawImage;
@property(nonatomic) RUBrush *brush;

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
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.brush.size );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.brush.red, self.brush.green, self.brush.blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempDrawImage setAlpha:self.brush.opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.brush.size);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.brush.red, self.brush.green, self.brush.blue, self.brush.opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:self.brush.opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}

-(void) clearCanvas {
     self.mainImage.image = nil;
}

-(void) setBrushColor:(UIColor*)color {
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    self.brush.red = components[0];
    self.brush.green = components[1];
    self.brush.blue = components[2];
    self.brush.opacity = components[3];
    
};

-(UIColor *) getBrushColor {
    return [UIColor colorWithRed:self.brush.red green:self.brush.green blue:self.brush.blue alpha:self.brush.opacity];
}

-(void) setBrushSize:(CGFloat) brushSize {
    self.brush.size = brushSize;
}

-(CGFloat) getBrushSize {
    return self.brush.size;
}


#pragma mark - Initialization

- (void)setup
{
    self.brush = [[RUBrush alloc] init];
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


@implementation RUBrush

-(id) init {
    self = [super init];
    if (self != nil) {
        self.red = 0.0/255.0;
        self.green = 0.0/255.0;
        self.blue = 0.0/255.0;
        self.size = 10.0;
        self.opacity = 1.0;
    }
    return self;
}

@end
