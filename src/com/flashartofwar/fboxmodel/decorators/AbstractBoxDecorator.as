package com.flashartofwar.fboxmodel.decorators {
import flash.errors.IllegalOperationError;

public class AbstractBoxDecorator implements IBox{
    
    public static const TOP:Number = 0;
    public static const RIGHT:Number = 1;
    public static const BOTTOM:Number = 2;
    public static const LEFT:Number = 3;
    
    private var _boxValues:Array = [0,0,0,0];
    
    public function AbstractBoxDecorator(self:AbstractBoxDecorator) {
         if (self != this)
            throw new IllegalOperationError("AbstractBoxDecorator cannot be instantiated directly.");
    }

    public function get top():Number
    {
        return _boxValues[TOP];
    }

    public function set top(value:Number):void
    {
        _boxValues[TOP] = value;
    }

    public function get right():Number
    {
        return _boxValues[RIGHT];
    }

    public function set right(value:Number):void
    {
        _boxValues[RIGHT] = value;
    }

    public function get bottom():Number {
        return _boxValues[BOTTOM];
    }

    public function set bottom(value:Number):void
    {
        _boxValues[BOTTOM] = value;
    }

    public function get left():Number {
        return _boxValues[LEFT];
    }

    public function set left(value:Number):void
    {
        _boxValues[LEFT] = value;
    }

    /**
     * The Box Model padding values
     * @return Array
     */
    public function get boxValues():Array
    {
        return [ top, right, bottom, left ];
    }

    /**
     * @private
     */
    public function set boxValues(values:Array):void
    {
        values = validateOffset(values);
        top = values[0];
        right = values[1];
        bottom = values[2];
        left = values[3];
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
    protected function validateOffset(values:Array):Array
    {

        var total:Number = values.length;
        var offset:Array;

        if (total == 1)
        {
            var baseValue:Number = values[0];
            offset = [ baseValue, baseValue, baseValue, baseValue ];
        }
        else if (total == 2)
        {
            var tbValue:Number = values[0];
            var lrValue:Number = values[1];

            offset = [ tbValue, lrValue, tbValue, lrValue ];
        }
        else
        {
            for (var i:Number = 0; i < 4; i++)
            {
                if (!values[i]) values[i] = 0;
            }

            offset = [ values[0], values[1], values[2], values[3] ];
        }

        return offset;
    }
}
}