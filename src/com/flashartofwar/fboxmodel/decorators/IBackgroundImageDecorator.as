package com.flashartofwar.fboxmodel.decorators
{
import flash.display.Bitmap;
import flash.geom.Rectangle;

public interface IBackgroundImageDecorator{

    function get imageBitmap():Bitmap;

    function set imageBitmap(backgroundImageBitmap:Bitmap):void;

    function get scale9Grid():Rectangle;

    function set scale9Grid(backgroundScale9Grid:Rectangle):void;

    function get repeat():String;

    function set repeat(value:String):void;

    function get imagePositionY():Number;

    function set imagePositionY(value:Number):void;

    function get imagePositionX():Number;

    function set imagePositionX(value:Number):void

}
}