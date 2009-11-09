/** 
 * <p>Original Author:  jessefreeman</p>
 * <p>Class File: IDisplay.as</p>
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
 * 	2.0  Initial version Jan 19, 2009</p>
 *
 */

package com.flashartofwar.boxmodel.display {
	import flash.display.BitmapData;
	import flash.display.DisplayObject;

	public interface IDisplay
	{
		//TODO add all supporting props to this Interface
		function get x() : Number;

		function set x(value : Number) : void;

		function get y() : Number;

		function set y(value : Number) : void;

		function get alpha() : Number;

		function set alpha(value : Number) : void;

		function get scaleX() : Number;

		function set scaleX(value : Number) : void;

		function get bitmapData() : BitmapData;

		function move(newX : Number,newY : Number) : void;

		function resize(w : Number,h : Number) : void;

		function destroy() : void;

		function addChild(child : DisplayObject) : DisplayObject;

		function addChildAt(child : DisplayObject, index : int) : DisplayObject;

		function getChildAt(index : int) : DisplayObject;

		function getChildByName(name : String) : DisplayObject;

		function getChildIndex(child : DisplayObject) : int;

		function removeChild(child : DisplayObject) : DisplayObject;

		function removeChildAt(index : int) : DisplayObject;

		function setChildIndex(child : DisplayObject, index : int) : void;

		function swapChildren(child1 : DisplayObject, child2 : DisplayObject) : void;

		function swapChildrenAt(index1 : int, index2 : int) : void;
	}
}