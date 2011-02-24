package com.flashartofwar.fboxmodel
{
    import com.flashartofwar.fboxmodel.decorators.AbstractBackgroundDecoratorTest;
    import com.flashartofwar.fboxmodel.decorators.AbstractBoxDecorator;
    import com.flashartofwar.fboxmodel.decorators.BackgroundColorDecoratorTest;
    import com.flashartofwar.fboxmodel.decorators.BackgroundImageDecoratorTest;
    import com.flashartofwar.fboxmodel.decorators.BorderDecoratorTest;
    import com.flashartofwar.fboxmodel.decorators.PaddingDecoratorTest;
    import com.flashartofwar.fboxmodel.display.AncestorSpriteTest;
    import com.flashartofwar.fboxmodel.renderers.BoxModelRendererTest;

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class FBoxModelTestSuite
    {
        public var test1:AbstractBackgroundDecoratorTest;
        /*public var test2:AbstractBoxDecorator;*/
        public var test3:BackgroundColorDecoratorTest;
        /*public var test4:BackgroundImageDecoratorTest;
        public var test5:BorderDecoratorTest;
        public var test6:PaddingDecoratorTest;
        public var test7:AncestorSpriteTest;
        public var test8:BoxModelRendererTest;*/
        public var test9:FBoxModelTest;
    }
}