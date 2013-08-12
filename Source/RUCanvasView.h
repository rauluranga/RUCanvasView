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

@interface RUCanvasView : UIView

-(void) clearCanvas;

-(void) setBrushColor:(UIColor*)color;
-(UIColor *) getBrushColor;

-(void) setBrushSize:(CGFloat) brushSize;
-(CGFloat) getBrushSize;

@end



