package com.flashartofwar.fboxmodel.decorators
{
    import flash.geom.Rectangle;

    public interface IBoxModelBorder
    {

        function get width():Number;

        function set width(value:Number):void;

        function get height():Number;

        function set height(value:Number):void;

        function get borderRect():Rectangle;

        function set borderRect(value:Rectangle):void;

        function get alpha():Number;

        function set alpha(value:Number):void;

        function get color():uint;

        function set color(value:uint):void;

        function get borderOffsetX():Number;

        function set borderOffsetX(value:Number):void;

        function get borderOffsetY():Number;

        function set borderOffsetY(value:Number):void;

        function set roundCorners(value:int):void
    }
}