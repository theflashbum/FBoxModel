package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Graphics;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;

    public class BackgroundImageDecorator extends AbstractBackgroundDecorator implements IBackgroundDecorator, IBackgroundImageDecorator
    {

        public static const NO_REPEAT:String = "no-repeat";
        public static const REPEAT_X:String = "repeat-x";
        public static const REPEAT_Y:String = "repeat-y";
        public static const REPEAT:String = "repeat";

        protected var _imageBitmap:Bitmap;
        protected var _scale9Grid:Rectangle;
        protected var _repeat:String;
        protected var _positionY:Number = 0;
        protected var _positionX:Number = 0;
        protected var isScale9GridApplied:Boolean;

        public function BackgroundImageDecorator(graphics:Graphics)
        {
            super(graphics);
        }

        public function get imageBitmap():Bitmap
        {
            return _imageBitmap;
        }

        public function set imageBitmap(value:Bitmap):void
        {
            _imageBitmap = value;
        }

        public function get scale9Grid():Rectangle
        {
            return _scale9Grid;
        }

        public function set scale9Grid(value:Rectangle):void
        {
            _scale9Grid = value;
            isScale9GridApplied = false;
        }

        public function get repeat():String
        {
            return _repeat;
        }

        public function set repeat(value:String):void
        {
            _repeat = value;
        }

        public function get imagePositionY():Number
        {
            return _positionY;
        }

        public function set imagePositionY(value:Number):void
        {
            _positionY = value;
        }

        public function get imagePositionX():Number
        {
            return _positionX;
        }

        public function set imagePositionX(value:Number):void
        {
            _positionX = value;
        }

        /**
         *
         */
        protected function drawBackgroundImage():void
        {
            //
            if (imageBitmap)
            {
                var bgiFullW:Number = width;
                var bgiFullH:Number = height;

                var bgX:Number = offsetX;
                var bgY:Number = offsetY;

                if (scale9Grid && !isScale9GridApplied)
                {
                    imageBitmap = new ScaleBitmap(imageBitmap.bitmapData);
                    imageBitmap.scale9Grid = scale9Grid;                    

                    //TODO this needs to be fixed
                    isScale9GridApplied = true;
                }

                if(scale9Grid)
                    (imageBitmap as ScaleBitmap).setSize(bgiFullW, bgiFullH);

                var bgiW:Number = imageBitmap.width;
                var bgiH:Number = imageBitmap.height;

                var m:Matrix = new Matrix();

                var bmd:BitmapData = new BitmapData(bgiW, bgiH, true, 0x00FFFFFF);

                switch (repeat)
                {
                    case NO_REPEAT:
                        bgX = imagePositionX + offsetX;
                        bgY = imagePositionY + offsetY;
                        m.translate(bgX, bgY);
                        break;
                    case REPEAT_X:
                        bgiW = bgiFullW;
                        m.translate(bgX, bgY);
                        break;
                    case REPEAT_Y:
                        bgiH = bgiFullH;
                        m.translate(bgX, bgY);
                        break;

                    default:
                        bgiW = bgiFullW;
                        bgiH = bgiFullH;
                        m.translate(bgX, bgY);
                        break;
                }

                bmd.draw(imageBitmap, null, new ColorTransform(1, 1, 1, alpha));

                graphics.beginBitmapFill(bmd, m, true, false);
                graphics.drawRect(bgX, bgY, bgiW, bgiH);
                graphics.endFill();
            }

        }

        /**
         *
         *
         */
        override public function draw():void
        {
            drawBackgroundImage();
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

internal class ScaleBitmap extends Bitmap
{

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


    function ScaleBitmap(bmpData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
    {

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
    override public function set bitmapData(bmpData:BitmapData):void
    {
        _originalBitmap = bmpData.clone();
        if (_scale9Grid != null)
        {
            if (!validGrid(_scale9Grid))
            {
                _scale9Grid = null;
            }
            setSize(bmpData.width, bmpData.height);
        }
        else
        {
            assignBitmapData(_originalBitmap.clone());
        }
    }

    /**
     * setter width
     */
    override public function set width(w:Number):void
    {
        if (w != width)
        {
            setSize(w, height);
        }
    }

    /**
     * setter height
     */
    override public function set height(h:Number):void
    {
        if (h != height)
        {
            setSize(width, h);
        }
    }

    /**
     * set scale9Grid
     */
    override public function set scale9Grid(r:Rectangle):void
    {
        // Check if the given grid is different from the current one
        if ((_scale9Grid == null && r != null) || (_scale9Grid != null && !_scale9Grid.equals(r)))
        {
            if (r == null)
            {
                // If deleting scalee9Grid, restore the original bitmap
                // then resize it (streched) to the previously set dimensions
                var currentWidth:Number = width;
                var currentHeight:Number = height;
                _scale9Grid = null;
                assignBitmapData(_originalBitmap.clone());
                setSize(currentWidth, currentHeight);
            }
            else
            {
                if (!validGrid(r))
                {
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
    protected function assignBitmapData(bmp:BitmapData):void
    {
        super.bitmapData.dispose();
        super.bitmapData = bmp;
    }

    protected function validGrid(r:Rectangle):Boolean
    {
        return r.right <= _originalBitmap.width && r.bottom <= _originalBitmap.height;
    }

    /**
     * get scale9Grid
     */
    override public function get scale9Grid():Rectangle
    {
        return _scale9Grid;
    }


    /**
     * setSize
     */
    public function setSize(w:Number, h:Number):void
    {
        if (_scale9Grid == null)
        {
            super.width = w;
            super.height = h;
        }
        else
        {
            w = Math.max(w, _originalBitmap.width - _scale9Grid.width);
            h = Math.max(h, _originalBitmap.height - _scale9Grid.height);
            resizeBitmap(w, h);
        }
    }

    /**
     * get original bitmap
     */
    public function getOriginalBitmapData():BitmapData
    {
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
    protected function resizeBitmap(w:Number, h:Number):void
    {

        var bmpData:BitmapData = new BitmapData(w, h, true, 0x00000000);

        var rows:Array = [0, _scale9Grid.top, _scale9Grid.bottom, _originalBitmap.height];
        var cols:Array = [0, _scale9Grid.left, _scale9Grid.right, _originalBitmap.width];

        var dRows:Array = [0, _scale9Grid.top, h - (_originalBitmap.height - _scale9Grid.bottom), h];
        var dCols:Array = [0, _scale9Grid.left, w - (_originalBitmap.width - _scale9Grid.right), w];

        var origin:Rectangle;
        var draw:Rectangle;
        var mat:Matrix = new Matrix();


        for (var cx:int = 0; cx < 3; cx++)
        {
            for (var cy:int = 0; cy < 3; cy++)
            {
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
