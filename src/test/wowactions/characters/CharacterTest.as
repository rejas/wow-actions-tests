package test.wowactions.characters
{
	import com.wowactions.characters.Character;
	import com.wowactions.characters.CharacterService;
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class CharacterTest
	{
		private static var charService:CharacterService;
		private static var char:Character;
		
		[BeforeClass (async)]
		public static function setUpBeforeClass():void
		{
			charService = new CharacterService(Region.EUROPE, "Khaz'goroth");
			charService.getCharacterData("Ghorinchai");
			
			charService.addEventListener(WowActionsEvent.CHARACTER_INFO_RETRIEVED, onInfoRetrieved);
			charService.addEventListener(WowActionsEvent.DATA_ERROR, onErrorRetrieved);
			
			Async.proceedOnEvent(CharacterTest, charService, WowActionsEvent.CHARACTER_INFO_RETRIEVED, 1000);
		}
		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		//
		// TEST METHODS
		//
		
		[Test]
		public function testGet_achievementPoints():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_achievements():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_appearance():void
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
		public function testGet_averageItemLevelEquipped():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_battlegrounds():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_characterClass():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_formalName():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_gender():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetRaidProgression():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_guild():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_guildRank():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_level():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testMerge():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_mounts():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_name():void
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
		public function testGet_professions():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_progression():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_race():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_realm():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_reputations():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_selectedTitle():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_stats():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_thumbnail():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_titles():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testToString():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_totalHonorableKills():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		//
		// PRIVATE METHODS
		//
		
		private static function onInfoRetrieved(ev:WowActionsEvent):void
		{
			char = ev.data;
		}
		
		private static function onErrorRetrieved(ev:WowActionsEvent):void
		{
			Assert.fail("Error retrieved getting character info: " + ev.type);
		}
	}
}