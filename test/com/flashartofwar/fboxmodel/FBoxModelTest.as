package com.flashartofwar.fboxmodel
{
    import flexunit.framework.Assert;

    public class FBoxModelTest
    {
        private var boxModel:FBoxModel;

        public function FBoxModelTest()
        {
            boxModel = new FBoxModel();
        }

        [Test]
        public function defaultBackgroundColorTest():void
        {
            Assert.assertEquals(boxModel.backgroundColor, 0);
        }

    }
}

