/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: BoxModelDisplay.as</p>
 *
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 *
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 *
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 *
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 *
 * <p>Revisions<br/>
 *     2.0  Initial version Jan 7, 2009</p>
 *
 */

package com.flashartofwar.fboxmodel.boxmodel {
import com.flashartofwar.fboxmodel.enum.BgRepeatProps;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Point;

/**
 * @author jessefreeman
 */
public class BoxModel extends AbstractBoxModel
{

    /**
     * <p>The boxmodel represents a key display manager for the framework. It is
     *    responsible for applying margin, padding, background color, background
     *    images, borders, and aligning the AbstractModel's display. This is based on
     *    HTML's own CSS Box Model.</p>
     */
    public function BoxModel()
    {
        super();
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
     * The center point of the display object.
     *
     * @return Point
     */
    public function get center():Point
    {
        return new Point(x + ( width / 2 ), y + ( height / 2 ));
    }

    /**
     * @private
     */
    public function set center(point:Point):void
    {
        x = point.x - ( width / 2 );
        y = point.y - ( height / 2 );
    }

    /**
     * Moves the display object to a new position.
     *
     * @param x
     * @param y
     */
    public function move(x:Number, y:Number):void
    {
        this.x = x;
        this.y = y;
    }

    /**
     * Resizes the diplay object's widht and height.
     *
     * @param width
     * @param height
     */
    public function resize(width:Number, height:Number):void
    {
        this.width = width;
        this.height = height;
    }

    /**
     *
     * @param tempBitmap
     *
     */
    protected function sampleBackground(bitmap:Bitmap):void
    {
        _backgroundImageBitmap = new Bitmap(bitmap.bitmapData.clone());

        if (backgroundScale9Grid)
        {
            _backgroundImageBitmap.scale9Grid = backgroundScale9Grid;
        }

        dispatchEvent(new Event(Event.COMPLETE));
        invalidate();
    }

    /**
     *
     *
     */
    override protected function draw():void
    {

        calculatePadding();

        calculateBorder();

        // Start drawing
        $graphics.clear();

        // Create Border
        if (hasBorder) drawBorder();
        if (!isNaN(_backgroundColor)) drawBackgroundColor();

        drawBackgroundImage();

        $graphics.endFill();

        alignDisplay();

        super.draw();
    }

    /**
     *
     */
    protected function drawBorder():void
    {
        $graphics.beginFill(_borderColor, borderAlpha);
        $graphics.drawRect(_borderRectangle.x, _borderRectangle.y, _borderRectangle.width, _borderRectangle.height);
        $graphics.drawRect(borderLeft, borderTop, _paddingRectangle.width, _paddingRectangle.height);
        //trace( borderLeft, borderTop, _paddingRectangle.width, _paddingRectangle.height );
    }

    /**
     *
     */
    protected function drawBackgroundImage():void
    {
        //
        if (_backgroundImageBitmap)
        {
            var bgiFullW:Number = paddingLeft + displayWidth + paddingRight;
            var bgiFullH:Number = paddingTop + displayHeight + paddingBottom;

            var bgiW:Number = _backgroundImageBitmap.width;
            var bgiH:Number = _backgroundImageBitmap.height;

            var bgX:Number = _paddingRectangle.x;
            var bgY:Number = _paddingRectangle.y;

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

            bmd.draw(_backgroundImageBitmap, null, new ColorTransform(1, 1, 1, backgroundImageAlpha));

            $graphics.beginBitmapFill(bmd, m, true, false);
            $graphics.drawRect(bgX, bgY, bgiW, bgiH);
            $graphics.endFill();
        }
    }

    /**
     *
     *
     */
    protected function drawBackgroundColor():void
    {
        var tempColor:uint = _debugPadding ? _debugPaddingColor : _backgroundColor;

        backgroundColorAlpha = isNaN(backgroundColorAlpha) ? 1 : backgroundColorAlpha;

        $graphics.beginFill(tempColor, backgroundColorAlpha);
        $graphics.drawRect(_paddingRectangle.x, _paddingRectangle.y, _paddingRectangle.width, _paddingRectangle.height);
        $graphics.endFill();

        if (_debugPadding)
        {
            $graphics.beginFill(_backgroundColor, backgroundColorAlpha);
            $graphics.drawRect(paddingLeft + borderLeft, paddingTop + borderTop, displayWidth, displayHeight);
            $graphics.endFill();
        }
    }

}
}
