package test.wowactions
{
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.realms.Realm;
	import com.wowactions.realms.RealmService;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class RealmServiceTest
	{
		private var realmService:RealmService;
		private var realm:Realm;
		private var errorType:String;
		
		[Before( async )]
		public function setUp():void
		{
			realmService = new RealmService(Region.EUROPE);
			realmService.getRealms(["khazgoroth"]);
			
			realmService.addEventListener(WowActionsEvent.REALMS_RETRIEVED, onInfoRetrieved);
			realmService.addEventListener(WowActionsEvent.DATA_ERROR, onErrorRetrieved);
			
			Async.proceedOnEvent(this, realmService, WowActionsEvent.REALMS_RETRIEVED, 1000);
		}
		
		private function onInfoRetrieved(ev:WowActionsEvent):void
		{
			realm = ev.data[0];
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
		public function testRealmService():void
		{
			Assert.assertNotNull(realmService, "RealmService is Null");
		}
		
		[Test]
		public function testGetRealmData():void
		{			
			Assert.assertNotNull(realm, "Realm is Null");
		}
	}
}