package com.flashartofwar.fboxmodel.renderers
{

    import flash.display.DisplayObjectContainer;
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.display.Stage;

    public interface IBoxModelRenderer
    {
        function get graphics():Graphics;

        function get display():Sprite;

        function set display(value:Sprite):void;

        function get stage():Stage;
    }
}