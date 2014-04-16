package test.wowactions.characters
{
	import flexunit.framework.Assert;
	
	public class CharacterTest
	{		
		private var count:int = 0;     
		
		[Before]
		public function setUp():void
		{
			count = 10;
		}
		
		[Test] 
		public function subtraction():void {
			Assert.assertEquals(8, count-2);  
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testGet_achievementPoints():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_arenaTeams():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_averageItemLevel():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_battlegrounds():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_mounts():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_personalRbgRating():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_pets():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_thumbnail():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_totalHonorableKills():void
		{
			Assert.fail("Test method Not yet implemented");
		}
	}
}