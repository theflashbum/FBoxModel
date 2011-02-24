package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.DisplayObject;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class PaddingDecorator extends AbstractBoxDecorator
    {

        private var offset:Point = new Point();

        public function PaddingDecorator()
        {
            super(this);
        }

        public function get paddingOffsetX():Number
        {
            return offset.x;
        }

        public function set paddingOffsetX(value:Number):void
        {
            offset.x = value;
        }

        public function get paddingOffsetY():Number
        {
            return offset.y;
        }

        public function set paddingOffsetY(value:Number):void
        {
            offset.y = value;
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

        public function get x():Number
        {
            return offset.x;
        }

        public function set x(value:Number):void
        {
            offset.x = value
        }

        public function get y():Number
        {
            return offset.y;
        }

        public function set y(value:Number):void
        {
            offset.y = value
        }
    }
}