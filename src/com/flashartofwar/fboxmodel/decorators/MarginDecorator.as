package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.DisplayObject;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class MarginDecorator extends AbstractBoxDecorator
    {

        private var offset:Point = new Point();

        public function MarginDecorator()
        {
            super(this);
        }

        public function get marginOffsetX():Number
        {
            return offset.x;
        }

        public function set marginOffsetX(value:Number):void
        {
            offset.x = value;
        }

        public function get marginOffsetY():Number
        {
            return offset.y;
        }

        public function set marginOffsetY(value:Number):void
        {
            offset.y = value;
        }

        /**
         * The Box Model margin values
         * @return Array
         */
        public function get margin():Array
        {
            return boxValues;
        }

        /**
         * @private
         */
        public function set margin(values:Array):void
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