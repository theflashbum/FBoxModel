package com.flashartofwar.fboxmodel.boxmodel {
import com.flashartofwar.fboxmodel.display.*;

import flash.display.Bitmap;
import flash.geom.Rectangle;

internal class AbstractBoxModel extends BoxModelDisplay implements IBoxModel
	{		
		protected var DELIMITER:String = " ";
		
		protected var _backgroundImageBitmap:Bitmap;
		protected var _paddingRectangle:Rectangle = new Rectangle();
		protected var _borderRectangle:Rectangle = new Rectangle();
		protected var _backgroundColor:Number;
		protected var _borderColor:Number;
		protected var _backgroundScale9Grid:Rectangle;
		protected var _backgroundRepeat:String;
		protected var _backgroundColorAlpha:Number;
		protected var _paddingTop:Number = 0;
		protected var _paddingRight:Number = 0;
		protected var _paddingBottom:Number = 0;
		protected var _paddingLeft:Number = 0;
		protected var _marginTop:Number = 0;
		protected var _marginRight:Number = 0;
		protected var _marginBottom:Number = 0;
		protected var _marginLeft:Number = 0;
		protected var _borderTop:Number = 0;
		protected var _borderRight:Number = 0;
		protected var _borderBottom:Number = 0;
		protected var _borderLeft:Number = 0;
		protected var _borderProperties:String;
		protected var _borderAlpha:Number = 1;
		protected var _backgroundPositionX:Number = 0;
		protected var _backgroundPositionY:Number = 0;
		protected var _debugPadding:Boolean = false;
		protected var _debugPaddingColor:uint = 0xFFFF00;
		protected var _backgroundImageAlpha:Number = 1;
		
	//--------------------------------------------------------------------------------
	//
	// Constructor
	//
	//--------------------------------------------------------------------------------
		
		/**
		 * 
		 */		
		public function AbstractBoxModel()
		{
			super();
		}
		
	//--------------------------------------------------------------------------------
	//
	// Public Getters and Setters
	//
	//--------------------------------------------------------------------------------

		/**
		 * The fill color of the background
		 * @return uint
		 */		
		public function get backgroundColor():uint
		{
			return _backgroundColor; 
		}
		
		/**
		 * @private
		 */	
		public function set backgroundColor( value:uint ):void
		{
			_backgroundColor = value;
			invalidate();	
		}
		
		/**
		 * The fill color of the border
		 * @return uint
		 */
		public function get borderColor():uint
		{
			return _borderColor;
		}

		/**
		 * @private
		 */		
		public function set borderColor( value:uint ):void
		{
			_borderColor = value;
			invalidate();	
		}

		/**
		 * @private
		 */		
		public function set backgroundPosition( value:String ):void
		{
			var split:Array = value.split( DELIMITER, 2 );
			
			backgroundPositionX = Number( split[0] );
			backgroundPositionY = Number( split[1] );
			
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
		public function set padding( values:Array ):void
		{
			values = validateOffset( values );
			paddingTop = values[0];
			paddingRight = values[1];
			paddingBottom = values[2];
			paddingLeft = values[3];
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
		public function set margin( values:Array ):void
		{
			values = validateOffset( values );
			
			marginTop = values[0];
			marginRight = values[1];
			marginBottom = values[2];
			marginLeft = values[3];
			
			invalidate();
		}

		/**
		 * The full Box Model width including padding and border
		 * @return Number
		 */		
		override public function get width():Number
		{
			var tempWidth:Number = display.width > _width ? display.width : _width;
			return borderLeft + paddingLeft + tempWidth + paddingRight + borderRight;
		}

		/**
		 * The full Box Model height including padding and border
		 * @return Number
		 */		
		override public function get height():Number
		{
			var tempHeight:Number = display.height > _height ? display.height : _height;
			return borderTop + paddingTop + tempHeight + paddingBottom + borderBottom;
		}

		/**
		 * @private
		 */		
		public function set border( value:String ):void
		{
			var values:Array = value.split( DELIMITER, 4 );
			
			borderTop = borderRight = borderBottom = borderLeft = values[0];
			borderProperties = values[1];
			borderColor = stringToColor( values[2] );
			borderAlpha = ( values[3] != null ) ? Number( values[3] ) : 1;
			
			invalidate();
		}
		
		protected function stringToColor(value:String):uint
		{
			value = value.substr( - 6, 6 );
			var color:uint = Number( "0x" + value );
			return color;
		}
		
		/**
		 * Determines if any border values have been set
		 * @return Boolean
		 */		
		public function get hasBorder():Boolean
		{
			var value:Number = borderTop + borderRight + borderBottom + borderLeft;
			return Boolean( value );
		}
		
		/**
		 * Scale9Grid of the background image
		 * @return Rectangle
		 */
		public function get backgroundScale9Grid():Rectangle
		{
			return _backgroundScale9Grid;
		}
		
		/**
		 * @private
		 */
		public function set backgroundScale9Grid( backgroundScale9Grid:Rectangle ):void
		{
			_backgroundScale9Grid = backgroundScale9Grid;
			invalidate();
		}

		/**
		 * The repeat settings for the background image
		 * @return String
		 */
		public function get backgroundRepeat():String
		{
			return _backgroundRepeat;
		}
	
		/**
		 * @private
		 */
		public function set backgroundRepeat( backgroundRepeat:String ):void
		{
			_backgroundRepeat = backgroundRepeat;
			invalidate();
		}

		/**
		 * The background fill alpha
		 * @return Number
		 */
		public function get backgroundColorAlpha():Number
		{
			return _backgroundColorAlpha;
		}
	
		/**
		 * @private
		 */
		public function set backgroundColorAlpha( backgroundColorAlpha:Number ):void
		{
			_backgroundColorAlpha = backgroundColorAlpha;
			invalidate();
		}

		/**
		 * The Box Model padding top value
		 * @return Number
		 */
		public function get paddingTop():Number
		{
			return _paddingTop;
		}
	
		/**
		 * @private
		 */
		public function set paddingTop( paddingTop:Number ):void
		{
			_paddingTop = paddingTop;
			invalidate();
		}

		/**
		 * The Box Model padding right value
		 * @return Number
		 */
		public function get paddingRight():Number
		{
			return _paddingRight;
		}
	
		/**
		 * @private
		 */
		public function set paddingRight( paddingRight:Number ):void
		{
			_paddingRight = paddingRight;
			invalidate();
		}

		/**
		 * The Box Model padding bottom value
		 * @return Number
		 */
		public function get paddingBottom():Number
		{
			return _paddingBottom;
		}
	
		/**
		 * @private
		 */
		public function set paddingBottom( paddingBottom:Number ):void
		{
			_paddingBottom = paddingBottom;
			invalidate();
		}

		/**
		 * The Box Model padding left value
		 * @return Number
		 */
		public function get paddingLeft():Number
		{
			return _paddingLeft;
		}
	
		/**
		 * @private
		 */
		public function set paddingLeft( paddingLeft:Number ):void
		{
			_paddingLeft = paddingLeft;
			invalidate();
		}

		/**
		 * The Box Model margin top value
		 * @return Number
		 */
		public function get marginTop():Number
		{
			return _marginTop;
		}
	
		/**
		 * @private
		 */
		public function set marginTop( marginTop:Number ):void
		{
			_marginTop = marginTop;
			invalidate();
		}

		/**
		 * The Box Model margin right value
		 * @return Number
		 */
		public function get marginRight():Number
		{
			return _marginRight;
		}
	
		/**
		 * @private
		 */
		public function set marginRight( marginRight:Number ):void
		{
			_marginRight = marginRight;
			invalidate();
		}

		/**
		 * The Box Model margin bottom value
		 * @return Number
		 */
		public function get marginBottom():Number
		{
			return _marginBottom;
		}
	
		/**
		 * @private
		 */
		public function set marginBottom( marginBottom:Number ):void
		{
			_marginBottom = marginBottom;
			invalidate();
		}

		/**
		 * The Box Model margin left value
		 * @return Number
		 */
		public function get marginLeft():Number
		{
			return _marginLeft;
		}
	
		/**
		 * @private
		 */
		public function set marginLeft( marginLeft:Number ):void
		{
			_marginLeft = marginLeft;
			invalidate();
		}

		/**
		 * The Box Model border top value
		 * @return Number
		 */
		public function get borderTop():Number
		{
			return _borderTop;
		}
	
		/**
		 * @private
		 */
		public function set borderTop(borderTop:Number):void
		{
			_borderTop = borderTop;
			invalidate();
		}

		/**
		 * The Box Model border right value
		 * @return Number
		 */
		public function get borderRight():Number
		{
			return _borderRight;
		}
	
		/**
		 * @private
		 */
		public function set borderRight(borderRight:Number):void
		{
			_borderRight = borderRight;
			invalidate();
		}

		/**
		 * The Box Model border bottom value
		 * @return Number
		 */
		public function get borderBottom():Number
		{
			return _borderBottom;
		}
	
		/**
		 * @private
		 */
		public function set borderBottom(borderBottom:Number):void
		{
			_borderBottom = borderBottom;
			invalidate();
		}

		/**
		 * The Box Model border left value
		 * @return Number
		 */
		public function get borderLeft():Number
		{
			return _borderLeft;
		}
	
		/**
		 * @private
		 */
		public function set borderLeft(borderLeft:Number):void
		{
			_borderLeft = borderLeft;
			invalidate();
		}

		/**
		 * The Box Model border properties
		 * @return String
		 */
		public function get borderProperties():String
		{
			return _borderProperties;
		}
	
		/**
		 * @private
		 */
		public function set borderProperties( borderProperties:String ):void
		{
			_borderProperties = borderProperties;
			invalidate();
		}

		/**
		 * The Box Model border alpha value
		 * @return Number
		 */
		public function get borderAlpha():Number
		{
			return _borderAlpha;
		}
	
		/**
		 * @private
		 */
		public function set borderAlpha( borderAlpha:Number ):void
		{
			_borderAlpha = borderAlpha;
			invalidate();
		}

		/**
		 * The Box Model background x position
		 * @return Number
		 */
		public function get backgroundPositionX():Number
		{
			return _backgroundPositionX;
		}
	
		/**
		 * @private
		 */
		public function set backgroundPositionX(backgroundPositionX:Number):void
		{
			_backgroundPositionX = backgroundPositionX;
			invalidate();
		}

		/**
		 * The Box Model background y position
		 * @return Number
		 */
		public function get backgroundPositionY():Number
		{
			return _backgroundPositionY;
		}
	
		/**
		 * @private
		 */
		public function set backgroundPositionY( backgroundPositionY:Number ):void
		{
			_backgroundPositionY = backgroundPositionY;
			invalidate();
		}

		/**
		 * Whether or not to show the Box Model debug padding
		 * @return Boolean
		 */
		public function get debugPadding():Boolean
		{
			return _debugPadding;
		}
	
		/**
		 * @private
		 */
		public function set debugPadding( debugPadding:Boolean ):void
		{
			_debugPadding = debugPadding;
			invalidate();
		}

		/**
		 * The Box Model debug padding color
		 * @return uint
		 */
		public function get debugPaddingColor():uint
		{
			return _debugPaddingColor;
		}
	
		/**
		 * @private
		 */
		public function set debugPaddingColor(debugPaddingColor:uint):void
		{
			_debugPaddingColor = debugPaddingColor;
			invalidate();
		}

		/**
		 * The Box Model background image
		 * @return Bitmap
		 */
		public function get backgroundImageBitmap():Bitmap
		{
			return _backgroundImageBitmap;
		}
	
		/**
		 * @private
		 */
		public function set backgroundImageBitmap( backgroundImageBitmap:Bitmap ):void
		{
			_backgroundImageBitmap = backgroundImageBitmap;
			invalidate();
		}

		/**
		 * The Box Model background image alpha
		 * @return uint
		 */
		public function get backgroundImageAlpha():Number
		{
			return _backgroundImageAlpha;
		}
	
		/**
		 * @private
		 */
		public function set backgroundImageAlpha(backgroundImageAlpha:Number):void
		{
			_backgroundImageAlpha = backgroundImageAlpha;
			invalidate();
		}


		
	//--------------------------------------------------------------------------------
	//
	// Public Methods
	//
	//--------------------------------------------------------------------------------		

		/**
		 * Clears all Box Model Properties
		 */			
		public function clearProperties():void
		{
			clearPadding();
			clearMargin();
			clearBorder();
			clearBackground();
		}

		/**
		 * Sets padding values to 0
		 */		
		public function clearPadding():void
		{
			padding = [ 0,0,0,0 ];
		}

		/**
		 * Sets margin values to 0
		 */		
		public function clearMargin():void
		{
			margin = [ 0, 0, 0, 0 ];
		}

		/**
		 * Clears border information
		 */		
		public function clearBorder():void
		{
			borderAlpha = 1;
			borderLeft = borderRight = borderBottom = borderLeft = 0;
			_borderColor = NaN;			
		}
		
		public function clearBackgroundImage():void
		{
			_backgroundImageBitmap = null;
			_backgroundColor = NaN;
		}
		/**
		 * Clears the background of image and color
		 */		
		public function clearBackground():void
		{
			clearBackgroundImage();
			backgroundColorAlpha = NaN;
		}

        
		
	//--------------------------------------------------------------------------------
	//
	// Protected Methods
	//
	//--------------------------------------------------------------------------------	

		/**
		 * Aligns the display with the appripriate padding, border
		 */		
		protected function alignDisplay():void
		{
			display.x = paddingLeft + borderLeft;
			display.y = paddingTop + borderTop;
		}

		/**
		 * Calculates the size of the border rectangle
		 */		
		protected function calculateBorder():void
		{
			_borderRectangle.width = _paddingRectangle.width + borderLeft + borderRight;
			_borderRectangle.height = _paddingRectangle.height + borderTop + borderBottom;
		}

		/**
		 * Take content width and height + padding to calculate padding size
		 */		
		protected function calculatePadding():void
		{
			_paddingRectangle.width = paddingLeft + displayWidth + paddingRight;
			_paddingRectangle.height = paddingTop + displayHeight + paddingBottom;
			_paddingRectangle.x = borderLeft;
			_paddingRectangle.y = borderTop;
		}

		/**
		 * Sets the backgroundPositionX and backgroundPositionY to 0
		 */		
		protected function resetBackgroundPosition():void
		{
			backgroundPositionX = backgroundPositionY = 0;
		}	

		/**
		 * <p>Takes a string of numbers and returns a 4 position array that can 
		 * be used for padding or margin offsets. Offsets arrays contain 4 slots 
		 * Top, Right, Bottom, Left. Accepts 3 variations:</p>
		 * 
		 * <p>1) Single number, pads all 4 slots with the value</p>
		 * 
		 * <p>2) Two numbers, pads the top and bottom with the first value, and 
		 * the left and right with the second number</p>
		 * 
		 * <p>3) 4 number, is a 1 to 1 translations and maps all values to 
		 * respective slots.</p>
		 * 
		 * @return Array
		 */
		protected function validateOffset( values:Array ):Array 
		{
			
			var total:Number = values.length;
			var offset:Array;
			
			if( total == 1 )
			{
				var baseValue:Number = values[0];
				offset = [ baseValue, baseValue, baseValue, baseValue ];
			}
			else if ( total == 2 )
			{
				var tbValue:Number = values[0];
				var lrValue:Number = values[1];
				
				offset = [ tbValue, lrValue, tbValue, lrValue ];
			}
			else
			{
				for ( var i:Number = 0; i < 4; i++ )
				{
					if ( !values[i] ) values[i] = 0; 
				}
				
				offset = [ values[0], values[1], values[2], values[3] ];
			}
			
			return offset;
		}

    }
}