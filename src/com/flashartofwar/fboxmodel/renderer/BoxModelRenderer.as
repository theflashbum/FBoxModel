package com.flashartofwar.fboxmodel.renderer {
import com.flashartofwar.fboxmodel.boxmodel.IBoxModelRenderable;
import com.flashartofwar.fboxmodel.enum.BgRepeatProps;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.events.Event;
import flash.geom.ColorTransform;
import flash.geom.Matrix;

public class BoxModelRenderer {

    public static const SAMPLE_BG:String = "sampleBackground";

    protected var target:IBoxModelRenderer;
    protected var boxModel:IBoxModelRenderable;
    private var graphics:Graphics;
    private var display:DisplayObjectContainer;

    public function BoxModelRenderer(target:IBoxModelRenderer) {
        this.target = target;
        boxModel = target.boxModel;
        graphics = target.graphics;
        display = target.display;
    }

    /**
     *
     * @param tempBitmap
     *
     */

    protected function sampleBackground(bitmap:Bitmap):void
    {
        boxModel.backgroundImageBitmap = new Bitmap(bitmap.bitmapData.clone());

        if (boxModel.backgroundScale9Grid)
        {
            boxModel.backgroundImageBitmap.scale9Grid = boxModel.backgroundScale9Grid;
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

        boxModel.calculatePadding();

        boxModel.calculateBorder();

        // Start drawing
        graphics.clear();

        // Create Border
        if (boxModel.hasBorder) drawBorder();
        if (!isNaN(boxModel.backgroundColor)) drawBackgroundColor();

        drawBackgroundImage();

        graphics.endFill();

        alignDisplay();

    }

    /**
     * Aligns the display with the appripriate padding, border
     */
    protected function alignDisplay():void
    {
        display.x = boxModel.paddingLeft + boxModel.borderLeft;
        display.y = boxModel.paddingTop + boxModel.borderTop;
    }

    /**
     *
     */
    protected function drawBorder():void
    {
        graphics.beginFill(boxModel.borderColor, boxModel.borderAlpha);
        graphics.drawRect(boxModel.borderRectX, boxModel.borderRectY, boxModel.borderRectWidth, boxModel.borderRectHeight);
        graphics.drawRect(boxModel.borderLeft, boxModel.borderTop, boxModel.paddingRectWidth, boxModel.paddingRectHeight);
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
            var bgiFullW:Number = boxModel.paddingLeft + boxModel.displayWidth + boxModel.paddingRight;
            var bgiFullH:Number = boxModel.paddingTop + boxModel.displayHeight + boxModel.paddingBottom;

            var bgiW:Number = boxModel.backgroundImageBitmap.width;
            var bgiH:Number = boxModel.backgroundImageBitmap.height;

            var bgX:Number = boxModel.paddingRectX;
            var bgY:Number = boxModel.paddingRectY;

            var m:Matrix = new Matrix();

            var bmd:BitmapData = new BitmapData(bgiW, bgiH, true, 0x00FFFFFF);

            switch (boxModel.backgroundRepeat)
            {
                case BgRepeatProps.NO_REPEAT:
                    bgX = boxModel.backgroundPositionX + boxModel.borderLeft;
                    bgY = boxModel.backgroundPositionY + boxModel.borderTop;
                    m.translate(bgX, bgY);
                    break;
                case BgRepeatProps.REPEAT_X:
                    bgiW = bgiFullW;
                    m.translate(boxModel.borderLeft, boxModel.borderTop);
                    break;
                case BgRepeatProps.REPEAT_Y:
                    bgiH = bgiFullH;
                    m.translate(boxModel.borderLeft, boxModel.borderTop);
                    break;
                default:
                    bgiW = bgiFullW;
                    bgiH = bgiFullH;
                    m.translate(boxModel.borderLeft, boxModel.borderTop);
                    break;
            }

            bmd.draw(boxModel.backgroundImageBitmap, null, new ColorTransform(1, 1, 1, boxModel.backgroundImageAlpha));

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

        boxModel.backgroundColorAlpha = isNaN(boxModel.backgroundColorAlpha) ? 1 : boxModel.backgroundColorAlpha;

        graphics.beginFill(tempColor, boxModel.backgroundColorAlpha);
        graphics.drawRect(boxModel.paddingRectX, boxModel.paddingRectY, boxModel.paddingRectWidth, boxModel.paddingRectHeight);
        graphics.endFill();

        if (boxModel.debugPadding)
        {
            graphics.beginFill(boxModel.backgroundColor, boxModel.backgroundColorAlpha);
            graphics.drawRect(boxModel.paddingLeft + boxModel.borderLeft, boxModel.paddingTop + boxModel.borderTop, boxModel.displayWidth, boxModel.displayHeight);
            graphics.endFill();
        }
    }

    private function onRender(event:Event):void {
        drawBoxModel();
    }
}
}