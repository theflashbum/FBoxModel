package com.flashartofwar.fboxmodel.decorators
{
import flash.display.Bitmap;
import flash.display.Graphics;
import flash.geom.Rectangle;

public interface IBoxModelBackground {

    function get backgroundImageBitmap():Bitmap;

    function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void;

    function get backgroundColorAlpha():Number;

    function set backgroundColorAlpha(value:Number):void;

    function get backgroundScale9Grid():Rectangle;

    function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void;

    function get width():Number;

    function set width(value:Number):void;

    function get height():Number;

    function set height(value:Number):void;

    function get backgroundRepeat():String;

    function set backgroundRepeat(value:String):void;

    function get backgroundPositionY():Number;

    function set backgroundPositionY(value:Number):void;

    function get backgroundPositionX():Number;

    function set backgroundPositionX(value:Number):void;

    function get backgroundImageAlpha():Number;

    function set backgroundImageAlpha(value:Number):void;

    function get backgroundColor():uint;

    function set backgroundColor(value:uint):void;

    function get useBackgroundColor():Boolean;
}
}