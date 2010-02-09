package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;

    public class PaddingDecorator extends AbstractBoxDecorator
    {


        private var _height:Number = 0;
        private var _width:Number = 0;
        private var paddingRect:Rectangle = new Rectangle();
        private var _target:DisplayObject;

        public function PaddingDecorator(target:DisplayObject)
        {
            super(this);
            _target = target;
        }

        /**
         * @inheritDoc
         */

        public function get height():Number
        {
            var tempHeight:Number = _target.height > _height ? _target.height : _height;
            return top + tempHeight + bottom;
        }

        /**
         * @inheritDoc
         */

        public function set height(value:Number):void
        {
            if (_height == value) return;
            _height = ! isNaN(value) ? value : 0;
            calculatePaddingHeight();

        }

        /**
         * The width of the display container
         * @return Number
         */

        public function get displayWidth():Number
        {
            return _target.width > _width ? _target.width : _width;
        }

        /**
         * @inheritDoc
         */


        public function set width(value:Number):void
        {
            if (_width == value) return;
            _width = ! isNaN(value) ? value : 0;
            calculatePaddingWidth();
        }

        public function get width():Number
        {
            var tempHeight:Number = _target.width > _height ? _target.width : _height;
            return left + tempHeight + right;
        }

        /**
         * The height of the display container
         * @return Number
         */
        public function get displayHeight():Number
        {
            return _target.height > _height ? _target.height : _height;
        }


        public function get paddingOffsetX():Number
        {
            return paddingRect.x;
        }

        public function set paddingOffsetX(value:Number):void
        {
            paddingRect.x = value;
        }

        public function get paddingOffsetY():Number
        {
            return paddingRect.y;
        }

        public function set paddingOffsetY(value:Number):void
        {
            paddingRect.y = value;
        }

        /**
         * The Box Model padding values
         * @return Array
         */
        public function get padding():Array
        {
            return boxValues;
        }

        /**
         * @private
         */
        public function set padding(values:Array):void
        {
            boxValues = values;

        }

        protected function calculatePaddingWidth():void
        {
            paddingRect.width = left + displayWidth + right;
        }

        protected function calculatePaddingHeight():void
        {
            paddingRect.height = top + displayHeight + bottom;
        }

        public function get x():Number
        {
            return paddingRect.x;
        }

        public function set x(value:Number):void
        {
            paddingRect.x = value
        }

        public function get y():Number
        {
            return paddingRect.y;
        }

        public function set y(value:Number):void
        {
            paddingRect.y = value
        }
    }
}