package com.flashartofwar.fboxmodel.display {

import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.Rectangle;

public class BoxModelDisplay extends AbstractBoxModelDisplay
{
    public static const DRAW:String = "draw";

    protected var _invalid:Boolean;


    public function BoxModelDisplay()
    {
        super(this);
        addStageListeners();
    }

    //--------------------------------------------------------------------------------
    //
    // Public Getters and Setters
    //
    //--------------------------------------------------------------------------------


    //--------------------------------------------------------------------------------
    //
    // Protected Getters and Setters
    //
    //--------------------------------------------------------------------------------


    //--------------------------------------------------------------------------------
    //
    // Public Methods
    //
    //--------------------------------------------------------------------------------

    /**
     * Forces a redraw of the display
     */
    override public function drawNow():void
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
        var bounds:Rectangle = super.getBounds(targetCoordinateSpace);
        return new Rectangle(bounds.x, bounds.y, width, height);
    }

    /**
     *
     * @param targetCoordinateSpace
     * @return
     *
     */
    override public function getRect(targetCoordinateSpace:DisplayObject):Rectangle
    {
        var rect:Rectangle = super.getRect(targetCoordinateSpace);
        return new Rectangle(rect.x, rect.y, width, height);
    }

    //--------------------------------------------------------------------------------
    //
    // Protected Methods
    //
    //--------------------------------------------------------------------------------

    protected function addStageListeners():void
    {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true);
    }

    protected function draw():void
    {
        dispatchEvent(new Event(BoxModelDisplay.DRAW));

        //TODO This is removed because it is expensive
        //invalidationHash = new Dictionary();
    }

    protected function invalidate(type:String = "all"):void
    {
        //TODO removed invalidationHash since we are not using it
        //invalidationHash[ type ] = true;

        //TODO This may be expensive, need to look into removing the Try Catch
        if (!_invalid)
        {
            try
            {
                stage.invalidate();
                _invalid = true;
            }
            catch(error:Error)
            {
                _invalid = false;
            }
        }
    }

    protected function onAddedToStage(event:Event):void
    {
        stage.addEventListener(Event.RENDER, onRender, false, 0, true);
        draw();
    }

    protected function onRemovedFromStage(event:Event):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    protected function onRender(event:Event = null):void
    {
        if (_invalid)
        {
            draw();
            _invalid = false;
        }
    }
}
}
