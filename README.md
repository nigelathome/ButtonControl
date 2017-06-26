# ButtonControl
The issue needed to be solve 

1.slide the scrollview horizontally 

2.embed into network video player 

3.play record music background (✅)

4.develop doll catcher just like the game Carnival

setup the view shows in landscape

private var _orientations = UIInterfaceOrientationMask.landscapeRight
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return self._orientations }
        set { self._orientations = newValue }
    }
