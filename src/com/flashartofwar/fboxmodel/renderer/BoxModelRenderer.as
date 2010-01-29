package com.flashartofwar.fboxmodel.renderer {
import com.flashartofwar.fboxmodel.IBoxModel;
import com.flashartofwar.fboxmodel.boxmodel.IBoxModelRenderable;
import com.flashartofwar.fboxmodel.decorators.BackgroundDecorator;

import com.flashartofwar.fboxmodel.decorators.BorderDecorator;

import com.flashartofwar.fboxmodel.decorators.PaddingDecorator;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.events.Event;
import flash.geom.Rectangle;

public class BoxModelRenderer implements IBoxModel{

    private var _target:DisplayObject;
    private var graphics:Graphics;

    private var paddingDecorator:PaddingDecorator;

    private var backgroundDecorator:BackgroundDecorator;

    private var borderDecorator:BorderDecorator;
    
    // Decorators

    
    public function BoxModelRenderer(target:DisplayObject) {
        this.target = target;
    }


    private function set target(target:DisplayObject):void {
        if(target.hasOwnProperty("graphics"))
        {
            _target = target;
            init();
        }
        else
        {
            throw new Error("The target did not have a graphics layer to draw to.");
        }
    }

    protected function init():void {
        graphics = _target["graphics"] as Graphics;
        borderDecorator = new BorderDecorator(graphics);
        backgroundDecorator = new BackgroundDecorator(graphics);
        paddingDecorator = new PaddingDecorator(_target);
    }




    /**
     *
     *
     */
    public function draw():void
    {

        if(hasBorder)
            borderDecorator.draw();

        backgroundDecorator.draw();


        /*boxModel.calculatePadding();

        boxModel.calculateBorder();

        bgDecorator.draw();

        drawBorder();

        alignDisplay();*/

    }

    /**
     * Aligns the display with the appripriate padding, border
     */
    protected function alignDisplay():void
    {
        /*display.x = boxModel.paddingLeft + boxModel.borderLeft;
        display.y = boxModel.paddingTop + boxModel.borderTop;*/
    }

    /**
     *
     */
    protected function drawBorder():void
    {
        /*graphics.beginFill(boxModel.borderColor, boxModel.borderAlpha);
        graphics.drawRect(boxModel.borderRectX, boxModel.borderRectY, boxModel.borderRectWidth, boxModel.borderRectHeight);
        graphics.drawRect(boxModel.borderLeft, boxModel.borderTop, boxModel.paddingRectWidth, boxModel.paddingRectHeight);
        //trace( borderLeft, borderTop, _paddingRectangle.width, _paddingRectangle.height );*/
    }





    private function onRender(event:Event):void {
        draw();
    }


    /**
     * Clears all Box Model Properties
     */
    public function clearProperties():void
    {
        clearPadding();
        clearMargin();
        clearBorder();
        super.clearProperties();
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
        //_borderColor = NaN;
    }

    // Margin Props
    public function get margin():Array {
        return null;
    }

    public function set margin(values:Array):void {
    }

    public function get marginLeft():Number {
        return 0;
    }

    public function set marginLeft(marginLeft:Number):void {
    }


    // Border Decorator Props
    
    public function get borderBottom():Number {
        return borderDecorator.bottom;
    }

    public function set borderBottom(value:Number):void {
        borderDecorator.bottom = value;
    }

    public function set border(value:String):void {
        //borderDecorator.border = value;
        //TODO this needs to be parsed
    }

    public function get borderTop():Number {
        return borderDecorator.top;
    }

    public function set borderTop(value:Number):void {
        borderDecorator.top = value;
        calculateBorderOffsetX();
    }

    public function get borderColor():uint {
        return borderDecorator.color;
    }

    public function set borderColor(value:uint):void {
        borderDecorator.color = value;
    }

    public function get borderLeft():Number {
        return borderDecorator.left;
    }

    public function set borderLeft(value:Number):void {
        borderDecorator.left = value;
        calculateBorderOffsetX();
    }

    public function get borderRight():Number {
        return borderDecorator.right;
    }

    public function set borderRight(value:Number):void {
        borderDecorator.right = value;
    }

    public function get hasBorder():Boolean {
        return borderDecorator.hasBorder;
    }

    public function get borderAlpha():Number {
        return borderDecorator.alpha;
    }

    public function set borderAlpha(value:Number):void {
        borderDecorator.alpha = value
    }


    

    
    public function get paddingRight():Number {
        return 0;
    }

    public function set paddingRight(paddingRight:Number):void {
    }

    public function get paddingBottom():Number {
        return 0;
    }

    public function set paddingBottom(paddingBottom:Number):void {
    }

    public function get paddingLeft():Number {
        return 0;
    }

    public function set paddingLeft(paddingLeft:Number):void {
    }



    public function set backgroundPosition(value:String):void {
    }

    public function get marginBottom():Number {
        return 0;
    }

    public function set marginBottom(marginBottom:Number):void {
    }



    public function get marginTop():Number {
        return 0;
    }

    public function set marginTop(marginTop:Number):void {
    }

    public function get padding():Array {
        return null;
    }

    public function set padding(values:Array):void {
    }

    public function get borderProperties():String {
        return null;
    }

    public function set borderProperties(borderProperties:String):void {
    }

    public function get paddingTop():Number {
        return 0;
    }

    public function set paddingTop(paddingTop:Number):void {
    }



    public function get marginRight():Number {
        return 0;
    }

    public function set marginRight(marginRight:Number):void {
    }


    // Background Props
    
    public function get backgroundImageBitmap():Bitmap {
        return backgroundDecorator.backgroundImageBitmap;
    }

    public function set backgroundImageBitmap(bitmap:Bitmap):void {
        backgroundDecorator.backgroundImageBitmap = bitmap;
    }

    public function get backgroundColorAlpha():Number {
        return backgroundDecorator.backgroundColorAlpha;
    }

    public function set backgroundColorAlpha(value:Number):void {
        backgroundDecorator.backgroundColorAlpha = value;
    }

    public function get backgroundScale9Grid():Rectangle {
        return backgroundDecorator.backgroundScale9Grid;
    }

    public function set backgroundScale9Grid(rectangle:Rectangle):void {
        backgroundDecorator.backgroundScale9Grid = rectangle
    }

    public function get backgroundRepeat():String {
        return backgroundDecorator.backgroundRepeat;
    }

    public function set backgroundRepeat(value:String):void {
        backgroundDecorator.backgroundRepeat = value;
    }

    public function get width():Number {
        return 0;
    }

    private function calculateBorderOffsetX():void {
        borderDecorator.borderOffsetX = -borderDecorator.left;
        borderDecorator.width += borderDecorator.left;
    }

    private function calculateBorderOffsetY():void {
        borderDecorator.borderOffsetY = -borderDecorator.top;
        borderDecorator.height += borderDecorator.top;
    }

    public function set width(value:Number):void {

        borderDecorator.width = value + borderDecorator.left;

        calculateBorderOffsetX();

        backgroundDecorator.width = value;

    }

    public function get height():Number {
        return 0;
    }



    public function set height(value:Number):void {
        borderDecorator.height = value+ borderDecorator.top;

        calculateBorderOffsetY();

        backgroundDecorator.height = value;

    }





    // Background Properties

    public function get backgroundPositionY():Number {
        return backgroundDecorator.backgroundPositionY;
    }

    public function set backgroundPositionY(value:Number):void {
        backgroundDecorator.backgroundPositionY = value;
    }

    public function get backgroundPositionX():Number {
        return backgroundDecorator.backgroundPositionX;
    }

    public function set backgroundPositionX(value:Number):void {
        backgroundDecorator.backgroundPositionX = value;
    }

    public function get backgroundImageAlpha():Number {
        return backgroundDecorator.backgroundImageAlpha;
    }

    public function set backgroundImageAlpha(value:Number):void {
        backgroundDecorator.backgroundImageAlpha = value;
    }

    public function get backgroundColor():uint {
        return backgroundDecorator.backgroundColor;
    }

    public function set backgroundColor(value:uint):void {
        backgroundDecorator.backgroundColor = value;
    }

    public function get useBackgroundColor():Boolean {
        return backgroundDecorator.useBackgroundColor;
    }

    public function clearBackground():void {
    }

    public function set x(value:Number):void
    {
        _target.x = value;
    }

    public function set y(value:Number):void
    {
        _target.y = value;
    }
}
}