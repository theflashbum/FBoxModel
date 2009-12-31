package com.flashartofwar.fboxmodel.boxmodel {

public interface IBoxModelRenderable extends IBoxModel {

    function get width():Number;

    function get height():Number;

    function set width(value:Number):void;

    function set height(value:Number):void;

    function get borderRectY():Number;

    function get borderRectX():Number;

    function get paddingRectY():Number;

    function set paddingRectY(value:Number):void;

    function get paddingRectX():Number;

    function set paddingRectX(value:Number):void;

    function calculatePadding():void;

    function calculateBorder():void;

    function get displayWidth():Number;

    function get displayHeight():Number;

    function get borderRectWidth():Number;

    function get paddingRectWidth():Number;

    function get paddingRectHeight():Number;

    function get borderRectHeight():Number;
}
}