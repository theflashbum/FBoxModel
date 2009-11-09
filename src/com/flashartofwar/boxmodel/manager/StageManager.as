package com.flashartofwar.boxmodel.manager {
	import flash.display.Stage;
	import flash.events.Event;

	public class StageManager
	{	
		private static var singleton:StageManager;
	
		private var _stage:Stage;
		private var invalid:Boolean;
	
	//--------------------------------------------------------------------------------
	//
	//	Constructor
	//	NOTE: AS3 does not allow for private or protected constructors
	//
	//--------------------------------------------------------------------------------
	
		/**
		 * this.singleton constructor.  Can only be called by the static getInstance method.
		 * 
		 * @param caller	The function to call the Dragger constructor function
		 */
		public function StageManager( caller:Function = null )
		{	
            if( caller != StageManager.getInstance )
                throw new Error ( "this.singleton is a this.singleton class, use getInstance() instead" );
			
            if ( StageManager.singleton != null )
                throw new Error( "Only one this.singleton instance should be instantiated" );	
		}
		
	//--------------------------------------------------------------------------------
	//
	//	Public Static Functions
	//
	//-------------------------------------------------------------------------------- 
        
		/**
         * Creates a new instance of StageManager if one does not currently exist.
         * 
         * @return StageManager
         */
        public static function stageManager():StageManager
        {	
            return getInstance(); 
        }
		
	//--------------------------------------------------------------------------------
	//
	//	Private Static Functions
	//
	//-------------------------------------------------------------------------------- 
        
		/**
         * Creates a new instance of StageManager if one does not currently exist.
         * 
         * @return StageManager
         */
        private static function getInstance():StageManager
        {	
            if ( singleton == null ) singleton = new StageManager( arguments.callee );
            
            return singleton;   
        }
		
	//--------------------------------------------------------------------------------
	//
	//	Public Functions
	//
	//-------------------------------------------------------------------------------- 
        
        public function invalidate( stage:Stage ):void
        {
        	if( !stage ) return;
        	
        	if( !_stage )
        	{
        		_stage = stage;
        		_stage.addEventListener( Event.RENDER, onRender );
        	}
        	else if( !invalid )
        	{
        		_stage.invalidate();
        		invalid = true;
        	}
        }
		
	//--------------------------------------------------------------------------------
	//
	//	Private Functions
	//
	//-------------------------------------------------------------------------------- 
                
        private function onRender( event:Event ):void
        {
        	invalid = false;
        }
	}
}