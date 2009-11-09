package com.flashartofwar.boxmodel.display {
	import com.flashartofwar.boxmodel.events.DisplayEvent;

	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;

	public class BaseDisplay extends AbstractDisplay
	{
		protected var invalidationHash:Dictionary = new Dictionary();
		
		protected var _invalid:Boolean;
		protected var _width:Number = 0;
		protected var _height:Number = 0;

		
		public function BaseDisplay()
		{		
			super( this );
			addStageListeners();
		}
		
	//--------------------------------------------------------------------------------
	//
	// Public Getters and Setters
	//
	//--------------------------------------------------------------------------------
	
		/**
		 * @inheritDoc
		 */		
		public override function get width():Number
		{
			return _width;
		}
		
		/**
		 * @inheritDoc
		 */	
		public override function set width( value:Number ):void
		{
			if( _width == value ) return;
			_width = ! isNaN( value ) ? value : 0;
			invalidate();
		}
		
		/**
		 * @inheritDoc
		 */	
		public override function get height():Number
		{
			return _height;
		}
		
		/**
		 * @inheritDoc
		 */	
		public override function set height( value:Number ):void
		{
			if( _height == value ) return;
			_height = ! isNaN( value ) ? value : 0;
			invalidate();
		}
		
	//--------------------------------------------------------------------------------
	//
	// Protected Getters and Setters
	//
	//--------------------------------------------------------------------------------

		/**
		 * The width of the display container
		 * @return Number
		 */		
		protected function get displayWidth():Number
		{
			return display.width > _width ? display.width : _width;
		}

		/**
		 * The height of the display container
		 * @return Number
		 */		
		protected function get displayHeight():Number
		{
			return display.height > _height ? display.height : _height;
		}
		
	//--------------------------------------------------------------------------------
	//
	// Public Methods
	//
	//--------------------------------------------------------------------------------
		
		/**
		 * Forces a redraw of the display 
		 */		
		public function drawNow():void
		{
			draw();
		}

		/**
		 * 
		 * @param targetCoordinateSpace
		 * @return 
		 * 
		 */		
		override public function getBounds(targetCoordinateSpace:DisplayObject):Rectangle
		{
			var bounds:Rectangle = super.getBounds( targetCoordinateSpace );
			return new Rectangle( bounds.x, bounds.y, width, height );
		}

		/**
		 * 
		 * @param targetCoordinateSpace
		 * @return 
		 * 
		 */		
		override public function getRect( targetCoordinateSpace:DisplayObject ):Rectangle
		{
			var rect:Rectangle = super.getRect( targetCoordinateSpace );
			return new Rectangle( rect.x, rect.y, width, height );
		}
		
	//--------------------------------------------------------------------------------
	//
	// Protected Methods
	//
	//--------------------------------------------------------------------------------
		
		protected function addStageListeners():void
		{
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true );
			addEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true );
		}
					
		protected function draw():void
		{
			dispatchEvent( new DisplayEvent( DisplayEvent.DRAW ) );
			invalidationHash = new Dictionary();
		}
		
		protected function invalidate( type:String = "all" ):void
		{
			invalidationHash[ type ] = true;
			
			if( !_invalid )
			{
				try
				{
					stage.invalidate();
					_invalid = true;
				}
				catch( error:Error )
				{
					_invalid = false;
				}
			}
		}
		
		protected function onAddedToStage( event:Event ):void
		{
			stage.addEventListener( Event.RENDER, onRender, false, 0, true );
			draw();
		}
	
		protected function onRemovedFromStage( event:Event ):void
		{
			$removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			$removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
		}

		protected function onRender( event:Event = null):void
		{
			if( _invalid )
			{
				draw();
				_invalid = false;
			}
		}
		
	}
}
