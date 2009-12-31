package com.flashartofwar.fboxmodel.display {
import com.flashartofwar.fboxmodel.boxmodel.BoxModel;

import flexunit.framework.Assert;

public class BoxModelDisplayTest
{


    private var boxModel:BoxModel;

    public function BoxModelDisplayTest()
    {

    }

    [Test]
    public function testTidy():void
    {
        boxModel = new BoxModel();
        Assert.assertNotNull(boxModel);
    }
}
}

