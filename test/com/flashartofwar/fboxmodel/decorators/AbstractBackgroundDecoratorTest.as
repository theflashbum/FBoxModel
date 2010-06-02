package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.Shape;

    import flexunit.framework.Assert;

    public class AbstractBackgroundDecoratorTest
    {
        private var testShape:Shape;
        private var decorator:AbstractBackgroundDecorator;

        public function AbstractBackgroundDecoratorTest()
        {
            testShape = new Shape();
            decorator = new AbstractBackgroundDecorator(testShape.graphics);
        }


        [Test]
        public function setAlpha():void
        {
            decorator.alpha = .5;
            Assert.assertEquals(decorator.alpha, .5);
        }

        [Test]
        public function clearAlpha():void
        {
            decorator.alpha = .5;
            decorator.clear();
            Assert.assertEquals(decorator.alpha, 1);
        }
    }
}

