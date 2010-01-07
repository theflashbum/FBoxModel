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
    protected var scaleBitmap:ScaleBitmap;

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

        // Start drawing
        graphics.clear();

        // Create Border
        if (boxModel.hasBorder) drawBorder();
        //if (!isNaN(boxModel.backgroundColor)) drawBackgroundColor();
        if (boxModel.hasBackgroundColor) drawBackgroundColor();

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

            if (boxModel.backgroundScale9Grid)
            {
                boxModel.backgroundImageBitmap = new ScaleBitmap(boxModel.backgroundImageBitmap.bitmapData.clone());
                boxModel.backgroundImageBitmap.scale9Grid = boxModel.backgroundScale9Grid;
                (boxModel.backgroundImageBitmap as ScaleBitmap).setSize(bgiFullW, bgiFullH);
            }

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

/**
 *
 *      ScaleBitmap
 *
 *      @version        1.1
 *      @author         Didier BRUN     -  http://www.bytearray.org
 *
 *      @version        1.2.1
 *      @author         Alexandre LEGOUT - http://blog.lalex.com
 *
 *      @version        1.2.2
 *      @author         Pleh
 *
 *      Project page : http://www.bytearray.org/?p=118
 *
 */

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.geom.Rectangle;

internal class ScaleBitmap extends Bitmap {

    // ------------------------------------------------
    //
    // ---o properties
    //
    // ------------------------------------------------

    protected var _originalBitmap:BitmapData;
    protected var _scale9Grid:Rectangle = null;

    // ------------------------------------------------
    //
    // ---o constructor
    //
    // ------------------------------------------------


    function ScaleBitmap(bmpData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false) {

        // super constructor
        super(bmpData, pixelSnapping, smoothing);

        // original bitmap
        _originalBitmap = bmpData.clone();
    }

    // ------------------------------------------------
    //
    // ---o public methods
    //
    // ------------------------------------------------

    /**
     * setter bitmapData
     */
    override public function set bitmapData(bmpData:BitmapData):void {
        _originalBitmap = bmpData.clone();
        if (_scale9Grid != null) {
            if (!validGrid(_scale9Grid)) {
                _scale9Grid = null;
            }
            setSize(bmpData.width, bmpData.height);
        } else {
            assignBitmapData(_originalBitmap.clone());
        }
    }

    /**
     * setter width
     */
    override public function set width(w:Number):void {
        if (w != width) {
            setSize(w, height);
        }
    }

    /**
     * setter height
     */
    override public function set height(h:Number):void {
        if (h != height) {
            setSize(width, h);
        }
    }

    /**
     * set scale9Grid
     */
    override public function set scale9Grid(r:Rectangle):void {
        // Check if the given grid is different from the current one
        if ((_scale9Grid == null && r != null) || (_scale9Grid != null && !_scale9Grid.equals(r))) {
            if (r == null) {
                // If deleting scalee9Grid, restore the original bitmap
                // then resize it (streched) to the previously set dimensions
                var currentWidth:Number = width;
                var currentHeight:Number = height;
                _scale9Grid = null;
                assignBitmapData(_originalBitmap.clone());
                setSize(currentWidth, currentHeight);
            } else {
                if (!validGrid(r)) {
                    throw (new Error("#001 - The _scale9Grid does not match the original BitmapData"));
                    return;
                }

                _scale9Grid = r.clone();
                resizeBitmap(width, height);
                scaleX = 1;
                scaleY = 1;
            }
        }
    }

    /**
     * assignBitmapData
     * Update the effective bitmapData
     */
    private function assignBitmapData(bmp:BitmapData):void {
        super.bitmapData.dispose();
        super.bitmapData = bmp;
    }

    private function validGrid(r:Rectangle):Boolean {
        return r.right <= _originalBitmap.width && r.bottom <= _originalBitmap.height;
    }

    /**
     * get scale9Grid
     */
    override public function get scale9Grid():Rectangle {
        return _scale9Grid;
    }


    /**
     * setSize
     */
    public function setSize(w:Number, h:Number):void {
        if (_scale9Grid == null) {
            super.width = w;
            super.height = h;
        } else {
            w = Math.max(w, _originalBitmap.width - _scale9Grid.width);
            h = Math.max(h, _originalBitmap.height - _scale9Grid.height);
            resizeBitmap(w, h);
        }
    }

    /**
     * get original bitmap
     */
    public function getOriginalBitmapData():BitmapData {
        return _originalBitmap;
    }

    // ------------------------------------------------
    //
    // ---o protected methods
    //
    // ------------------------------------------------

    /**
     * resize bitmap
     */
    protected function resizeBitmap(w:Number, h:Number):void {

        var bmpData:BitmapData = new BitmapData(w, h, true, 0x00000000);

        var rows:Array = [0, _scale9Grid.top, _scale9Grid.bottom, _originalBitmap.height];
        var cols:Array = [0, _scale9Grid.left, _scale9Grid.right, _originalBitmap.width];

        var dRows:Array = [0, _scale9Grid.top, h - (_originalBitmap.height - _scale9Grid.bottom), h];
        var dCols:Array = [0, _scale9Grid.left, w - (_originalBitmap.width - _scale9Grid.right), w];

        var origin:Rectangle;
        var draw:Rectangle;
        var mat:Matrix = new Matrix();


        for (var cx:int = 0; cx < 3; cx++) {
            for (var cy:int = 0; cy < 3; cy++) {
                origin = new Rectangle(cols[cx], rows[cy], cols[cx + 1] - cols[cx], rows[cy + 1] - rows[cy]);
                draw = new Rectangle(dCols[cx], dRows[cy], dCols[cx + 1] - dCols[cx], dRows[cy + 1] - dRows[cy]);
                mat.identity();
                mat.a = draw.width / origin.width;
                mat.d = draw.height / origin.height;
                mat.tx = draw.x - origin.x * mat.a;
                mat.ty = draw.y - origin.y * mat.d;
                bmpData.draw(_originalBitmap, mat, null, null, draw, smoothing);
            }
        }
        assignBitmapData(bmpData);
    }
}