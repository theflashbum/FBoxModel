package com.flashartofwar.fboxmodel.boxmodel {

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.geom.Rectangle;

internal class BoxModelLayout extends BoxModelBackground implements IBoxModel
{
    protected var _paddingRectangle:Rectangle = new Rectangle();
    protected var _borderRectangle:Rectangle = new Rectangle();
    protected var _borderColor:Number;
    protected var _paddingTop:Number = 0;
    protected var _paddingRight:Number = 0;
    protected var _paddingBottom:Number = 0;
    protected var _paddingLeft:Number = 0;
    protected var _marginTop:Number = 0;
    protected var _marginRight:Number = 0;
    protected var _marginBottom:Number = 0;
    protected var _marginLeft:Number = 0;
    protected var _borderTop:Number = 0;
    protected var _borderRight:Number = 0;
    protected var _borderBottom:Number = 0;
    protected var _borderLeft:Number = 0;
    protected var _borderProperties:String;
    protected var _borderAlpha:Number = 1;
    protected var _display:DisplayObject;

    //--------------------------------------------------------------------------------
    //
    // Constructor
    //
    //--------------------------------------------------------------------------------

    /**
     *
     */
    public function BoxModelLayout(graphics:Graphics, display:DisplayObject)
    {
        super(graphics);
        _display = display;
    }

    //--------------------------------------------------------------------------------
    //
    // Public Getters and Setters
    //
    //--------------------------------------------------------------------------------

    /**
     * The fill color of the border
     * @return uint
     */
    public function get borderColor():uint
    {
        return _borderColor;
    }

    /**
     * @private
     */
    public function set borderColor(value:uint):void
    {
        _borderColor = value;

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
        var values:Array = value.split(delimiter, 4);

        borderTop = borderRight = borderBottom = borderLeft = values[0];
        borderProperties = values[1];
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
     * The Box Model padding top value
     * @return Number
     */
    public function get paddingTop():Number
    {
        return _paddingTop;
    }

    /**
     * @private
     */
    public function set paddingTop(paddingTop:Number):void
    {
        _paddingTop = paddingTop;

    }

    /**
     * The Box Model padding right value
     * @return Number
     */
    public function get paddingRight():Number
    {
        return _paddingRight;
    }

    /**
     * @private
     */
    public function set paddingRight(paddingRight:Number):void
    {
        _paddingRight = paddingRight;

    }

    /**
     * The Box Model padding bottom value
     * @return Number
     */
    public function get paddingBottom():Number
    {
        return _paddingBottom;
    }

    /**
     * @private
     */
    public function set paddingBottom(paddingBottom:Number):void
    {
        _paddingBottom = paddingBottom;

    }

    /**
     * The Box Model padding left value
     * @return Number
     */
    public function get paddingLeft():Number
    {
        return _paddingLeft;
    }

    /**
     * @private
     */
    public function set paddingLeft(paddingLeft:Number):void
    {
        _paddingLeft = paddingLeft;

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
        return _borderTop;
    }

    /**
     * @private
     */
    public function set borderTop(borderTop:Number):void
    {
        _borderTop = borderTop;

    }

    /**
     * The Box Model border right value
     * @return Number
     */
    public function get borderRight():Number
    {
        return _borderRight;
    }

    /**
     * @private
     */
    public function set borderRight(borderRight:Number):void
    {
        _borderRight = borderRight;

    }

    /**
     * The Box Model border bottom value
     * @return Number
     */
    public function get borderBottom():Number
    {
        return _borderBottom;
    }

    /**
     * @private
     */
    public function set borderBottom(borderBottom:Number):void
    {
        _borderBottom = borderBottom;

    }

    /**
     * The Box Model border left value
     * @return Number
     */
    public function get borderLeft():Number
    {
        return _borderLeft;
    }

    /**
     * @private
     */
    public function set borderLeft(borderLeft:Number):void
    {
        _borderLeft = borderLeft;

    }

    /**
     * The Box Model border properties
     * @return String
     */
    public function get borderProperties():String
    {
        return _borderProperties;
    }

    /**
     * @private
     */
    public function set borderProperties(borderProperties:String):void
    {
        _borderProperties = borderProperties;

    }

    /**
     * The Box Model border alpha value
     * @return Number
     */
    public function get borderAlpha():Number
    {
        return _borderAlpha;
    }

    /**
     * @private
     */
    public function set borderAlpha(borderAlpha:Number):void
    {
        _borderAlpha = borderAlpha;

    }

    //--------------------------------------------------------------------------------
    //
    // Public Methods
    //
    //--------------------------------------------------------------------------------

    /**
     * Clears all Box Model Properties
     */
    override public function clearProperties():void
    {
        clearPadding();
        clearMargin();
        clearBorder();
        super.clearProperties();
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
        _borderColor = NaN;
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

}
}