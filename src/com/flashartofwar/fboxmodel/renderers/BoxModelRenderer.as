package com.flashartofwar.fboxmodel.renderers
{
    import com.flashartofwar.fboxmodel.decorators.BackgroundColorDecorator;
    import com.flashartofwar.fboxmodel.decorators.BackgroundImageDecorator;
    import com.flashartofwar.fboxmodel.decorators.BorderDecorator;
    import com.flashartofwar.fboxmodel.decorators.MarginDecorator;
    import com.flashartofwar.fboxmodel.decorators.PaddingDecorator;

    import flash.display.Bitmap;
    import flash.display.DisplayObjectContainer;
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Rectangle;

    public class BoxModelRenderer
    {

        public static const SAMPLE_BG:String = "sampleBackground";

        protected var graphics:Graphics;
        protected var display:DisplayObjectContainer;
        protected var _borderDecorator:BorderDecorator;
        protected var _paddingDecorator:PaddingDecorator;
        protected var _backgroundColorDecorator:BackgroundColorDecorator;
        protected var _backgroundImageDecorator:BackgroundImageDecorator;
        protected var DELIMITER:String = " ";
        protected var _debugPadding:Boolean = false;
        protected var _debugPaddingColor:uint = 0xFFFF00;
        protected var _width:Number = 0;
        protected var _height:Number = 0;
        private var _marginDecorator:MarginDecorator;

        public function BoxModelRenderer(display:Sprite, graphics:Graphics)
        {
            this.graphics = graphics;
            this.display = display;
        }

        /**
         *
         * @param tempBitmap
         *
         */

        protected function sampleBackground(bitmap:Bitmap):void
        {
            backgroundImageBitmap = new Bitmap(bitmap.bitmapData.clone());

            if (backgroundScale9Grid)
            {
                backgroundImageBitmap.scale9Grid = backgroundScale9Grid;
            }

            display.dispatchEvent(new Event(SAMPLE_BG));

        }

        public function drawBoxModel():void
        {

            calculatePadding();

            calculateBorder();

            // Start drawing
            graphics.clear();

            // Create Border
            drawBorder();
            drawBackground();

            alignDisplay();

        }


        /**
         *
         *
         */
        protected function drawBackground():void
        {
            backgroundColorDecorator.offsetX = borderDecorator.left + marginDecorator.left;
            backgroundColorDecorator.offsetY = borderDecorator.top + marginDecorator.top;
            backgroundColorDecorator.width = backgroundWidth;
            backgroundColorDecorator.height = backgroundHeight;
            backgroundColorDecorator.draw();

            backgroundImageDecorator.offsetX = borderDecorator.left;
            backgroundImageDecorator.offsetY = borderDecorator.top;
            backgroundImageDecorator.width = backgroundWidth;
            backgroundImageDecorator.height = backgroundHeight;

            backgroundImageDecorator.draw();
        }

        /**
         * Aligns the display with the appripriate padding, border
         */
        protected function alignDisplay():void
        {
            display.x = marginLeft + paddingLeft + borderLeft;
            display.y = marginTop + paddingTop + borderTop;
        }

        /**
         *
         */
        protected function drawBorder():void
        {
            borderDecorator.borderOffsetX = marginDecorator.left;
            borderDecorator.borderOffsetY = marginDecorator.top;
            borderDecorator.draw();
        }

        /**
         * The fill color of the background
         * @return uint
         */
        public function get backgroundColor():uint
        {
            return backgroundColorDecorator.color;
        }

        /**
         * @private
         */
        public function set backgroundColor(value:uint):void
        {
            backgroundColorDecorator.color = value;

        }

        /**
         * The fill color of the border
         * @return uint
         */
        public function get borderColor():uint
        {
            return borderDecorator.color;
        }

        /**
         * @private
         */
        public function set borderColor(value:uint):void
        {
            borderDecorator.color = value;

        }

        /**
         * @private
         */
        public function set backgroundPosition(value:String):void
        {
            var split:Array = value.split(DELIMITER, 2);

            backgroundPositionX = Number(split[0]);
            backgroundPositionY = Number(split[1]);


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
            paddingDecorator.boxValues = values;

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
            marginDecorator.boxValues = values;
        }

        /**
         * @private
         */
        public function set border(value:String):void
        {
            var values:Array = value.split(DELIMITER, 4);

            borderTop = borderRight = borderBottom = borderLeft = values[0];
            borderColor = stringToColor(values[2]);
            borderAlpha = ( values[3] != null ) ? Number(values[3]) : 1;


        }

        protected function stringToColor(value:String):uint
        {
            value = value.substr(- 6, 6);
            return Number("0x" + value);
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
            return backgroundImageDecorator.scale9Grid;
        }

        /**
         * @private
         */
        public function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void
        {
            backgroundImageDecorator.scale9Grid = backgroundScale9Grid;

        }

        /**
         * The repeat settings for the background image
         * @return String
         */
        public function get backgroundRepeat():String
        {
            return backgroundImageDecorator.repeat;
        }

        /**
         * @private
         */
        public function set backgroundRepeat(backgroundRepeat:String):void
        {
            backgroundImageDecorator.repeat = backgroundRepeat;

        }

        /**
         * The background fill alpha
         * @return Number
         */
        public function get backgroundColorAlpha():Number
        {
            return backgroundColorDecorator.alpha;
        }

        /**
         * @private
         */
        public function set backgroundColorAlpha(backgroundColorAlpha:Number):void
        {
            backgroundColorDecorator.alpha = backgroundColorAlpha;

        }

        /**
         * The Box Model padding top value
         * @return Number
         */
        public function get paddingTop():Number
        {
            return paddingDecorator.top;
        }

        /**
         * @private
         */
        public function set paddingTop(paddingTop:Number):void
        {
            paddingDecorator.top = paddingTop;

        }

        /**
         * The Box Model padding right value
         * @return Number
         */
        public function get paddingRight():Number
        {
            return paddingDecorator.right;
        }

        /**
         * @private
         */
        public function set paddingRight(paddingRight:Number):void
        {
            paddingDecorator.right = paddingRight;

        }

        /**
         * The Box Model padding bottom value
         * @return Number
         */
        public function get paddingBottom():Number
        {
            return paddingDecorator.bottom;
        }

        /**
         * @private
         */
        public function set paddingBottom(paddingBottom:Number):void
        {
            paddingDecorator.bottom = paddingBottom;

        }

        /**
         * The Box Model padding left value
         * @return Number
         */
        public function get paddingLeft():Number
        {
            return paddingDecorator.left;
        }

        /**
         * @private
         */
        public function set paddingLeft(paddingLeft:Number):void
        {
            paddingDecorator.left = paddingLeft;

        }

        /**
         * The Box Model margin top value
         * @return Number
         */
        public function get marginTop():Number
        {
            return marginDecorator.top;
        }

        /**
         * @private
         */
        public function set marginTop(marginTop:Number):void
        {
            marginDecorator.top = marginTop;

        }

        /**
         * The Box Model margin right value
         * @return Number
         */
        public function get marginRight():Number
        {
            return marginDecorator.right;
        }

        /**
         * @private
         */
        public function set marginRight(marginRight:Number):void
        {
            marginDecorator.right = marginRight;

        }

        /**
         * The Box Model margin bottom value
         * @return Number
         */
        public function get marginBottom():Number
        {
            return marginDecorator.bottom;
        }

        /**
         * @private
         */
        public function set marginBottom(marginBottom:Number):void
        {
            marginDecorator.bottom = marginBottom;

        }

        /**
         * The Box Model margin left value
         * @return Number
         */
        public function get marginLeft():Number
        {
            return marginDecorator.left;
        }

        /**
         * @private
         */
        public function set marginLeft(marginLeft:Number):void
        {
            marginDecorator.left = marginLeft;

        }

        /**
         * The Box Model border top value
         * @return Number
         */
        public function get borderTop():Number
        {
            return borderDecorator.top;
        }

        /**
         * @private
         */
        public function set borderTop(borderTop:Number):void
        {
            borderDecorator.top = borderTop;

        }

        /**
         * The Box Model border right value
         * @return Number
         */
        public function get borderRight():Number
        {
            return borderDecorator.right;
        }

        /**
         * @private
         */
        public function set borderRight(borderRight:Number):void
        {
            borderDecorator.right = borderRight;

        }

        /**
         * The Box Model border bottom value
         * @return Number
         */
        public function get borderBottom():Number
        {
            return borderDecorator.bottom;
        }

        /**
         * @private
         */
        public function set borderBottom(borderBottom:Number):void
        {
            borderDecorator.bottom = borderBottom;

        }

        /**
         * The Box Model border left value
         * @return Number
         */
        public function get borderLeft():Number
        {
            return borderDecorator.left;
        }

        /**
         * @private
         */
        public function set borderLeft(borderLeft:Number):void
        {
            borderDecorator.left = borderLeft;

        }

        /**
         * The Box Model border alpha value
         * @return Number
         */
        public function get borderAlpha():Number
        {
            return borderDecorator.alpha;
        }

        /**
         * @private
         */
        public function set borderAlpha(borderAlpha:Number):void
        {
            borderDecorator.alpha = borderAlpha;

        }

        /**
         * The Box Model background x position
         * @return Number
         */
        public function get backgroundPositionX():Number
        {
            return backgroundImageDecorator.imagePositionX;
        }

        /**
         * @private
         */
        public function set backgroundPositionX(backgroundPositionX:Number):void
        {
            backgroundImageDecorator.imagePositionX = backgroundPositionX;

        }

        /**
         * The Box Model background y position
         * @return Number
         */
        public function get backgroundPositionY():Number
        {
            return backgroundImageDecorator.imagePositionY;
        }

        /**
         * @private
         */
        public function set backgroundPositionY(backgroundPositionY:Number):void
        {
            backgroundImageDecorator.imagePositionY = backgroundPositionY;

        }

        /**
         * Whether or not to show the Box Model debug padding
         * @return Boolean
         */
        public function get debugPadding():Boolean
        {
            return _debugPadding;
        }

        /**
         * @private
         */
        public function set debugPadding(debugPadding:Boolean):void
        {
            _debugPadding = debugPadding;

        }

        /**
         * The Box Model debug padding color
         * @return uint
         */
        public function get debugPaddingColor():uint
        {
            return _debugPaddingColor;
        }

        /**
         * @private
         */
        public function set debugPaddingColor(debugPaddingColor:uint):void
        {
            _debugPaddingColor = debugPaddingColor;

        }

        /**
         * The Box Model background image
         * @return Bitmap
         */
        public function get backgroundImageBitmap():Bitmap
        {
            return backgroundImageDecorator.imageBitmap;
        }

        /**
         * @private
         */
        public function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void
        {
            backgroundImageDecorator.imageBitmap = backgroundImageBitmap;


        }

        /**
         * The Box Model background image alpha
         * @return uint
         */
        public function get backgroundImageAlpha():Number
        {
            return backgroundImageDecorator.alpha;
        }

        /**
         * @private
         */
        public function set backgroundImageAlpha(backgroundImageAlpha:Number):void
        {
            backgroundImageDecorator.alpha = backgroundImageAlpha;

        }


        //--------------------------------------------------------------------------------
        //
        // Public Methods
        //
        //--------------------------------------------------------------------------------

        /**
         * Clears all Box Model Properties
         */
        public function clearProperties():void
        {
            clearPadding();
            clearMargin();
            clearBorder();
            clearBackground();
        }

        /**
         * Sets padding values to 0
         */
        public function clearPadding():void
        {
            padding = [ 0,0,0,0 ];
        }

        /**
         * Sets margin values to 0
         */
        public function clearMargin():void
        {
            margin = [ 0, 0, 0, 0 ];
        }

        /**
         * Clears border information
         */
        public function clearBorder():void
        {
            borderAlpha = 1;
            borderLeft = borderRight = borderBottom = borderLeft = 0;
            borderDecorator.color = NaN;
        }

        public function clearBackgroundImage():void
        {
            backgroundImageDecorator.imageBitmap = null;
            backgroundColorDecorator.color = NaN;
        }

        /**
         * Clears the background of image and color
         */
        public function clearBackground():void
        {
            clearBackgroundImage();
            backgroundColorAlpha = NaN;
        }


        //--------------------------------------------------------------------------------
        //
        // Protected Methods
        //
        //--------------------------------------------------------------------------------

        //

        public function get width():Number
        {
            return marginLeft + borderLeft + backgroundWidth + borderRight + marginRight;
        }

        /**
         * @inheritDoc
         */
        public function set width(value:Number):void
        {
            if (_width == value) return;

            _width = ! isNaN(value) ? value : 0;

        }

        /**
         * @inheritDoc
         */
        public function get height():Number
        {
            return marginTop + borderTop + backgroundHeight + borderBottom + marginBottom;
        }

        /**
         * @inheritDoc
         */
        public function set height(value:Number):void
        {
            if (_height == value) return;
            _height = ! isNaN(value) ? value : 0;
        }

        /**
         * The width of the display container
         * @return Number
         */
        public function get displayWidth():Number
        {
            return display.width > _width ? display.width : _width;
        }

        /**
         * The height of the display container
         * @return Number
         */
        public function get displayHeight():Number
        {
            return display.height > _height ? display.height : _height;
        }

        public function get backgroundWidth():Number
        {
            return paddingDecorator.left + displayWidth + paddingDecorator.right;
        }

        public function get backgroundHeight():Number
        {
            return paddingDecorator.top + displayHeight + paddingDecorator.bottom;
        }

        /**
         * Calculates the size of the border rectangle
         */
        public function calculateBorder():void
        {
            borderDecorator.width = backgroundWidth + borderLeft + borderRight;
            borderDecorator.height = backgroundHeight + borderTop + borderBottom;
        }

        /**
         * Take content width and height + padding to calculate padding size
         */
        public function calculatePadding():void
        {
            paddingDecorator.paddingOffsetX = borderLeft;
            paddingDecorator.paddingOffsetY = borderTop;
        }

        public function get borderDecorator():BorderDecorator
        {
            return _borderDecorator ||= new BorderDecorator(graphics);
        }

        public function set borderDecorator(value:BorderDecorator):void
        {
            _borderDecorator = value;
        }

        public function get paddingDecorator():PaddingDecorator
        {
            return _paddingDecorator ||= new PaddingDecorator();
        }

        public function set paddingDecorator(value:PaddingDecorator):void
        {
            _paddingDecorator = value;
        }

        public function get backgroundColorDecorator():BackgroundColorDecorator
        {
            return _backgroundColorDecorator ||= new BackgroundColorDecorator(graphics);
        }

        public function set backgroundColorDecorator(value:BackgroundColorDecorator):void
        {
            _backgroundColorDecorator = value;
        }

        public function get backgroundImageDecorator():BackgroundImageDecorator
        {
            return _backgroundImageDecorator ||= new BackgroundImageDecorator(graphics);

        }

        public function set backgroundImageDecorator(value:BackgroundImageDecorator):void
        {
            _backgroundImageDecorator = value;
        }

        public function get marginDecorator():MarginDecorator
        {
            return _marginDecorator ||= new MarginDecorator();
        }

        public function set marginDecorator(value:MarginDecorator):void
        {
            _marginDecorator = value;
        }

        public function set roundCorners(value:int):void
        {
            _backgroundColorDecorator.roundCorners = _borderDecorator.roundCorners = value;
        }
    }
}