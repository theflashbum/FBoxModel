package com.flashartofwar.fboxmodel.renderer {
import com.flashartofwar.fboxmodel.boxmodel.IBoxModel;

import flash.display.DisplayObjectContainer;
import flash.display.Graphics;

public interface IBoxModelRenderer {
    function get boxModel():IBoxModel;

    function get graphics():Graphics;

    function get display():DisplayObjectContainer;
}
}