package com.flashartofwar.fboxmodel.renderer {
import com.flashartofwar.fboxmodel.boxmodel.IBoxModelRenderable;
import com.flashartofwar.fboxmodel.decorators.BackgroundDecorator;

import flash.display.Bitmap;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.events.Event;

public class BoxModelRenderer {

    public static const SAMPLE_BG:String = "sampleBackground";

    protected var target:IBoxModelRenderer;
    protected var boxModel:IBoxModelRenderable;
    private var graphics:Graphics;
    private var display:DisplayObjectContainer;

    // Decorators
    private var bgDecorator:BackgroundDecorator;
    
    public function BoxModelRenderer(target:IBoxModelRenderer) {
        this.target = target;
        boxModel = target.boxModel;
        graphics = target.graphics;
        display = target.display;
        bgDecorator = new BackgroundDecorator(boxModel);

    }



    /**
     *
     * @param tempBitmap
     *
     */

    public function sampleBackground(bitmap:Bitmap):void
    {

        boxModel.backgroundImageBitmap = new Bitmap(bitmap.bitmapData.clone());

        target.display.dispatchEvent(new Event(SAMPLE_BG));

    }

    /**
     *
     *
     */
    public function drawBoxModel():void
    {

        boxModel.calculatePadding();

        boxModel.calculateBorder();

        bgDecorator.draw();

        drawBorder();

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





    private function onRender(event:Event):void {
        drawBoxModel();
    }
}
}