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
import flash.display.DisplayObject;

/**
 * @author jessefreeman
 */
public class BoxModel extends AbstractBoxModel implements IBoxModelRenderable
{
    protected var _display:DisplayObject;

    /**
     * <p>The boxmodel represents a key display manager for the framework. It is
     *    responsible for applying margin, padding, background color, background
     *    images, borders, and aligning the AbstractModel's display. This is based on
     *    HTML's own CSS Box Model.</p>
     */
    public function BoxModel(display:DisplayObject)
    {
        _display = display;
        super(this);
    }

    public function get width():Number
    {
        var tempWidth:Number = _display.width > _width ? _display.width : _width;
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
        var tempHeight:Number = _display.height > _height ? _display.height : _height;
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
        return _display.width > _width ? _display.width : _width;
    }

    /**
     * The height of the display container
     * @return Number
     */
    public function get displayHeight():Number
    {
        return _display.height > _height ? _display.height : _height;
    }

    /**
     * Calculates the size of the border rectangle
     */
    public function calculateBorder():void
    {
        borderRectWidth = paddingRectWidth + borderLeft + borderRight;
        borderRectHeight = paddingRectHeight + borderTop + borderBottom;
    }

    /**
     * Take content width and height + padding to calculate padding size
     */
    public function calculatePadding():void
    {
        paddingRectWidth = paddingLeft + displayWidth + paddingRight;
        paddingRectHeight = paddingTop + displayHeight + paddingBottom;
        paddingRectX = borderLeft;
        paddingRectY = borderTop;
    }

    public function get paddingRectX():Number {
        return _paddingRectangle.x;
    }

    public function get paddingRectY():Number {
        return _paddingRectangle.y;
    }

    public function get paddingRectWidth():Number {
        return _paddingRectangle.width;
    }

    public function get paddingRectHeight():Number {
        return _paddingRectangle.height;
    }

    public function get borderRectX():Number {
        return _borderRectangle.x;
    }

    public function get borderRectY():Number {
        return _borderRectangle.y;
    }

    public function get borderRectWidth():Number {
        return _borderRectangle.width;
    }

    public function get borderRectHeight():Number {
        return _borderRectangle.height;
    }

    public function set borderRectWidth(value:Number):void {
        _borderRectangle.width = value;
    }

    public function set borderRectHeight(value:Number):void {
        _borderRectangle.height = value;
    }

    public function set paddingRectWidth(value:Number):void {
        _paddingRectangle.width = value;
    }

    public function set paddingRectHeight(value:Number):void {
        _paddingRectangle.height = value;
    }

    public function set paddingRectX(value:Number):void {
        _paddingRectangle.x = value;
    }

    public function set paddingRectY(value:Number):void {
        _paddingRectangle.y = value;
    }
}
}
