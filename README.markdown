RUCanvasView
=================

Lightweight implementation for drawing on iOS, based on the [@raywenderlich](https://twitter.com/rwenderlich) tutorial: [How To Make A Simple Drawing App with UIKit.](http://www.raywenderlich.com/18840/how-to-make-a-simple-drawing-app-with-uikit)

#Installation

###With CocoaPods

Just add this line to your podfile

```
pod 'RUCanvasView', :git => 'https://github.com/rauluranga/RUCanvasView'
```

#Manual installation

Just drag & drop RUCanvasView.h/.m into your project.

# Implementation 
Easy as pie.

``` objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RUCanvasView *canvas = [[RUCanvasView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:canvas];
}
```

and BAM! you have now all the basic implementation for a drawing application.

### Line Options 
You can modify line style using the following code:

``` objective-c
    [self.canvas setBrushColor:[UIColor colorWithRed:1. green:0. blue:0. alpha:0.2]];
    [self.canvas setBrushSize:5.f];
```