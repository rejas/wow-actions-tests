package test.wowactions
{
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.guilds.Guild;
	import com.wowactions.guilds.GuildService;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class GuildServiceTest
	{
		private var guildService:GuildService;
		private var guild:Guild;
		private var errorType:String;
		
		[Before( async )]
		public function setUp():void
		{
			guildService = new GuildService(Region.EUROPE, "khazgoroth");
			guildService.getGuildInfo("Mokrah Toktok");
			
			guildService.addEventListener(WowActionsEvent.GUILD_INFO_RETRIEVED, onInfoRetrieved);
			guildService.addEventListener(WowActionsEvent.DATA_ERROR, onErrorRetrieved);
			
			Async.proceedOnEvent(this, guildService, WowActionsEvent.GUILD_INFO_RETRIEVED, 1000);
		}
		
		private function onInfoRetrieved(ev:WowActionsEvent):void
		{
			guild = ev.data;
		}
		
		private function onErrorRetrieved(ev:WowActionsEvent):void
		{
			trace(ev.type);
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
		public function testGuildService():void
		{
			Assert.assertNotNull(guildService, "GuildService is Null");
		}
		
		[Test]
		public function testGetGuildData():void
		{			
			Assert.assertNotNull(guild, "Guild is Null");
		}
	}
}