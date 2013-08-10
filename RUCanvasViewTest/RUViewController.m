//
//  RUViewController.m
//  RUCanvasViewTest
//
//  Created by Raul on 8/9/13.
//  Copyright (c) 2013 Raul Uranga. All rights reserved.
//

#import "RUViewController.h"
#import "RUCanvasView.h"

@interface RUViewController ()
@property(nonatomic) RUCanvasView *canvas;
@end

@implementation RUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.canvas = [[RUCanvasView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.canvas.currentLine setRed:1.];
    [self.canvas.currentLine setGreen:0.];
    [self.canvas.currentLine setBlue:0.];
    [self.canvas.currentLine setOpacity:0.2];
    [self.view insertSubview:self.canvas atIndex:0];
}

- (IBAction)handleClear:(UIButton *)sender {
    [self.canvas clearCanvas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
