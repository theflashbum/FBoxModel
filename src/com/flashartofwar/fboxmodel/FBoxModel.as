package com.flashartofwar.fboxmodel
{
    import com.flashartofwar.fboxmodel.display.AncestorSprite;
    import com.flashartofwar.fboxmodel.renderers.BoxModelRenderer;
    import com.flashartofwar.fboxmodel.renderers.IBoxModelRenderer;

    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Rectangle;

    public class FBoxModel extends AncestorSprite implements IBoxModel,IBoxModelRenderer
    {

        public static const DRAW:String = "draw";
        protected var _invalid:Boolean;
        protected var boxModelRenderer:BoxModelRenderer;

        public function FBoxModel()
        {
            super(this);
            init();
        }

        protected function init():void {
            boxModelRenderer = createRenderer();
            addStageListeners();
        }

        protected function createRenderer():BoxModelRenderer {
            return new BoxModelRenderer(display, graphics);
        }
        
        /**
         * The fill color of the background
         * @return uint
         */
        public function get backgroundColor():uint
        {
            return boxModelRenderer.backgroundColor;
        }

        /**
         * @private
         */
        public function set backgroundColor(value:uint):void
        {
            boxModelRenderer.backgroundColor = value;
            invalidate();
        }

        /**
         * The fill color of the border
         * @return uint
         */
        public function get borderColor():uint
        {
            return boxModelRenderer.borderColor;
        }

        /**
         * @private
         */
        public function set borderColor(value:uint):void
        {
            boxModelRenderer.borderColor = value;
            invalidate();
        }

        /**
         * @private
         */
        public function set backgroundPosition(value:String):void
        {
            boxModelRenderer.backgroundPosition = value;

            invalidate();
        }

        /**
         * The Box Model padding values
         * @return Array
         */
        public function get padding():Array
        {
            return [ paddingTop, paddingRight, paddingBottom, paddingLeft ];
        }

        /**
         * @private
         */
        public function set padding(values:Array):void
        {
            boxModelRenderer.padding = values;
            invalidate();
        }

        /**
         * The Box Model margin values
         * @return Array
         */
        public function get margin():Array
        {
            return [ marginTop, marginRight, marginBottom, marginLeft ];
        }

        /**
         * @private
         */
        public function set margin(values:Array):void
        {
            boxModelRenderer.margin = values;

            invalidate();
        }

        /**
         * The full Box Model width including padding and border
         * @return Number
         */
        override public function get width():Number
        {
            return boxModelRenderer.width;
        }

        /**
         * The full Box Model height including padding and border
         * @return Number
         */
        override public function get height():Number
        {
            return boxModelRenderer.height;
        }

        /**
         * @private
         */
        public function set border(value:String):void
        {
            boxModelRenderer.border = value;

            invalidate();
        }

        protected function stringToColor(value:String):uint
        {
            value = value.substr(- 6, 6);
            var color:uint = Number("0x" + value);
            return color;
        }

        /**
         * Determines if any border values have been set
         * @return Boolean
         */
        public function get hasBorder():Boolean
        {
            var value:Number = borderTop + borderRight + borderBottom + borderLeft;
            return Boolean(value);
        }

        /**
         * Scale9Grid of the background image
         * @return Rectangle
         */
        public function get backgroundScale9Grid():Rectangle
        {
            return boxModelRenderer.backgroundScale9Grid;
        }

        /**
         * @private
         */
        public function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void
        {
            boxModelRenderer.backgroundScale9Grid = backgroundScale9Grid;
            invalidate();
        }

        /**
         * The repeat settings for the background image
         * @return String
         */
        public function get backgroundRepeat():String
        {
            return boxModelRenderer.backgroundRepeat;
        }

        /**
         * @private
         */
        public function set backgroundRepeat(backgroundRepeat:String):void
        {
            boxModelRenderer.backgroundRepeat = backgroundRepeat;
            invalidate();
        }

        /**
         * The background fill alpha
         * @return Number
         */
        public function get backgroundColorAlpha():Number
        {
            return boxModelRenderer.backgroundColorAlpha;
        }

        /**
         * @private
         */
        public function set backgroundColorAlpha(backgroundColorAlpha:Number):void
        {
            boxModelRenderer.backgroundColorAlpha = backgroundColorAlpha;
            invalidate();
        }

        /**
         * The Box Model padding top value
         * @return Number
         */
        public function get paddingTop():Number
        {
            return boxModelRenderer.paddingTop;
        }

        /**
         * @private
         */
        public function set paddingTop(paddingTop:Number):void
        {
            boxModelRenderer.paddingTop = paddingTop;
            invalidate();
        }

        /**
         * The Box Model padding right value
         * @return Number
         */
        public function get paddingRight():Number
        {
            return boxModelRenderer.paddingRight;
        }

        /**
         * @private
         */
        public function set paddingRight(paddingRight:Number):void
        {
            boxModelRenderer.paddingRight = paddingRight;
            invalidate();
        }

        /**
         * The Box Model padding bottom value
         * @return Number
         */
        public function get paddingBottom():Number
        {
            return boxModelRenderer.paddingBottom;
        }

        /**
         * @private
         */
        public function set paddingBottom(paddingBottom:Number):void
        {
            boxModelRenderer.paddingBottom = paddingBottom;
            invalidate();
        }

        /**
         * The Box Model padding left value
         * @return Number
         */
        public function get paddingLeft():Number
        {
            return boxModelRenderer.paddingLeft;
        }

        /**
         * @private
         */
        public function set paddingLeft(paddingLeft:Number):void
        {
            boxModelRenderer.paddingLeft = paddingLeft;
            invalidate();
        }

        /**
         * The Box Model margin top value
         * @return Number
         */
        public function get marginTop():Number
        {
            return boxModelRenderer.marginTop;
        }

        /**
         * @private
         */
        public function set marginTop(marginTop:Number):void
        {
            boxModelRenderer.marginTop = marginTop;
            invalidate();
        }

        /**
         * The Box Model margin right value
         * @return Number
         */
        public function get marginRight():Number
        {
            return boxModelRenderer.marginRight;
        }

        /**
         * @private
         */
        public function set marginRight(marginRight:Number):void
        {
            boxModelRenderer.marginRight = marginRight;
            invalidate();
        }

        /**
         * The Box Model margin bottom value
         * @return Number
         */
        public function get marginBottom():Number
        {
            return boxModelRenderer.marginBottom;
        }

        /**
         * @private
         */
        public function set marginBottom(marginBottom:Number):void
        {
            boxModelRenderer.marginBottom = marginBottom;
            invalidate();
        }

        /**
         * The Box Model margin left value
         * @return Number
         */
        public function get marginLeft():Number
        {
            return boxModelRenderer.marginLeft;
        }

        /**
         * @private
         */
        public function set marginLeft(marginLeft:Number):void
        {
            boxModelRenderer.marginLeft = marginLeft;
            invalidate();
        }

        /**
         * The Box Model border top value
         * @return Number
         */
        public function get borderTop():Number
        {
            return boxModelRenderer.borderTop;
        }

        /**
         * @private
         */
        public function set borderTop(borderTop:Number):void
        {
            boxModelRenderer.borderTop = borderTop;
            invalidate();
        }

        /**
         * The Box Model border right value
         * @return Number
         */
        public function get borderRight():Number
        {
            return boxModelRenderer.borderRight;
        }

        /**
         * @private
         */
        public function set borderRight(borderRight:Number):void
        {
            boxModelRenderer.borderRight = borderRight;
            invalidate();
        }

        /**
         * The Box Model border bottom value
         * @return Number
         */
        public function get borderBottom():Number
        {
            return boxModelRenderer.borderBottom;
        }

        /**
         * @private
         */
        public function set borderBottom(borderBottom:Number):void
        {
            boxModelRenderer.borderBottom = borderBottom;
            invalidate();
        }

        /**
         * The Box Model border left value
         * @return Number
         */
        public function get borderLeft():Number
        {
            return boxModelRenderer.borderLeft;
        }

        /**
         * @private
         */
        public function set borderLeft(borderLeft:Number):void
        {
            boxModelRenderer.borderLeft = borderLeft;
            invalidate();
        }

        /**
         * The Box Model border alpha value
         * @return Number
         */
        public function get borderAlpha():Number
        {
            return boxModelRenderer.borderAlpha;
        }

        /**
         * @private
         */
        public function set borderAlpha(borderAlpha:Number):void
        {
            boxModelRenderer.borderAlpha = borderAlpha;
            invalidate();
        }

        /**
         * The Box Model background x position
         * @return Number
         */
        public function get backgroundPositionX():Number
        {
            return boxModelRenderer.backgroundPositionX;
        }

        /**
         * @private
         */
        public function set backgroundPositionX(backgroundPositionX:Number):void
        {
            boxModelRenderer.backgroundPositionX = backgroundPositionX;
            invalidate();
        }

        /**
         * The Box Model background y position
         * @return Number
         */
        public function get backgroundPositionY():Number
        {
            return boxModelRenderer.backgroundPositionY;
        }

        /**
         * @private
         */
        public function set backgroundPositionY(backgroundPositionY:Number):void
        {
            boxModelRenderer.backgroundPositionY = backgroundPositionY;
            invalidate();
        }

        /**
         * Whether or not to show the Box Model debug padding
         * @return Boolean
         */
        public function get debugPadding():Boolean
        {
            return boxModelRenderer.debugPadding;
        }

        /**
         * @private
         */
        public function set debugPadding(debugPadding:Boolean):void
        {
            boxModelRenderer.debugPadding = debugPadding;
            invalidate();
        }

        /**
         * The Box Model debug padding color
         * @return uint
         */
        public function get debugPaddingColor():uint
        {
            return boxModelRenderer.debugPaddingColor;
        }

        /**
         * @private
         */
        public function set debugPaddingColor(debugPaddingColor:uint):void
        {
            boxModelRenderer.debugPaddingColor = debugPaddingColor;
            invalidate();
        }

        /**
         * The Box Model background image
         * @return Bitmap
         */
        public function get backgroundImageBitmap():Bitmap
        {
            return boxModelRenderer.backgroundImageBitmap;
        }

        /**
         * @private
         */
        public function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void
        {
            boxModelRenderer.backgroundImageBitmap = backgroundImageBitmap;
            invalidate();
        }

        /**
         * The Box Model background image alpha
         * @return uint
         */
        public function get backgroundImageAlpha():Number
        {
            return boxModelRenderer.backgroundImageAlpha;
        }

        /**
         * @private
         */
        public function set backgroundImageAlpha(backgroundImageAlpha:Number):void
        {
            boxModelRenderer.backgroundImageAlpha = backgroundImageAlpha;
            invalidate();
        }


        /**
         * Sets the backgroundPositionX and backgroundPositionY to 0
         */
        protected function resetBackgroundPosition():void
        {
            backgroundPositionX = backgroundPositionY = 0;
            invalidate();
        }

        public function clearProperties():void
        {
            boxModelRenderer.clearProperties();
            invalidate();
        }

        public function clearPadding():void
        {
            boxModelRenderer.clearPadding();
            invalidate();
        }

        public function clearMargin():void
        {
            boxModelRenderer.clearMargin();
            invalidate();
        }

        public function clearBorder():void
        {
            boxModelRenderer.clearBorder();
            invalidate();
        }

        public function clearBackground():void
        {
            boxModelRenderer.clearBackground();
            invalidate();
        }

        public function clearBackgroundImage():void
        {
            boxModelRenderer.clearBackgroundImage();
            invalidate();
        }

        override public function set width(value:Number):void
        {
            boxModelRenderer.width = value;
            dispatchEvent(new Event(Event.RESIZE));
            invalidate();
        }

        override public function set height(value:Number):void
        {
            boxModelRenderer.height = value;
            dispatchEvent(new Event(Event.RESIZE));
            invalidate();
        }

        /**
         * Creates a snapshot of the display object.
         *
         * @return BitmapData
         */
        public function get bitmapData():BitmapData
        {
            var bitmapData:BitmapData = new BitmapData(width, height, true);

            bitmapData.draw(this);

            return bitmapData;
        }

        /**
         * Forces a redraw of the display
         */
        override public function drawNow():void
        {
            draw();
        }

        /**
         *
         * @param targetCoordinateSpace
         * @return
         *
         */
        override public function getBounds(targetCoordinateSpace:DisplayObject):Rectangle
        {
            var bounds:Rectangle = super.getBounds(targetCoordinateSpace);
            return new Rectangle(bounds.x, bounds.y, width, height);
        }

        /**
         *
         * @param targetCoordinateSpace
         * @return
         *
         */
        override public function getRect(targetCoordinateSpace:DisplayObject):Rectangle
        {
            var rect:Rectangle = super.getRect(targetCoordinateSpace);
            return new Rectangle(rect.x, rect.y, width, height);
        }

        //--------------------------------------------------------------------------------
        //
        // Protected Methods
        //
        //--------------------------------------------------------------------------------


        protected function draw():void
        {
            dispatchEvent(new Event(DRAW));
            boxModelRenderer.drawBoxModel();
        }

        protected function invalidate(type:String = "all"):void
        {
            //TODO removed invalidationHash since we are not using it
            //invalidationHash[ type ] = true;

            //TODO This may be expensive, need to look into removing the Try Catch
            if (!_invalid)
            {
                try
                {
                    stage.invalidate();
                    _invalid = true;
                }
                catch(error:Error)
                {
                    _invalid = false;
                }
            }
        }

        protected function onAddedToStage(event:Event):void
        {
            stage.addEventListener(Event.RENDER, onRender, false, 0, true);
            draw();
        }

        protected function onRemovedFromStage(event:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
        }

        protected function onRender(event:Event = null):void
        {
            if (_invalid)
            {
                draw();
                _invalid = false;
            }
        }


        // Renderer

        protected function addStageListeners():void
        {
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
            addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true);
        }

        public function get display():Sprite
        {
            return _display;
        }

        public function set display(value:Sprite):void
        {
            _display = value;
        }

    }
}