package com.flashartofwar.fboxmodel.display {
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.utils.Dictionary;

public class AbstractBoxModelDisplay extends Sprite implements IBoxModelDisplay
{
    protected var display:Sprite;
    protected var registeredListeners:Dictionary = new Dictionary();

    /**
     * @author jessefreeman
     * @author Justin Akin
     */
    public function AbstractBoxModelDisplay(self:AbstractBoxModelDisplay)
    {
        if (self != this)
            throw new IllegalOperationError("AbstractBoxModelDisplay cannot be instantiated directly.");
        else
            addDisplay();
    }

    //--------------------------------------------------------------------------------
    //
    // Public Getters and Setters
    //
    //--------------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    /*override public function get graphics():Graphics
     {
     return display.graphics;
     }*/

    /**
     * @inheritDoc
     */
    override public function get numChildren():int
    {
        return display.numChildren;
    }

    /**
     * @inheritDoc
     */
    override public function get parent():DisplayObjectContainer
    {
        if (super.parent) return super.parent.name == "display" ? super.parent.parent : super.parent;

        return super.parent;
    }


    //--------------------------------------------------------------------------------
    //
    // Public Methods
    //
    //--------------------------------------------------------------------------------


    /**
     * @inheritDoc
     */
    override public function addChild(child:DisplayObject):DisplayObject
    {
        return display.addChild(child);
    }

    /**
     * @inheritDoc
     */
    override public function addChildAt(child:DisplayObject, index:int):DisplayObject
    {
        return display.addChildAt(child, index);
    }

    /**
     * @inheritDoc
     */
    override public function contains(child:DisplayObject):Boolean
    {
        return display.contains(child);
    }

    /**
     * @inheritDoc
     */
    override public function getChildAt(index:int):DisplayObject
    {
        return display.getChildAt(index);
    }

    /**
     * @inheritDoc
     */
    override public function getChildByName(name:String):DisplayObject
    {
        return display.getChildByName(name);
    }

    /**
     * @inheritDoc
     */
    override public function getChildIndex(child:DisplayObject):int
    {
        return display.getChildIndex(child);
    }

    /**
     * @inheritDoc
     */
    override public function removeChild(child:DisplayObject):DisplayObject
    {
        return display.removeChild(child);
    }

    /**
     * @inheritDoc
     */
    override public function removeChildAt(index:int):DisplayObject
    {
        return display.removeChildAt(index);
    }

    /**
     * @inheritDoc
     */
    override public function setChildIndex(child:DisplayObject, index:int):void
    {
        display.setChildIndex(child, index);
    }

    /**
     * @inheritDoc
     */
    override public function swapChildren(child1:DisplayObject, child2:DisplayObject):void
    {
        display.swapChildren(child1, child2);
    }

    /**
     * @inheritDoc
     */
    override public function swapChildrenAt(index1:int, index2:int):void
    {
        display.swapChildrenAt(index1, index2);
    }

    //--------------------------------------------------------------------------------
    //
    // Protected Methods
    //
    //--------------------------------------------------------------------------------

    /**
     * Adds the display to the display tree by default
     */
    protected function addDisplay():void
    {
        display = new Sprite();
        display.name = "display";

        $addChild(display);
    }

    /**
     * @private
     */
    final protected function $addChild(child:DisplayObject):DisplayObject
    {
        return super.addChild(child);
    }

    /**
     * @private
     */
    /*final protected function get $graphics():Graphics
     {
     return super.graphics;
     }*/

    public function drawNow():void {

    }
}
}
