package com.flashartofwar.fboxmodel.renderer
{

    import flash.display.DisplayObjectContainer;
    import flash.display.Graphics;
    import flash.display.Stage;

    public interface IBoxModelRenderer
    {
        function get graphics():Graphics;

        function get display():DisplayObjectContainer;

        function set display(value:DisplayObjectContainer):void;

        function get stage():Stage;
    }
}