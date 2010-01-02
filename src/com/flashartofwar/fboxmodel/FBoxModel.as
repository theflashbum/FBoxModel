package com.flashartofwar.fboxmodel {
import com.flashartofwar.fboxmodel.boxmodel.BoxModel;
import com.flashartofwar.fboxmodel.boxmodel.IBoxModel;
import com.flashartofwar.fboxmodel.boxmodel.IBoxModelRenderable;
import com.flashartofwar.fboxmodel.display.BoxModelDisplay;
import com.flashartofwar.fboxmodel.enum.BgRepeatProps;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Rectangle;

public class FBoxModel extends BoxModelDisplay implements IBoxModel {

    public static const SAMPLE_BG:String = "sampleBackground";

    protected var boxModel:IBoxModelRenderable;

    public function FBoxModel() {
        super();
        boxModel = new BoxModel(display);
        //TODO this can removed once BoxModelRenderer is setup
        addStageListeners();
    }

    /**
     * The fill color of the background
     * @return uint
     */
    public function get backgroundColor():uint
    {
        return boxModel.backgroundColor;
    }

    /**
     * @private
     */
    public function set backgroundColor(value:uint):void
    {
        boxModel.backgroundColor = value;
        invalidate();
    }

    /**
     * The fill color of the border
     * @return uint
     */
    public function get borderColor():uint
    {
        return boxModel.borderColor;
    }

    /**
     * @private
     */
    public function set borderColor(value:uint):void
    {
        boxModel.borderColor = value;
        invalidate();
    }

    /**
     * @private
     */
    public function set backgroundPosition(value:String):void
    {
        boxModel.backgroundPosition = value;

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
        boxModel.padding = values;
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
        boxModel.margin = values;

        invalidate();
    }

    /**
     * The full Box Model width including padding and border
     * @return Number
     */
    override public function get width():Number
    {
        return boxModel.width;
    }

    /**
     * The full Box Model height including padding and border
     * @return Number
     */
    override public function get height():Number
    {
        return boxModel.height;
    }

    /**
     * @private
     */
    public function set border(value:String):void
    {
        boxModel.border = value;

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
        return boxModel.backgroundScale9Grid;
    }

    /**
     * @private
     */
    public function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void
    {
        boxModel.backgroundScale9Grid = backgroundScale9Grid;
        invalidate();
    }

    /**
     * The repeat settings for the background image
     * @return String
     */
    public function get backgroundRepeat():String
    {
        return boxModel.backgroundRepeat;
    }

    /**
     * @private
     */
    public function set backgroundRepeat(backgroundRepeat:String):void
    {
        boxModel.backgroundRepeat = backgroundRepeat;
        invalidate();
    }

    /**
     * The background fill alpha
     * @return Number
     */
    public function get backgroundColorAlpha():Number
    {
        return boxModel.backgroundColorAlpha;
    }

    /**
     * @private
     */
    public function set backgroundColorAlpha(backgroundColorAlpha:Number):void
    {
        boxModel.backgroundColorAlpha = backgroundColorAlpha;
        invalidate();
    }

    /**
     * The Box Model padding top value
     * @return Number
     */
    public function get paddingTop():Number
    {
        return boxModel.paddingTop;
    }

    /**
     * @private
     */
    public function set paddingTop(paddingTop:Number):void
    {
        boxModel.paddingTop = paddingTop;
        invalidate();
    }

    /**
     * The Box Model padding right value
     * @return Number
     */
    public function get paddingRight():Number
    {
        return boxModel.paddingRight;
    }

    /**
     * @private
     */
    public function set paddingRight(paddingRight:Number):void
    {
        boxModel.paddingRight = paddingRight;
        invalidate();
    }

    /**
     * The Box Model padding bottom value
     * @return Number
     */
    public function get paddingBottom():Number
    {
        return boxModel.paddingBottom;
    }

    /**
     * @private
     */
    public function set paddingBottom(paddingBottom:Number):void
    {
        boxModel.paddingBottom = paddingBottom;
        invalidate();
    }

    /**
     * The Box Model padding left value
     * @return Number
     */
    public function get paddingLeft():Number
    {
        return boxModel.paddingLeft;
    }

    /**
     * @private
     */
    public function set paddingLeft(paddingLeft:Number):void
    {
        boxModel.paddingLeft = paddingLeft;
        invalidate();
    }

    /**
     * The Box Model margin top value
     * @return Number
     */
    public function get marginTop():Number
    {
        return boxModel.marginTop;
    }

    /**
     * @private
     */
    public function set marginTop(marginTop:Number):void
    {
        boxModel.marginTop = marginTop;
        invalidate();
    }

    /**
     * The Box Model margin right value
     * @return Number
     */
    public function get marginRight():Number
    {
        return boxModel.marginRight;
    }

    /**
     * @private
     */
    public function set marginRight(marginRight:Number):void
    {
        boxModel.marginRight = marginRight;
        invalidate();
    }

    /**
     * The Box Model margin bottom value
     * @return Number
     */
    public function get marginBottom():Number
    {
        return boxModel.marginBottom;
    }

    /**
     * @private
     */
    public function set marginBottom(marginBottom:Number):void
    {
        boxModel.marginBottom = marginBottom;
        invalidate();
    }

    /**
     * The Box Model margin left value
     * @return Number
     */
    public function get marginLeft():Number
    {
        return boxModel.marginLeft;
    }

    /**
     * @private
     */
    public function set marginLeft(marginLeft:Number):void
    {
        boxModel.marginLeft = marginLeft;
        invalidate();
    }

    /**
     * The Box Model border top value
     * @return Number
     */
    public function get borderTop():Number
    {
        return boxModel.borderTop;
    }

    /**
     * @private
     */
    public function set borderTop(borderTop:Number):void
    {
        boxModel.borderTop = borderTop;
        invalidate();
    }

    /**
     * The Box Model border right value
     * @return Number
     */
    public function get borderRight():Number
    {
        return boxModel.borderRight;
    }

    /**
     * @private
     */
    public function set borderRight(borderRight:Number):void
    {
        boxModel.borderRight = borderRight;
        invalidate();
    }

    /**
     * The Box Model border bottom value
     * @return Number
     */
    public function get borderBottom():Number
    {
        return boxModel.borderBottom;
    }

    /**
     * @private
     */
    public function set borderBottom(borderBottom:Number):void
    {
        boxModel.borderBottom = borderBottom;
        invalidate();
    }

    /**
     * The Box Model border left value
     * @return Number
     */
    public function get borderLeft():Number
    {
        return boxModel.borderLeft;
    }

    /**
     * @private
     */
    public function set borderLeft(borderLeft:Number):void
    {
        boxModel.borderLeft = borderLeft;
        invalidate();
    }

    /**
     * The Box Model border properties
     * @return String
     */
    public function get borderProperties():String
    {
        return boxModel.borderProperties;
    }

    /**
     * @private
     */
    public function set borderProperties(borderProperties:String):void
    {
        boxModel.borderProperties = borderProperties;
        invalidate();
    }

    /**
     * The Box Model border alpha value
     * @return Number
     */
    public function get borderAlpha():Number
    {
        return boxModel.borderAlpha;
    }

    /**
     * @private
     */
    public function set borderAlpha(borderAlpha:Number):void
    {
        boxModel.borderAlpha = borderAlpha;
        invalidate();
    }

    /**
     * The Box Model background x position
     * @return Number
     */
    public function get backgroundPositionX():Number
    {
        return boxModel.backgroundPositionX;
    }

    /**
     * @private
     */
    public function set backgroundPositionX(backgroundPositionX:Number):void
    {
        boxModel.backgroundPositionX = backgroundPositionX;
        invalidate();
    }

    /**
     * The Box Model background y position
     * @return Number
     */
    public function get backgroundPositionY():Number
    {
        return boxModel.backgroundPositionY;
    }

    /**
     * @private
     */
    public function set backgroundPositionY(backgroundPositionY:Number):void
    {
        boxModel.backgroundPositionY = backgroundPositionY;
        invalidate();
    }

    /**
     * Whether or not to show the Box Model debug padding
     * @return Boolean
     */
    public function get debugPadding():Boolean
    {
        return boxModel.debugPadding;
    }

    /**
     * @private
     */
    public function set debugPadding(debugPadding:Boolean):void
    {
        boxModel.debugPadding = debugPadding;
        invalidate();
    }

    /**
     * The Box Model debug padding color
     * @return uint
     */
    public function get debugPaddingColor():uint
    {
        return boxModel.debugPaddingColor;
    }

    /**
     * @private
     */
    public function set debugPaddingColor(debugPaddingColor:uint):void
    {
        boxModel.debugPaddingColor = debugPaddingColor;
        invalidate();
    }

    /**
     * The Box Model background image
     * @return Bitmap
     */
    public function get backgroundImageBitmap():Bitmap
    {
        return boxModel.backgroundImageBitmap;
    }

    /**
     * @private
     */
    public function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void
    {
        boxModel.backgroundImageBitmap = backgroundImageBitmap;
        invalidate();
    }

    /**
     * The Box Model background image alpha
     * @return uint
     */
    public function get backgroundImageAlpha():Number
    {
        return boxModel.backgroundImageAlpha;
    }

    /**
     * @private
     */
    public function set backgroundImageAlpha(backgroundImageAlpha:Number):void
    {
        boxModel.backgroundImageAlpha = backgroundImageAlpha;
        invalidate();
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
     * Sets the backgroundPositionX and backgroundPositionY to 0
     */
    protected function resetBackgroundPosition():void
    {
        backgroundPositionX = backgroundPositionY = 0;
        invalidate();
    }

    public function clearProperties():void {
        boxModel.clearProperties();
        invalidate();
    }

    public function clearPadding():void {
        boxModel.clearPadding();
        invalidate();
    }

    public function clearMargin():void {
        boxModel.clearMargin();
        invalidate();
    }

    public function clearBorder():void {
        boxModel.clearBorder();
        invalidate();
    }

    public function clearBackground():void {
        boxModel.clearBackground();
        invalidate();
    }

    override public function set width(value:Number):void
    {
        boxModel.width = value;
        invalidate();
    }

    override public function set height(value:Number):void
    {
        boxModel.height = value;
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
        dispatchEvent(new Event(BoxModelDisplay.DRAW));

        //TODO This is removed because it is expensive
        //invalidationHash = new Dictionary();

        drawBoxModel();
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

    /**
     *
     * @param tempBitmap
     *
     */

    protected function sampleBackground(bitmap:Bitmap):void
    {
        boxModel.backgroundImageBitmap = new Bitmap(bitmap.bitmapData.clone());

        if (backgroundScale9Grid)
        {
            boxModel.backgroundImageBitmap.scale9Grid = backgroundScale9Grid;
        }

        dispatchEvent(new Event(SAMPLE_BG));
        invalidate();
    }

    /**
     *
     *
     */
    protected function drawBoxModel():void
    {

        boxModel.calculatePadding();

        boxModel.calculateBorder();

        // Start drawing
        graphics.clear();

        // Create Border
        if (hasBorder) drawBorder();
        if (!isNaN(boxModel.backgroundColor)) drawBackgroundColor();

        drawBackgroundImage();

        graphics.endFill();

        alignDisplay();

    }

    /**
     *
     */
    protected function drawBorder():void
    {
        graphics.beginFill(boxModel.borderColor, borderAlpha);
        graphics.drawRect(boxModel.borderRectX, boxModel.borderRectY, boxModel.borderRectWidth, boxModel.borderRectHeight);
        graphics.drawRect(borderLeft, borderTop, boxModel.paddingRectWidth, boxModel.paddingRectHeight);
        //trace( borderLeft, borderTop, _paddingRectangle.width, _paddingRectangle.height );
    }

    /**
     *
     */
    protected function drawBackgroundImage():void
    {
        //
        if (boxModel.backgroundImageBitmap)
        {
            var bgiFullW:Number = paddingLeft + boxModel.displayWidth + paddingRight;
            var bgiFullH:Number = paddingTop + boxModel.displayHeight + paddingBottom;

            var bgiW:Number = boxModel.backgroundImageBitmap.width;
            var bgiH:Number = boxModel.backgroundImageBitmap.height;

            var bgX:Number = boxModel.paddingRectX;
            var bgY:Number = boxModel.paddingRectY;

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

            bmd.draw(boxModel.backgroundImageBitmap, null, new ColorTransform(1, 1, 1, backgroundImageAlpha));

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
        var tempColor:uint = boxModel.debugPadding ? boxModel.debugPaddingColor : boxModel.backgroundColor;

        backgroundColorAlpha = isNaN(backgroundColorAlpha) ? 1 : backgroundColorAlpha;

        graphics.beginFill(tempColor, backgroundColorAlpha);
        graphics.drawRect(boxModel.paddingRectX, boxModel.paddingRectY, boxModel.paddingRectWidth, boxModel.paddingRectHeight);
        graphics.endFill();

        if (boxModel.debugPadding)
        {
            graphics.beginFill(boxModel.backgroundColor, backgroundColorAlpha);
            graphics.drawRect(paddingLeft + borderLeft, paddingTop + borderTop, boxModel.displayWidth, boxModel.displayHeight);
            graphics.endFill();
        }
    }
}
}