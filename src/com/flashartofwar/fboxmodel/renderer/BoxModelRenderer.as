package com.flashartofwar.fboxmodel.renderer {
import com.flashartofwar.fboxmodel.decorators.BorderDecorator;
import com.flashartofwar.fboxmodel.decorators.PaddingDecorator;
import com.flashartofwar.fboxmodel.enum.BgRepeatProps;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.events.Event;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Rectangle;

public class BoxModelRenderer {

    public static const SAMPLE_BG:String = "sampleBackground";

    protected var target:IBoxModelRenderer;
    private var graphics:Graphics;
    private var display:DisplayObjectContainer;

    private var borderDecorator:BorderDecorator;
    private var paddingDecorator:PaddingDecorator;

    public function BoxModelRenderer(target:IBoxModelRenderer) {
        this.target = target;
        
        graphics = target.graphics;
        display = target.display;

        borderDecorator = new BorderDecorator(graphics);
        paddingDecorator = new PaddingDecorator(target.display);
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

        target.display.dispatchEvent(new Event(SAMPLE_BG));
        //invalidate();
    }

    /**
     *
     *
     */
    public function drawBoxModel():void
    {

        calculatePadding();

        calculateBorder();

        // Start drawing
        graphics.clear();

        // Create Border
        if (hasBorder) drawBorder();
        if (!isNaN(backgroundColor)) drawBackgroundColor();

        drawBackgroundImage();

        graphics.endFill();

        alignDisplay();

    }

    /**
     * Aligns the display with the appripriate padding, border
     */
    protected function alignDisplay():void
    {
        display.x = paddingLeft + borderLeft;
        display.y = paddingTop + borderTop;
    }

    /**
     *
     */
    protected function drawBorder():void
    {
        /*graphics.beginFill(borderColor, borderAlpha);
        graphics.drawRect(borderRectX, borderRectY, borderRectWidth, borderRectHeight);
        graphics.drawRect(borderLeft, borderTop, paddingRectWidth, paddingRectHeight);*/
        //trace( borderLeft, borderTop, _paddingRectangle.width, _paddingRectangle.height );

        borderDecorator.draw();
    }

    /**
     *
     */
    protected function drawBackgroundImage():void
    {
        //
        if (backgroundImageBitmap)
        {
            var bgiFullW:Number = paddingLeft + displayWidth + paddingRight;
            var bgiFullH:Number = paddingTop + displayHeight + paddingBottom;

            var bgiW:Number = backgroundImageBitmap.width;
            var bgiH:Number = backgroundImageBitmap.height;

            var bgX:Number = paddingDecorator.paddingOffsetX;
            var bgY:Number = paddingDecorator.paddingOffsetY;

            var m:Matrix = new Matrix();

            var bmd:BitmapData = new BitmapData(bgiW, bgiH, true, 0x00FFFFFF);

            switch (backgroundRepeat)
            {
                case BgRepeatProps.NO_REPEAT:
                    bgX = backgroundPositionX + borderLeft;
                    bgY = backgroundPositionY + borderTop;
                    m.translate(bgX, bgY);
                    break;
                case BgRepeatProps.REPEAT_X:
                    bgiW = bgiFullW;
                    m.translate(borderLeft, borderTop);
                    break;
                case BgRepeatProps.REPEAT_Y:
                    bgiH = bgiFullH;
                    m.translate(borderLeft, borderTop);
                    break;
                default:
                    bgiW = bgiFullW;
                    bgiH = bgiFullH;
                    m.translate(borderLeft, borderTop);
                    break;
            }

            bmd.draw(backgroundImageBitmap, null, new ColorTransform(1, 1, 1, backgroundImageAlpha));

            graphics.beginBitmapFill(bmd, m, true, false);
            graphics.drawRect(bgX, bgY, bgiW, bgiH);
            graphics.endFill();
        }
    }

    /**
     *
     *
     */
    protected function drawBackgroundColor():void
    {
        var tempColor:uint = debugPadding ? debugPaddingColor : backgroundColor;

        backgroundColorAlpha = isNaN(backgroundColorAlpha) ? 1 : backgroundColorAlpha;

        graphics.beginFill(tempColor, backgroundColorAlpha);
        graphics.drawRect(paddingDecorator.paddingOffsetX, paddingDecorator.paddingOffsetY, paddingDecorator.width, paddingDecorator.height);
        graphics.endFill();

        if (debugPadding)
        {
            graphics.beginFill(backgroundColor, backgroundColorAlpha);
            graphics.drawRect(paddingLeft + borderLeft, paddingTop + borderTop, displayWidth, displayHeight);
            graphics.endFill();
        }
    }

    private function onRender(event:Event):void {
        drawBoxModel();
    }
    
    
    protected var DELIMITER:String = " ";

    protected var _backgroundImageBitmap:Bitmap;
    //protected var _paddingRectangle:Rectangle = new Rectangle();
    //protected var _borderRectangle:Rectangle = new Rectangle();
    protected var _backgroundColor:Number;
    //protected var _borderColor:Number;
    protected var _backgroundScale9Grid:Rectangle;
    protected var _backgroundRepeat:String;
    protected var _backgroundColorAlpha:Number;
    //protected var _paddingTop:Number = 0;
    //protected var _paddingRight:Number = 0;
    //protected var _paddingBottom:Number = 0;
    //protected var _paddingLeft:Number = 0;
    protected var _marginTop:Number = 0;
    protected var _marginRight:Number = 0;
    protected var _marginBottom:Number = 0;
    protected var _marginLeft:Number = 0;
    //protected var _borderTop:Number = 0;
//    protected var _borderRight:Number = 0;
//    protected var _borderBottom:Number = 0;
//    protected var _borderLeft:Number = 0;
//    protected var _borderProperties:String;
//    protected var _borderAlpha:Number = 1;
    protected var _backgroundPositionX:Number = 0;
    protected var _backgroundPositionY:Number = 0;
    protected var _debugPadding:Boolean = false;
    protected var _debugPaddingColor:uint = 0xFFFF00;
    protected var _backgroundImageAlpha:Number = 1;
    protected var _width:Number = 0;
    protected var _height:Number = 0;

    //--------------------------------------------------------------------------------
    //
    // Constructor
    //
    //--------------------------------------------------------------------------------


    //--------------------------------------------------------------------------------
    //
    // Public Getters and Setters
    //
    //--------------------------------------------------------------------------------

    /**
     * The fill color of the background
     * @return uint
     */
    public function get backgroundColor():uint
    {
        return _backgroundColor;
    }

    /**
     * @private
     */
    public function set backgroundColor(value:uint):void
    {
        _backgroundColor = value;

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
        values = validateOffset(values);
        paddingTop = values[0];
        paddingRight = values[1];
        paddingBottom = values[2];
        paddingLeft = values[3];

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
        values = validateOffset(values);

        marginTop = values[0];
        marginRight = values[1];
        marginBottom = values[2];
        marginLeft = values[3];


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
        return _backgroundScale9Grid;
    }

    /**
     * @private
     */
    public function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void
    {
        _backgroundScale9Grid = backgroundScale9Grid;

    }

    /**
     * The repeat settings for the background image
     * @return String
     */
    public function get backgroundRepeat():String
    {
        return _backgroundRepeat;
    }

    /**
     * @private
     */
    public function set backgroundRepeat(backgroundRepeat:String):void
    {
        _backgroundRepeat = backgroundRepeat;

    }

    /**
     * The background fill alpha
     * @return Number
     */
    public function get backgroundColorAlpha():Number
    {
        return _backgroundColorAlpha;
    }

    /**
     * @private
     */
    public function set backgroundColorAlpha(backgroundColorAlpha:Number):void
    {
        _backgroundColorAlpha = backgroundColorAlpha;

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
        return _marginTop;
    }

    /**
     * @private
     */
    public function set marginTop(marginTop:Number):void
    {
        _marginTop = marginTop;

    }

    /**
     * The Box Model margin right value
     * @return Number
     */
    public function get marginRight():Number
    {
        return _marginRight;
    }

    /**
     * @private
     */
    public function set marginRight(marginRight:Number):void
    {
        _marginRight = marginRight;

    }

    /**
     * The Box Model margin bottom value
     * @return Number
     */
    public function get marginBottom():Number
    {
        return _marginBottom;
    }

    /**
     * @private
     */
    public function set marginBottom(marginBottom:Number):void
    {
        _marginBottom = marginBottom;

    }

    /**
     * The Box Model margin left value
     * @return Number
     */
    public function get marginLeft():Number
    {
        return _marginLeft;
    }

    /**
     * @private
     */
    public function set marginLeft(marginLeft:Number):void
    {
        _marginLeft = marginLeft;

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
        return _backgroundPositionX;
    }

    /**
     * @private
     */
    public function set backgroundPositionX(backgroundPositionX:Number):void
    {
        _backgroundPositionX = backgroundPositionX;

    }

    /**
     * The Box Model background y position
     * @return Number
     */
    public function get backgroundPositionY():Number
    {
        return _backgroundPositionY;
    }

    /**
     * @private
     */
    public function set backgroundPositionY(backgroundPositionY:Number):void
    {
        _backgroundPositionY = backgroundPositionY;

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
        return _backgroundImageBitmap;
    }

    /**
     * @private
     */
    public function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void
    {
        _backgroundImageBitmap = backgroundImageBitmap;

    }

    /**
     * The Box Model background image alpha
     * @return uint
     */
    public function get backgroundImageAlpha():Number
    {
        return _backgroundImageAlpha;
    }

    /**
     * @private
     */
    public function set backgroundImageAlpha(backgroundImageAlpha:Number):void
    {
        _backgroundImageAlpha = backgroundImageAlpha;

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
        _backgroundImageBitmap = null;
        _backgroundColor = NaN;
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


    /**
     * <p>Takes a string of numbers and returns a 4 position array that can
     * be used for padding or margin offsets. Offsets arrays contain 4 slots
     * Top, Right, Bottom, Left. Accepts 3 variations:</p>
     *
     * <p>1) Single number, pads all 4 slots with the value</p>
     *
     * <p>2) Two numbers, pads the top and bottom with the first value, and
     * the left and right with the second number</p>
     *
     * <p>3) 4 number, is a 1 to 1 translations and maps all values to
     * respective slots.</p>
     *
     * @return Array
     */
    protected function validateOffset(values:Array):Array
    {

        var total:Number = values.length;
        var offset:Array;

        if (total == 1)
        {
            var baseValue:Number = values[0];
            offset = [ baseValue, baseValue, baseValue, baseValue ];
        }
        else if (total == 2)
        {
            var tbValue:Number = values[0];
            var lrValue:Number = values[1];

            offset = [ tbValue, lrValue, tbValue, lrValue ];
        }
        else
        {
            for (var i:Number = 0; i < 4; i++)
            {
                if (!values[i]) values[i] = 0;
            }

            offset = [ values[0], values[1], values[2], values[3] ];
        }

        return offset;
    }
    
    //

    public function get width():Number
    {
        var tempWidth:Number = display.width > _width ? display.width : _width;
        return borderLeft + paddingLeft + tempWidth + paddingRight + borderRight;
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
        var tempHeight:Number = display.height > _height ? display.height : _height;
        return borderTop + paddingTop + tempHeight + paddingBottom + borderBottom;
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

    /**
     * Calculates the size of the border rectangle
     */
    public function calculateBorder():void
    {
        borderDecorator.width = paddingDecorator.width + borderLeft + borderRight;

        borderDecorator.height = paddingDecorator.height + borderTop + borderBottom;
    }

    /**
     * Take content width and height + padding to calculate padding size
     */
    public function calculatePadding():void
    {
        paddingDecorator.paddingOffsetX = borderLeft;
        paddingDecorator.paddingOffsetY = borderTop;
    }

}
}