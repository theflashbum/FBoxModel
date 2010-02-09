package com.flashartofwar.fboxmodel.display
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;
    import flash.errors.IllegalOperationError;
    import flash.utils.Dictionary;

    public class AncestorSprite extends Sprite implements IAncestorSprite
    {
        protected var _display:DisplayObjectContainer;
        protected var registeredListeners:Dictionary = new Dictionary();

        /**
         * @author jessefreeman
         * @author Justin Akin
         */
        public function AncestorSprite(self:AncestorSprite)
        {
            if (self != this)
                throw new IllegalOperationError("AbstractBoxModelDisplay cannot be instantiated directly.");
            else
                addDisplay();
        }

        //--------------------------------------------------------------------------------
        //
        // Public Getters and Setters
        //
        //--------------------------------------------------------------------------------

        /**
         * @inheritDoc
         */
        /*override public function get graphics():Graphics
         {
         return display.graphics;
         }*/

        /**
         * @inheritDoc
         */
        override public function get numChildren():int
        {
            return _display.numChildren;
        }

        /**
         * @inheritDoc
         */
        override public function get parent():DisplayObjectContainer
        {
            if (super.parent) return super.parent.name == "display" ? super.parent.parent : super.parent;

            return super.parent;
        }


        //--------------------------------------------------------------------------------
        //
        // Public Methods
        //
        //--------------------------------------------------------------------------------


        /**
         * @inheritDoc
         */
        override public function addChild(child:DisplayObject):DisplayObject
        {
            return _display.addChild(child);
        }

        /**
         * @inheritDoc
         */
        override public function addChildAt(child:DisplayObject, index:int):DisplayObject
        {
            return _display.addChildAt(child, index);
        }

        /**
         * @inheritDoc
         */
        override public function contains(child:DisplayObject):Boolean
        {
            return _display.contains(child);
        }

        /**
         * @inheritDoc
         */
        override public function getChildAt(index:int):DisplayObject
        {
            return _display.getChildAt(index);
        }

        /**
         * @inheritDoc
         */
        override public function getChildByName(name:String):DisplayObject
        {
            return _display.getChildByName(name);
        }

        /**
         * @inheritDoc
         */
        override public function getChildIndex(child:DisplayObject):int
        {
            return _display.getChildIndex(child);
        }

        /**
         * @inheritDoc
         */
        override public function removeChild(child:DisplayObject):DisplayObject
        {
            return _display.removeChild(child);
        }

        /**
         * @inheritDoc
         */
        override public function removeChildAt(index:int):DisplayObject
        {
            return _display.removeChildAt(index);
        }

        /**
         * @inheritDoc
         */
        override public function setChildIndex(child:DisplayObject, index:int):void
        {
            _display.setChildIndex(child, index);
        }

        /**
         * @inheritDoc
         */
        override public function swapChildren(child1:DisplayObject, child2:DisplayObject):void
        {
            _display.swapChildren(child1, child2);
        }

        /**
         * @inheritDoc
         */
        override public function swapChildrenAt(index1:int, index2:int):void
        {
            _display.swapChildrenAt(index1, index2);
        }

        //--------------------------------------------------------------------------------
        //
        // Protected Methods
        //
        //--------------------------------------------------------------------------------

        /**
         * Adds the display to the display tree by default
         */
        protected function addDisplay():void
        {
            _display = new Sprite();
            _display.name = "display";

            $addChild(_display);
        }

        /**
         * @private
         */

        final protected function $addChild(child:DisplayObject):DisplayObject
        {
            return super.addChild(child);
        }

        /**
         * @private
         */
        final protected function $addChildAt(child:DisplayObject, index:int):DisplayObject
        {
            return super.addChildAt(child, index);
        }

        /**
         * @private
         */
        final protected function $contains(child:DisplayObject):Boolean
        {
            return super.contains(child);
        }

        /**
         * @private
         */
        final protected function $getChildAt(index:int):DisplayObject
        {
            return super.getChildAt(index);
        }

        /**
         * @private
         */
        final protected function $getChildByName(name:String):DisplayObject
        {
            return super.getChildByName(name);
        }

        /**
         * @private
         */
        final protected function $getChildIndex(child:DisplayObject):int
        {
            return super.getChildIndex(child);
        }

        /**
         * @private
         */
        final protected function $removeChild(child:DisplayObject):DisplayObject
        {
            return super.removeChild(child);
        }

        /**
         * @private
         */
        final protected function $removeChildAt(index:int):DisplayObject
        {
            return super.removeChildAt(index);
        }

        /**
         * @private
         */
        final protected function $setChildIndex(child:DisplayObject, index:int):void
        {
            super.setChildIndex(child, index);
        }

        /**
         * @private
         */
        final protected function $swapChildren(child1:DisplayObject, child2:DisplayObject):void
        {
            super.swapChildren(child1, child2);
        }

        /**
         * @private
         */
        final protected function $swapChildrenAt(index1:int, index2:int):void
        {
            super.swapChildrenAt(index1, index2);
        }


        public function drawNow():void
        {

        }
    }
}
