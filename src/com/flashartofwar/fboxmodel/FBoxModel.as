package com.flashartofwar.fboxmodel {
import com.flashartofwar.fboxmodel.display.AncestorSprite;
import com.flashartofwar.fboxmodel.renderer.BoxModelRenderer;
import com.flashartofwar.fboxmodel.renderer.IBoxModelRenderer;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.geom.Rectangle;

public class FBoxModel extends AncestorSprite implements IBoxModel,IBoxModelRenderer {

    public static const DRAW:String = "draw";

    protected var _invalid:Boolean;
    protected var renderer:BoxModelRenderer;

    public function FBoxModel() {
        super(this);
        renderer = new BoxModelRenderer(this);
        //TODO this can removed once BoxModelRenderer is setup
        addStageListeners();
    }


    /**
     * The fill color of the background
     * @return uint
     */
    public function get backgroundColor():uint
    {
        return renderer.backgroundColor;
    }

    /**
     * @private
     */
    public function set backgroundColor(value:uint):void
    {
        renderer.backgroundColor = value;
        invalidate();
    }

    /**
     * The fill color of the border
     * @return uint
     */
    public function get borderColor():uint
    {
        return renderer.borderColor;
    }

    /**
     * @private
     */
    public function set borderColor(value:uint):void
    {
        renderer.borderColor = value;
        invalidate();
    }

    /**
     * @private
     */
    public function set backgroundPosition(value:String):void
    {
        renderer.backgroundPosition = value;

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
        renderer.padding = values;
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
        renderer.margin = values;

        invalidate();
    }

    /**
     * The full Box Model width including padding and border
     * @return Number
     */
    override public function get width():Number
    {
        return renderer.width;
    }

    /**
     * The full Box Model height including padding and border
     * @return Number
     */
    override public function get height():Number
    {
        return renderer.height;
    }

    /**
     * @private
     */
    public function set border(value:String):void
    {
        renderer.border = value;

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
        return renderer.backgroundScale9Grid;
    }

    /**
     * @private
     */
    public function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void
    {
        renderer.backgroundScale9Grid = backgroundScale9Grid;
        invalidate();
    }

    /**
     * The repeat settings for the background image
     * @return String
     */
    public function get backgroundRepeat():String
    {
        return renderer.backgroundRepeat;
    }

    /**
     * @private
     */
    public function set backgroundRepeat(backgroundRepeat:String):void
    {
        renderer.backgroundRepeat = backgroundRepeat;
        invalidate();
    }

    /**
     * The background fill alpha
     * @return Number
     */
    public function get backgroundColorAlpha():Number
    {
        return renderer.backgroundColorAlpha;
    }

    /**
     * @private
     */
    public function set backgroundColorAlpha(backgroundColorAlpha:Number):void
    {
        renderer.backgroundColorAlpha = backgroundColorAlpha;
        invalidate();
    }

    /**
     * The Box Model padding top value
     * @return Number
     */
    public function get paddingTop():Number
    {
        return renderer.paddingTop;
    }

    /**
     * @private
     */
    public function set paddingTop(paddingTop:Number):void
    {
        renderer.paddingTop = paddingTop;
        invalidate();
    }

    /**
     * The Box Model padding right value
     * @return Number
     */
    public function get paddingRight():Number
    {
        return renderer.paddingRight;
    }

    /**
     * @private
     */
    public function set paddingRight(paddingRight:Number):void
    {
        renderer.paddingRight = paddingRight;
        invalidate();
    }

    /**
     * The Box Model padding bottom value
     * @return Number
     */
    public function get paddingBottom():Number
    {
        return renderer.paddingBottom;
    }

    /**
     * @private
     */
    public function set paddingBottom(paddingBottom:Number):void
    {
        renderer.paddingBottom = paddingBottom;
        invalidate();
    }

    /**
     * The Box Model padding left value
     * @return Number
     */
    public function get paddingLeft():Number
    {
        return renderer.paddingLeft;
    }

    /**
     * @private
     */
    public function set paddingLeft(paddingLeft:Number):void
    {
        renderer.paddingLeft = paddingLeft;
        invalidate();
    }

    /**
     * The Box Model margin top value
     * @return Number
     */
    public function get marginTop():Number
    {
        return renderer.marginTop;
    }

    /**
     * @private
     */
    public function set marginTop(marginTop:Number):void
    {
        renderer.marginTop = marginTop;
        invalidate();
    }

    /**
     * The Box Model margin right value
     * @return Number
     */
    public function get marginRight():Number
    {
        return renderer.marginRight;
    }

    /**
     * @private
     */
    public function set marginRight(marginRight:Number):void
    {
        renderer.marginRight = marginRight;
        invalidate();
    }

    /**
     * The Box Model margin bottom value
     * @return Number
     */
    public function get marginBottom():Number
    {
        return renderer.marginBottom;
    }

    /**
     * @private
     */
    public function set marginBottom(marginBottom:Number):void
    {
        renderer.marginBottom = marginBottom;
        invalidate();
    }

    /**
     * The Box Model margin left value
     * @return Number
     */
    public function get marginLeft():Number
    {
        return renderer.marginLeft;
    }

    /**
     * @private
     */
    public function set marginLeft(marginLeft:Number):void
    {
        renderer.marginLeft = marginLeft;
        invalidate();
    }

    /**
     * The Box Model border top value
     * @return Number
     */
    public function get borderTop():Number
    {
        return renderer.borderTop;
    }

    /**
     * @private
     */
    public function set borderTop(borderTop:Number):void
    {
        renderer.borderTop = borderTop;
        invalidate();
    }

    /**
     * The Box Model border right value
     * @return Number
     */
    public function get borderRight():Number
    {
        return renderer.borderRight;
    }

    /**
     * @private
     */
    public function set borderRight(borderRight:Number):void
    {
        renderer.borderRight = borderRight;
        invalidate();
    }

    /**
     * The Box Model border bottom value
     * @return Number
     */
    public function get borderBottom():Number
    {
        return renderer.borderBottom;
    }

    /**
     * @private
     */
    public function set borderBottom(borderBottom:Number):void
    {
        renderer.borderBottom = borderBottom;
        invalidate();
    }

    /**
     * The Box Model border left value
     * @return Number
     */
    public function get borderLeft():Number
    {
        return renderer.borderLeft;
    }

    /**
     * @private
     */
    public function set borderLeft(borderLeft:Number):void
    {
        renderer.borderLeft = borderLeft;
        invalidate();
    }

    /**
     * The Box Model border alpha value
     * @return Number
     */
    public function get borderAlpha():Number
    {
        return renderer.borderAlpha;
    }

    /**
     * @private
     */
    public function set borderAlpha(borderAlpha:Number):void
    {
        renderer.borderAlpha = borderAlpha;
        invalidate();
    }

    /**
     * The Box Model background x position
     * @return Number
     */
    public function get backgroundPositionX():Number
    {
        return renderer.backgroundPositionX;
    }

    /**
     * @private
     */
    public function set backgroundPositionX(backgroundPositionX:Number):void
    {
        renderer.backgroundPositionX = backgroundPositionX;
        invalidate();
    }

    /**
     * The Box Model background y position
     * @return Number
     */
    public function get backgroundPositionY():Number
    {
        return renderer.backgroundPositionY;
    }

    /**
     * @private
     */
    public function set backgroundPositionY(backgroundPositionY:Number):void
    {
        renderer.backgroundPositionY = backgroundPositionY;
        invalidate();
    }

    /**
     * Whether or not to show the Box Model debug padding
     * @return Boolean
     */
    public function get debugPadding():Boolean
    {
        return renderer.debugPadding;
    }

    /**
     * @private
     */
    public function set debugPadding(debugPadding:Boolean):void
    {
        renderer.debugPadding = debugPadding;
        invalidate();
    }

    /**
     * The Box Model debug padding color
     * @return uint
     */
    public function get debugPaddingColor():uint
    {
        return renderer.debugPaddingColor;
    }

    /**
     * @private
     */
    public function set debugPaddingColor(debugPaddingColor:uint):void
    {
        renderer.debugPaddingColor = debugPaddingColor;
        invalidate();
    }

    /**
     * The Box Model background image
     * @return Bitmap
     */
    public function get backgroundImageBitmap():Bitmap
    {
        return renderer.backgroundImageBitmap;
    }

    /**
     * @private
     */
    public function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void
    {
        renderer.backgroundImageBitmap = backgroundImageBitmap;
        invalidate();
    }

    /**
     * The Box Model background image alpha
     * @return uint
     */
    public function get backgroundImageAlpha():Number
    {
        return renderer.backgroundImageAlpha;
    }

    /**
     * @private
     */
    public function set backgroundImageAlpha(backgroundImageAlpha:Number):void
    {
        renderer.backgroundImageAlpha = backgroundImageAlpha;
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

    public function clearProperties():void {
        renderer.clearProperties();
        invalidate();
    }

    public function clearPadding():void {
        renderer.clearPadding();
        invalidate();
    }

    public function clearMargin():void {
        renderer.clearMargin();
        invalidate();
    }

    public function clearBorder():void {
        renderer.clearBorder();
        invalidate();
    }

    public function clearBackground():void {
        renderer.clearBackground();
        invalidate();
    }

    override public function set width(value:Number):void
    {
        renderer.width = value;
        invalidate();
    }

    override public function set height(value:Number):void
    {
        renderer.height = value;
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

        //TODO This is removed because it is expensive
        //invalidationHash = new Dictionary();

        renderer.drawBoxModel();
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

    public function get display():DisplayObjectContainer {
        return _display;
    }

    public function set display(value:DisplayObjectContainer):void {
        _display = value;
    }

}
}