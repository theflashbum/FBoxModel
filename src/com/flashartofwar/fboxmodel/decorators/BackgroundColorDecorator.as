package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.Graphics;

    public class BackgroundColorDecorator extends AbstractBackgroundDecorator implements IBackgroundColorDecorator
    {

        protected var _color:uint = NaN;
        protected var _hasColor:Boolean;

        public function BackgroundColorDecorator(graphics:Graphics)
        {
            super(graphics);
        }

        public function get color():uint
        {
            return _color;
        }

        public function set color(value:uint):void
        {
            _hasColor = true;
            _color = value;

        }

        public function get hasColor():Boolean
        {
            return _hasColor;
        }

        /**
         *
         *
         */
        protected function drawBackgroundColor():void
        {
            graphics.beginFill(color, _alpha);
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

        override public function clear():void
        {
            super.clear();
            _color = 0;
            _hasColor = false;
        }
    }
}

