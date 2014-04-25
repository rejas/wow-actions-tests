package test.wowactions.guilds
{
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.guilds.Guild;
	import com.wowactions.guilds.GuildService;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class GuildTest
	{
		private static var guildService:GuildService;
		private static var guild:Guild;
		
		[BeforeClass (async)]
		public static function setUpBeforeClass():void
		{
			guildService = new GuildService(Region.EUROPE, "Khaz'goroth");
			guildService.getGuildInfo("Mokrah Toktok", GuildService.ACHIEVEMENTS, GuildService.MEMBERS, GuildService.NEWS, GuildService.CHALLENGE);
			
			guildService.addEventListener(WowActionsEvent.GUILD_INFO_RETRIEVED, onInfoRetrieved);
			guildService.addEventListener(WowActionsEvent.DATA_ERROR, onErrorRetrieved);
			Async.proceedOnEvent(GuildTest, guildService, WowActionsEvent.GUILD_INFO_RETRIEVED, 1000);
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
		public function testGet_battleGroup():void
		{
			Assert.assertEquals(guild.battleGroup, "Reckoning / Abrechnung");
		}
		
		[Test]
		public function testGet_faction():void
		{
			Assert.assertEquals(guild.faction, "Horde");
		}
		
		[Test]
		public function testGetCompletedAchievements():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetIncompleteAchievements():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMember():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMembersAboveLevel():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMembersAtLevel():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMembersBelowLevel():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMembersBetweenLevels():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMembersByCharacterClass():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMembersByRace():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGuild():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_level():void
		{
			Assert.assertEquals(guild.level, 25);
		}
		
		[Test]
		public function testGet_members():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_name():void
		{
			Assert.assertEquals(guild.name, "Mokrah Toktok");
		}
		
		[Test]
		public function testGet_numMembers():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_realm():void
		{
			Assert.assertEquals(guild.realm, "Khaz'goroth");
		}
		
		[Test]
		public function testToString():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		//
		// PRIVATE METHODS
		//
		
		private static function onInfoRetrieved(ev:WowActionsEvent):void
		{
			guild = ev.data;
		}
		
		private static function onErrorRetrieved(ev:WowActionsEvent):void
		{
			Assert.fail("Error retrieved getting guild info: " + ev.type);
		}
	}
}