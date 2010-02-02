package com.flashartofwar.fboxmodel.decorators {
import flash.display.Graphics;
import flash.geom.Rectangle;

public class BorderDecorator extends AbstractBoxDecorator implements IDisplay, IBoxModelBorder{

    protected var _borderRect:Rectangle = new Rectangle();
    protected var _borderAlpha:Number = 1;
    protected var _borderColor:uint = 0x000000;
    protected var _graphics:Graphics;

    public function BorderDecorator(graphics:Graphics) {
        super(this);
        this.graphics = graphics;
    }

    public function get borderRect():Rectangle {
        return _borderRect;
    }

    public function set borderRect(value:Rectangle):void {
        _borderRect = value;
    }

    public function get alpha():Number {
        return _borderAlpha;
    }

    public function set alpha(value:Number):void {
        _borderAlpha = value;
    }

    public function get color():uint {
        return _borderColor;
    }

    public function set color(value:uint):void {
        _borderColor = value;
    }

    public function get width():Number {
        return borderRect.width;
    }

    public function set width(value:Number):void {
        borderRect.width = value;
    }

    public function get height():Number {
        return borderRect.height;
    }

    public function set height(value:Number):void {
        borderRect.height = value;
    }

    public function set borderThickness(value:Number):void {
        boxValues = [value,value,value,value];
    }

    public function get borderOffsetX():Number {
        return _borderRect.x;
    }

    public function set borderOffsetX(value:Number):void {
        _borderRect.x = value;
    }

    public function get borderOffsetY():Number {
        return _borderRect.y;
    }

    public function set borderOffsetY(value:Number):void {
        _borderRect.y = value;
    }

    protected function set graphics(value:Graphics):void
    {
        _graphics = value;
    }

    protected function get graphics():Graphics
    {
        return _graphics;
    }
    
    public function get hasBorder():Boolean
    {
        return ((top+right+bottom+left) > 0);
    }
    /**
     * The Box Model padding values
     * @return Array
     */
    public function get border():Array
    {
        return boxValues;
    }

    /**
     * @private
     */
    public function set border(values:Array):void
    {
        boxValues = values;

    }
    
    public function draw():void
    {
        if (hasBorder)
        {
        graphics.beginFill(_borderColor, _borderAlpha);
        graphics.drawRect(_borderRect.x, _borderRect.y, _borderRect.width, _borderRect.height);
        //TODO this could be optimized by pre-calculating when setting the width and height
        graphics.drawRect(_borderRect.x + left, _borderRect.y + top, _borderRect.width - (left + right), _borderRect.height - (top + bottom));
        graphics.endFill();
        }
    }
    
}

}