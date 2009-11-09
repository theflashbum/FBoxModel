/** 
 * <p>Original Author:  jessefreeman</p>
 * <p>Contributing Author:  Justin Akin</p>
 * <p>Class File: AbstractSprite.as</p>
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
	import flash.accessibility.AccessibilityProperties;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Transform;
	import flash.media.SoundTransform;
	import flash.text.TextSnapshot;
	import flash.ui.ContextMenu;

	/**
	 * @author Justin Akin
	 */
	internal class AncestorSprite extends Sprite
	{
		/**
		 * 
		 */
		public function AncestorSprite()
		{
			super();
		}
		
	//--------------------------------------------------------------------------------
	//
	// Protected Getters and Setters
	//
	//--------------------------------------------------------------------------------
	
		/**
		 * @private
		 */
		final protected function get $accessibilityProperties():AccessibilityProperties
		{
			return super.accessibilityProperties;
		}

		/**
		 * @private
		 */
		final protected function set $accessibilityProperties( value:AccessibilityProperties ):void
		{
			super.accessibilityProperties = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $alpha():Number
		{
			return super.alpha;
		}

		/**
		 * @private
		 */
		final protected function set $alpha( value:Number ):void
		{
			super.alpha = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $blendMode():String
		{
			return super.blendMode;
		}

		/**
		 * @private
		 */
		final protected function set $blendMode( value:String ):void
		{
			super.blendMode = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $buttonMode():Boolean
		{
			return super.buttonMode;
		}

		/**
		 * @private
		 */
		final protected function set $buttonMode( value:Boolean ):void
		{
			super.buttonMode = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $cacheAsBitmap():Boolean
		{
			return super.cacheAsBitmap;
		}

		/**
		 * @private
		 */
		final protected function set $cacheAsBitmap( value:Boolean ):void
		{
			super.cacheAsBitmap = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $contextMenu():ContextMenu
		{
			return super.contextMenu;
		}

		/**
		 * @private
		 */
		final protected function set $contextMenu( value:ContextMenu ):void
		{
			super.contextMenu = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $doubleClickEnabled():Boolean
		{
			return super.doubleClickEnabled;
		}

		/**
		 * @private
		 */
		final protected function set $doubleClickEnabled( value:Boolean ):void
		{
			super.doubleClickEnabled = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $dropTarget():DisplayObject
		{
			return super.dropTarget;
		}
		
		/**
		 * @private
		 */
		final protected function get $filters():Array
		{
			return super.filters;
		}

		/**
		 * @private
		 */
		final protected function set $filters( value:Array ):void
		{
			super.filters = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $focusRect():Object
		{
			return super.focusRect;
		}

		/**
		 * @private
		 */
		final protected function set $focusRect( value:Object ):void
		{
			super.focusRect = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $graphics():Graphics
		{
			return super.graphics;
		}
		
		/**
		 * @private
		 */
		final protected function get $height():Number
		{
			return super.height;
		}

		/**
		 * @private
		 */
		final protected function set $height( value:Number ):void
		{
			super.height = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $loaderInfo():LoaderInfo
		{
			return super.loaderInfo;
		}
		
		/**
		 * @private
		 */
		final protected function get $mask():DisplayObject
		{
			return super.mask;
		}

		/**
		 * @private
		 */
		final protected function set $mask( value:DisplayObject ):void
		{
			super.mask = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $mouseChildren():Boolean
		{
			return super.mouseChildren;
		}

		/**
		 * @private
		 */
		final protected function set $mouseChildren( value:Boolean ):void
		{
			super.mouseChildren = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $mouseEnabled():Boolean
		{
			return super.mouseEnabled;
		}

		/**
		 * @private
		 */
		final protected function set $mouseEnabled( value:Boolean ):void
		{
			super.mouseEnabled = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $mouseX():Number
		{
			return super.mouseX;
		}
		
		/**
		 * @private
		 */
		final protected function get $mouseY():Number
		{
			return super.mouseY;
		}
		
		/**
		 * @private
		 */
		final protected function get $name():String
		{
			return super.name;
		}

		/**
		 * @private
		 */
		final protected function set $name( value:String ):void
		{
			super.name = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $numChildren():int
		{
			return super.numChildren;
		}
		
		/**
		 * @private
		 */
		final protected function get $opaqueBackground():Object
		{
			return super.opaqueBackground;
		}

		/**
		 * @private
		 */
		final protected function set $opaqueBackground( value:Object ):void
		{
			super.opaqueBackground = value;
		}

		/**
		 * @private
		 */
		final protected function get $parent():DisplayObjectContainer
		{
			return super.parent;
		}
		
		/**
		 * @private
		 */
		final protected function get $root():DisplayObject
		{
			return super.root;
		}

		/**
		 * @private
		 */
		final protected function get $rotation():Number
		{
			return super.rotation;
		}

		/**
		 * @private
		 */
		final protected function set $rotation( value:Number ):void
		{
			super.rotation = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $scale9Grid():Rectangle
		{
			return super.scale9Grid;
		}

		/**
		 * @private
		 */
		final protected function set $scale9Grid( value:Rectangle ):void
		{
			super.scale9Grid = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $scaleX():Number
		{
			return super.scaleX;
		}

		/**
		 * @private
		 */
		final protected function set $scaleX( value:Number ):void
		{
			super.scaleX = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $scaleY():Number
		{
			return super.scaleY;
		}

		/**
		 * @private
		 */
		final protected function set $scaleY( value:Number ):void
		{
			super.scaleY = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $scrollRect():Rectangle
		{
			return super.scrollRect;
		}

		/**
		 * @private
		 */
		final protected function set $scrollRect( value:Rectangle ):void
		{
			super.scrollRect = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $soundTransform():SoundTransform
		{
			return super.soundTransform;
		}

		/**
		 * @private
		 */
		final protected function set $soundTransform( value:SoundTransform ):void
		{
			super.soundTransform = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $stage():Stage
		{
			return super.stage;
		}
		
		/**
		 * @private
		 */
		final protected function get $tabChildren():Boolean
		{
			return super.tabChildren;
		}

		/**
		 * @private
		 */
		final protected function set $tabChildren( value:Boolean ):void
		{
			super.tabChildren = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $tabEnabled():Boolean
		{
			return super.tabEnabled;
		}

		/**
		 * @private
		 */
		final protected function set $tabEnabled( value:Boolean ):void
		{
			super.tabEnabled = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $tabIndex():int
		{
			return super.tabIndex;
		}

		/**
		 * @private
		 */
		final protected function set $tabIndex( value:int ):void
		{
			super.tabIndex = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $textSnapshot():TextSnapshot
		{
			return super.textSnapshot;
		}
		
		/**
		 * @private
		 */
		final protected function get $transform():Transform
		{
			return super.transform;
		}

		/**
		 * @private
		 */
		final protected function set $transform( value:Transform ):void
		{
			super.transform = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $useHandCursor():Boolean
		{
			return super.useHandCursor;
		}

		/**
		 * @private
		 */
		final protected function set $useHandCursor( value:Boolean ):void
		{
			super.useHandCursor = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $visible():Boolean
		{
			return super.visible;
		}

		/**
		 * @private
		 */
		final protected function set $visible( value:Boolean ):void
		{
			super.visible = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $width():Number
		{
			return super.width;
		}

		/**
		 * @private
		 */
		final protected function set $width( value:Number ):void
		{
			super.width = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $x():Number
		{
			return super.x;
		}

		/**
		 * @private
		 */
		final protected function set $x( value:Number ):void
		{
			super.x = value;
		}
		
		/**
		 * @private
		 */
		final protected function get $y():Number
		{
			return super.y;
		}

		/**
		 * @private
		 */
		final protected function set $y( value:Number ):void
		{
			super.y = value;
		}
		
	//--------------------------------------------------------------------------------
	//
	// Protected Methods
	//
	//--------------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		final protected function $addChild( child:DisplayObject ):DisplayObject
		{
			return super.addChild( child );
		}
		
		/**
		 * @private
		 */
		final protected function $addChildAt( child:DisplayObject, index:int ):DisplayObject
		{
			return super.addChildAt( child, index );
		}
		
		/**
		 * @private
		 */
		final protected function $addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void
		{
			super.addEventListener( type, listener, useCapture, priority, useWeakReference );
		}

		/**
		 * @private
		 */
		final protected function $areInaccessibleObjectsUnderPoint( point:Point ):Boolean
		{
			return super.areInaccessibleObjectsUnderPoint( point );
		}
		
		/**
		 * @private
		 */
		final protected function $contains( child:DisplayObject ):Boolean
		{
			return super.contains( child );
		}
		
		/**
		 * @private
		 */
		final protected function $dispatchEvent( event:Event ):Boolean
		{
			return super.dispatchEvent( event );
		}

		/**
		 * @private
		 */
		final protected function $getBounds( targetCoordinateSpace:DisplayObject ):Rectangle
		{
			return super.getBounds( targetCoordinateSpace );
		}

		/**
		 * @private
		 */
		final protected function $getChildAt( index:int ):DisplayObject
		{
			return super.getChildAt( index );
		}

		/**
		 * @private
		 */
		final protected function $getChildByName( name:String ):DisplayObject
		{
			return super.getChildByName( name );
		}
		
		/**
		 * @private
		 */
		final protected function $getChildIndex( child:DisplayObject ):int
		{
			return super.getChildIndex( child );
		}

		/**
		 * @private
		 */
		final protected function $getObjectsUnderPoint( point:Point ):Array
		{
			return super.getObjectsUnderPoint( point );
		}

		/**
		 * @private
		 */
		final protected function $getRect( targetCoordinateSpace:DisplayObject ):Rectangle
		{
			return super.getRect( targetCoordinateSpace );
		}

		/**
		 * @private
		 */
		final protected function $globalToLocal( point:Point ):Point
		{
			return super.globalToLocal( point );
		}

		/**
		 * @private
		 */
		final protected function $hasEventListener( type:String ):Boolean
		{
			return super.hasEventListener( type );
		}
		
		/**
		 * @private
		 */
		final protected function $hasOwnProperty( name:String ):Boolean
		{
			return super.hasOwnProperty( name );
		}
		
		/**
		 * @private
		 */
		final protected function $hitTestObject( obj:DisplayObject ):Boolean
		{
			return super.hitTestObject( obj );
		}
		
		/**
		 * @private
		 */
		final protected function $hitTestPoint( x:Number, y:Number, shapeFlag:Boolean = false ):Boolean
		{
			return super.hitTestPoint( x, y, shapeFlag );
		}
		
		/**
		 * @private
		 */
		final protected function $isPrototypeOf( theClass:Object ):Boolean
		{
			return super.isPrototypeOf( theClass );
		}
		
		/**
		 * @private
		 */
		final protected function $localToGlobal( point:Point ):Point
		{
			return super.localToGlobal( point );
		}
		
		/**
		 * @private
		 */
		final protected function $propertyIsEnumerable( name:String ):Boolean
		{
			return super.propertyIsEnumerable( name );
		}
		
		/**
		 * @private
		 */
		final protected function $removeChild( child:DisplayObject ):DisplayObject
		{
			return super.removeChild( child );
		}
		
		/**
		 * @private
		 */
		final protected function $removeChildAt( index:int ):DisplayObject
		{
			return super.removeChildAt( index );
		}
		
		/**
		 * @private
		 */
		final protected function $removeEventListener( type:String, listener:Function, useCapture:Boolean = false ):void
		{
			super.removeEventListener( type, listener, useCapture );
		}
		
		/**
		 * @private
		 */
		final protected function $setChildIndex( child:DisplayObject, index:int ):void
		{
			super.setChildIndex( child, index );
		}
		
		/**
		 * @private
		 */
		final protected function $startDrag( lockCenter:Boolean = false, bounds:Rectangle = null ):void
		{
			super.startDrag( lockCenter, bounds );
		}
		
		/**
		 * @private
		 */
		final protected function $stopDrag():void
		{
			super.startDrag();
		}
		
		/**
		 * @private
		 */
		final protected function $swapChildren( child1:DisplayObject, child2:DisplayObject ):void
		{
			super.swapChildren( child1, child2 );
		}
		
		/**
		 * @private
		 */
		final protected function $swapChildrenAt( index1:int, index2:int ):void
		{
			super.swapChildrenAt( index1, index2 );
		}
 	 	
		/**
		 * @private
		 */
		final protected function $toString():String
		{
			return super.toString();
		}
		
		/**
		 * @private
		 */
		final protected function $willTrigger( type:String ):Object
		{
			return super.willTrigger( type );
		}
	}
}