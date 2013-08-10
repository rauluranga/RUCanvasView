//
//  RUCanvasView.h
//  DrawingTest
//
//  Created by Raul on 8/9/13.
//  Copyright (c) 2013 Raul Uranga. All rights reserved.
//

// All source code from Ray Wenderlich tutorial
//@see http://www.raywenderlich.com/18840/how-to-make-a-simple-drawing-app-with-uikit

#import <UIKit/UIKit.h>

@class RULine;

@interface RUCanvasView : UIView

@property(nonatomic, readonly) RULine *currentLine;

-(void) clearCanvas;

@end

@interface RULine : NSObject

@property (nonatomic, assign) CGFloat red;
@property (nonatomic, assign) CGFloat green;
@property (nonatomic, assign) CGFloat blue;
@property (nonatomic, assign) CGFloat brush;
@property (nonatomic, assign) CGFloat opacity;

-(id) initWithRedColor:(CGFloat)red blueColor:(CGFloat)blue greenColor:(CGFloat)green brushSize:(CGFloat)brush opacity:(CGFloat)opacity;

@end



