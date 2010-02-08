package com.flashartofwar.fboxmodel.decorators{
import flash.display.Graphics;

public class BackgroundColorDecorator extends AbstractBackgroundDecorator implements IBackgroundColorDecorator{

    protected var _backgroundColorAlpha:Number = 1;
    protected var _backgroundColor:uint;

    public function BackgroundColorDecorator(graphics:Graphics) {
        super(graphics);
    }

    public function get color():uint {
        return _backgroundColor;
    }

    public function set color(value:uint):void {
        _backgroundColor = value;
    }

    public function get hasColor():Boolean {
        return !isNaN(color);
    }

    /**
     *
     *
     */
    protected function drawBackgroundColor():void
    {

        alpha = isNaN(alpha) ? 1 : alpha;

        graphics.beginFill(color, alpha);
        graphics.drawRect(offsetX, offsetY, width, height);
        graphics.endFill();

    }

    /**
     *
     *
     */
    override public function draw():void
    {
        // Start drawing
        if (hasColor) drawBackgroundColor();
    }


}
}

