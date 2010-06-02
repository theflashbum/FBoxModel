package com.flashartofwar.fboxmodel.decorators
{
    import flash.display.Shape;

    import flexunit.framework.Assert;

    public class BackgroundColorDecoratorTest
    {
        private var testShape:Shape;
        private var decorator:BackgroundColorDecorator;

        public function BackgroundColorDecoratorTest()
        {
            testShape = new Shape();
            decorator = new BackgroundColorDecorator(testShape.graphics);
        }

        [Test]
        public function defaultHasBackgroundColor():void
        {
            Assert.assertFalse(decorator.hasColor);
        }

        [Test]
        public function hasColorTest1():void
        {
            decorator.color = 0xff0000;
            Assert.assertTrue(decorator.hasColor);
        }

        [Test]
        public function hasColorAfterClearTest():void
        {
            decorator.color = 0xff0000;
            decorator.clear();
            Assert.assertFalse(decorator.hasColor);
        }

        [Test]
        public function setColorTest():void
        {
            decorator.color = 0xff0000;
            Assert.assertEquals(decorator.color, 0xff0000);
        }

        [Test]
        public function defaultAlphaTest():void
        {
            Assert.assertEquals(decorator.alpha, 1);
        }

        public function drawTest():void
        {
            decorator.width = 100;
            decorator.height = 50;
            decorator.color = 0xff0000;
            decorator.draw();

            Assert.assertEquals(testShape.width, 100);
            Assert.assertEquals(testShape.height, 50);
        }

    }
}

