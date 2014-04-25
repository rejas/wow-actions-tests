package test.wowactions.guilds
{
	import com.wowactions.characters.CharacterClassData;
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.guilds.Guild;
	import com.wowactions.guilds.GuildService;
	import com.wowactions.races.RaceData;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class GuildTest
	{
		private static var guildService:GuildService;
		private static var guild:Guild;
		
		[BeforeClass (async)]
		public static function setUpBeforeClass():void
		{
			guildService = new GuildService(Region.EUROPE, "Razuvious");
			guildService.getGuildInfo("КрашТест", GuildService.ACHIEVEMENTS, GuildService.MEMBERS, GuildService.NEWS, GuildService.CHALLENGE);
			
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
			Assert.assertEquals(guild.achievementPoints, 2630);
		}
		
		[Test]
		public function testGet_achievements():void
		{
			Assert.assertTrue(guild.achievements.length > 0);
		}
		
		[Test]
		public function testGet_battleGroup():void
		{
			Assert.assertEquals(guild.battleGroup, "Sturmangriff / Charge");
		}
		
		[Test]
		public function testGet_faction():void
		{
			Assert.assertEquals(guild.faction, RaceData.FACTION_ALLIANCE);
		}
		
		[Test]
		public function testGetCompletedAchievements():void
		{
			Assert.assertEquals(guild.getCompletedAchievements().length, 259);
		}
		
		[Test]
		public function testGetIncompleteAchievements():void
		{
			Assert.assertEquals(guild.getIncompleteAchievements().length, 0);
		}
		
		[Test]
		public function testGetMember():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGetMembersAboveLevel():void
		{
			Assert.assertEquals(guild.getMembersAboveLevel(100, false).length, 0);
			Assert.assertTrue(guild.getMembersAboveLevel(0, false).length > 0);
		}
		
		[Test]
		public function testGetMembersAtLevel():void
		{
			Assert.assertEquals(guild.getMembersAtLevel(0).length, 0);
			Assert.assertEquals(guild.getMembersAtLevel(100).length, 0);
			Assert.assertTrue(guild.getMembersAtLevel(90).length > 0);
		}
		
		[Test]
		public function testGetMembersBelowLevel():void
		{
			Assert.assertEquals(guild.getMembersBelowLevel(0, false).length, 0);
			Assert.assertTrue(guild.getMembersBelowLevel(100, false).length > 0);
		}
		
		[Test]
		public function testGetMembersBetweenLevels():void
		{
			Assert.assertEquals(guild.getMembersBetweenLevels(0, 0).length, 0);
			Assert.assertTrue(guild.getMembersBetweenLevels(0, 100).length > 0);
		}
		
		[Test]
		public function testGetMembersByCharacterClass():void
		{
			Assert.assertTrue(guild.getMembersByCharacterClass(CharacterClassData.MONK).length > 0);
		}
		
		[Test]
		public function testGetMembersByRace():void
		{
			Assert.assertTrue(guild.getMembersByRace(RaceData.PANDAREN).length > 0);
			Assert.assertEquals(guild.getMembersByRace(RaceData.ORC).length, 0);
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
			Assert.assertEquals(guild.name, "КрашТест");
		}
		
		[Test]
		public function testGet_numMembers():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testGet_realm():void
		{
			Assert.assertEquals(guild.realm, "Razuvious");
		}
		
		[Test]
		public function testToString():void
		{
			Assert.assertNotNull(guild.toString());
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