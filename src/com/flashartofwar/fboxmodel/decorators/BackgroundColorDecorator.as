package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.Graphics;

    public class BackgroundColorDecorator extends AbstractBackgroundDecorator implements IBackgroundColorDecorator
    {

        protected var _color:uint;
        protected var _hasColor:Boolean;
        private var _roundCorners:int = 0;

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

            if (_roundCorners == 0)
            {
                graphics.drawRect(offsetX, offsetY, width, height);
            }
            else
            {
                graphics.drawRoundRect(offsetX, offsetY, width, height, _roundCorners);
            }

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

        public function set roundCorners(value:int):void
        {
            _roundCorners = value;
        }
    }
}

