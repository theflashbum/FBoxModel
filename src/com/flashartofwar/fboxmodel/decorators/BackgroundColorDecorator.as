package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.Graphics;

    public class BackgroundColorDecorator extends AbstractBackgroundDecorator implements IBackgroundColorDecorator
    {

        protected var _backgroundColorAlpha:Number = 1;
        protected var _backgroundColor:uint;
        protected var colorSet:Boolean;

        public function BackgroundColorDecorator(graphics:Graphics)
        {
            super(graphics);
        }

        public function get color():uint
        {
            return _backgroundColor;
        }

        public function set color(value:uint):void
        {
            _backgroundColor = value;
            colorSet = !isNaN(color);
        }

        public function get hasColor():Boolean
        {
            return colorSet;
        }

        /**
         *
         *
         */
        protected function drawBackgroundColor():void
        {
            graphics.beginFill(color, _backgroundColorAlpha);
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

