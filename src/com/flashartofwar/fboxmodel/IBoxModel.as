/**
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: IBoxModel.as</p>
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

package com.flashartofwar.fboxmodel
{
    import flash.display.Bitmap;
    import flash.geom.Rectangle;

    /**
     * @author jessefreeman
     */
    public interface IBoxModel
    {
        function clearProperties():void;

        function clearPadding():void;

        function clearMargin():void;

        function clearBorder():void;

        function clearBackground():void;


        function get backgroundColor():uint;

        function set backgroundColor(value:uint):void;


        function get debugPadding():Boolean;

        function set debugPadding(debugPadding:Boolean):void;

        function get debugPaddingColor():uint;

        function set debugPaddingColor(debugPaddingColor:uint):void;

        function get margin():Array;

        function set margin(values:Array):void;

        function get marginLeft():Number;

        function set marginLeft(marginLeft:Number):void;

        function get borderBottom():Number;

        function set borderBottom(borderBottom:Number):void;

        function set border(value:String):void;

        function get paddingRight():Number;

        function set paddingRight(paddingRight:Number):void;

        function get paddingBottom():Number;

        function set paddingBottom(paddingBottom:Number):void;

        function get paddingLeft():Number;

        function set paddingLeft(paddingLeft:Number):void;

        function get borderTop():Number;

        function set borderTop(borderTop:Number):void;

        function get backgroundImageAlpha():Number;

        function set backgroundImageAlpha(backgroundImageAlpha:Number):void;

        function set backgroundPosition(value:String):void;

        function get marginBottom():Number;

        function set marginBottom(marginBottom:Number):void;

        function get backgroundPositionY():Number;

        function set backgroundPositionY(backgroundPositionY:Number):void;

        function get backgroundPositionX():Number;

        function set backgroundPositionX(backgroundPositionX:Number):void;

        function get borderColor():uint;

        function set borderColor(value:uint):void;

        function get borderLeft():Number;

        function set borderLeft(borderLeft:Number):void;

        function get backgroundImageBitmap():Bitmap;

        function set backgroundImageBitmap(backgroundImageBitmap:Bitmap):void;

        function get marginTop():Number;

        function set marginTop(marginTop:Number):void;

        function get backgroundColorAlpha():Number;

        function set backgroundColorAlpha(backgroundColorAlpha:Number):void;

        function get backgroundScale9Grid():Rectangle;

        function set backgroundScale9Grid(backgroundScale9Grid:Rectangle):void;

        function get backgroundRepeat():String;

        function set backgroundRepeat(backgroundRepeat:String):void;

        function get padding():Array;

        function set padding(values:Array):void;

        function get paddingTop():Number;

        function set paddingTop(paddingTop:Number):void;

        function get borderRight():Number;

        function set borderRight(borderRight:Number):void;

        function get hasBorder():Boolean;

        function get borderAlpha():Number;

        function set borderAlpha(borderAlpha:Number):void;

        function get marginRight():Number;

        function set marginRight(marginRight:Number):void;


    }
}
