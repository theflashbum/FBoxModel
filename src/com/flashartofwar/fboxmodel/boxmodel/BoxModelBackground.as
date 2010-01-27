package com.flashartofwar.fboxmodel.boxmodel {

import flash.display.Bitmap;
import flash.display.Graphics;
import flash.events.EventDispatcher;
import flash.geom.Rectangle;

internal class BoxModelBackground extends EventDispatcher implements IBoxModelBackground
{
    protected var delimiter:String = " ";

    protected var _backgroundImageBitmap:Bitmap;

    protected var _backgroundColor:Number;
    protected var _backgroundScale9Grid:Rectangle;
    protected var _backgroundRepeat:String;
    protected var _backgroundColorAlpha:Number;
    protected var _backgroundPositionX:Number = 0;
    protected var _backgroundPositionY:Number = 0;
    protected var _backgroundImageAlpha:Number = 1;
    protected var _width:Number = 0;
    protected var _height:Number = 0;
    protected var _graphics:Graphics;
    protected var _offsetX:Number;
    protected var _offsetY:Number;

    //--------------------------------------------------------------------------------
    //
    // Constructor
    //
    //--------------------------------------------------------------------------------

    /**
     *
     */

    public function BoxModelBackground(graphics:Graphics)
    {                
        _graphics = graphics;
    }

    //--------------------------------------------------------------------------------
    //
    // Public Getters and Setters
    //
    //--------------------------------------------------------------------------------

    /**
     * The fill color of the background
     * @return uint
     */
    public function get backgroundColor():uint
    {
        return _backgroundColor;
    }

    /**
     * @private
     */
    public function set backgroundColor(value:uint):void
    {
        _backgroundColor = value;

    }

    /**
     * @private
     */
    public function set backgroundPosition(value:String):void
    {
        var split:Array = value.split(delimiter, 2);

        backgroundPositionX = Number(split[0]);
        backgroundPositionY = Number(split[1]);
    }

    /**
     * Scale9Grid of the background image
     * @return Rectangle
     */
    public function get backgroundScale9Grid():Rectangle
    {
        return _backgroundScale9Grid;
    }

    /**
     * @private
     */
    public function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void
    {
        _backgroundScale9Grid = backgroundScale9Grid;

    }

    /**
     * The repeat settings for the background image
     * @return String
     */
    public function get backgroundRepeat():String
    {
        return _backgroundRepeat;
    }

    /**
     * @private
     */
    public function set backgroundRepeat(value:String):void
    {
        _backgroundRepeat = value;

    }

    /**
     * The background fill alpha
     * @return Number
     */
    public function get backgroundColorAlpha():Number
    {
        return _backgroundColorAlpha;
    }

    /**
     * @private
     */
    public function set backgroundColorAlpha(backgroundColorAlpha:Number):void
    {
        _backgroundColorAlpha = backgroundColorAlpha;

    }

    /**
     * The Box Model background x position
     * @return Number
     */
    public function get backgroundPositionX():Number
    {
        return _backgroundPositionX;
    }

    /**
     * @private
     */
    public function set backgroundPositionX(backgroundPositionX:Number):void
    {
        _backgroundPositionX = backgroundPositionX;

    }

    /**
     * The Box Model background y position
     * @return Number
     */
    public function get backgroundPositionY():Number
    {
        return _backgroundPositionY;
    }

    /**
     * @private
     */
    public function set backgroundPositionY(backgroundPositionY:Number):void
    {
        _backgroundPositionY = backgroundPositionY;

    }

    /**
     * The Box Model background image
     * @return Bitmap
     */
    public function get backgroundImageBitmap():Bitmap
    {
        return _backgroundImageBitmap;
    }

    /**
     * @private
     */
    public function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void
    {
        _backgroundImageBitmap = backgroundImageBitmap;

    }

    /**
     * The Box Model background image alpha
     * @return uint
     */
    public function get backgroundImageAlpha():Number
    {
        return _backgroundImageAlpha;
    }

    /**
     * @private
     */
    public function set backgroundImageAlpha(backgroundImageAlpha:Number):void
    {
        _backgroundImageAlpha = backgroundImageAlpha;

    }


    //--------------------------------------------------------------------------------
    //
    // Public Methods
    //
    //--------------------------------------------------------------------------------

    /**
     * Clears all Box Model Properties
     */
    public function clearProperties():void
    {
        clearBackground();
    }

    public function clearBackgroundImage():void
    {
        _backgroundImageBitmap = null;
        _backgroundColor = NaN;
    }

    /**
     * Clears the background of image and color
     */
    public function clearBackground():void
    {
        clearBackgroundImage();
        backgroundColorAlpha = NaN;
    }

    public function get graphics():Graphics {
        return _graphics;
    }

    public function get width():Number {
        return _width;
    }

    public function set width(value:Number):void {
        _width = value;
    }

    public function get height():Number {
        return _height;
    }

    public function set height(value:Number):void {
        _height = value;
    }
    
    public function get offsetX():Number {
        return _offsetX;
    }

    public function get offsetY():Number {
        return _offsetY;
    }

    public function get useBackgroundColor():Boolean {
        return !isNaN(_backgroundColor);
    }

}
}