package test.wowactions.guilds
{
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.guilds.Guild;
	import com.wowactions.guilds.GuildService;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class GuildServiceTest
	{
		private static var guildService:GuildService;
		private static var guild:Guild;
		
		[BeforeClass (async)]
		public static function setUpBeforeClass():void
		{
			guildService = new GuildService(Region.EUROPE, "khazgoroth");
			guildService.getGuildInfo("Mokrah Toktok");
			
			guildService.addEventListener(WowActionsEvent.GUILD_INFO_RETRIEVED, onInfoRetrieved);
			guildService.addEventListener(WowActionsEvent.DATA_ERROR, onErrorRetrieved);
			
			Async.proceedOnEvent(GuildServiceTest, guildService, WowActionsEvent.GUILD_INFO_RETRIEVED, 1000);
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
		public function testGuildService():void
		{
			Assert.assertNotNull(guildService, "GuildService is Null");
		}
		
		[Test]
		public function testGetGuildData():void
		{			
			Assert.assertNotNull(guild, "Guild is Null");
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