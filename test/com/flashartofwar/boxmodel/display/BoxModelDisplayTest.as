package com.flashartofwar.boxmodel.display {
	import flexunit.framework.Assert;

	public class BoxModelDisplayTest
	{

		
		private var boxModel : BoxModelDisplay;
		
		public function BoxModelDisplayTest()
		{
			
		}
				
		[Test]
		public function testTidy():void
		{
			boxModel = new BoxModelDisplay();
			Assert.assertNotNull(boxModel);
		}
	}
}

