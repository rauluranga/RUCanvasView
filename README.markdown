RUCanvasView
=================

Lightweight implementation for drawing on iOS, based on the [@raywenderlich](https://twitter.com/rwenderlich) tutorial: [How To Make A Simple Drawing App with UIKit.](http://www.raywenderlich.com/18840/how-to-make-a-simple-drawing-app-with-uikit)

### Implementation 
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
    [canvas.currentLine setRed:1.f];
    [canvas.currentLine setGreen:0.f];
    [canvas.currentLine setBlue:0.f];
    [canvas.currentLine setOpacity:0.2];
    [canvas.currentLine setBrush:5.f]
```