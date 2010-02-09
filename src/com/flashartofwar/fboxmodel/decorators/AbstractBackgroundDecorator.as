package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.Graphics;

    public class AbstractBackgroundDecorator implements IBackgroundDecorator, IDecorator
    {

        protected var _alpha:Number = 1;
        protected var _offsetX:Number;
        protected var _offsetY:Number;
        protected var _width:Number;
        protected var _height:Number;
        protected var _graphics:Graphics;

        public function AbstractBackgroundDecorator(graphics:Graphics)
        {
            this.graphics = graphics
        }

        public function get alpha():Number
        {
            return _alpha;
        }

        public function set alpha(value:Number):void
        {
            _alpha = value;
        }

        public function get width():Number
        {
            return _width;
        }

        public function set width(value:Number):void
        {
            _width = value;
        }

        public function get height():Number
        {
            return _height;
        }

        public function set height(value:Number):void
        {
            _height = value;
        }

        public function get offsetX():Number
        {
            return _offsetX;
        }

        public function set offsetX(value:Number):void
        {
            _offsetX = value;
        }

        public function get offsetY():Number
        {
            return _offsetY;
        }

        public function set offsetY(value:Number):void
        {
            _offsetY = value;
        }

        protected function set graphics(value:Graphics):void
        {
            _graphics = value;
        }

        protected function get graphics():Graphics
        {
            return _graphics;
        }

        /**
         *
         *
         */
        public function draw():void
        {

        }

    }
}

