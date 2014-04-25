package test.wowactions.realms
{
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	import com.wowactions.realms.Realm;
	import com.wowactions.realms.RealmService;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class RealmServiceTest
	{
		private static var realmService:RealmService;
		private static var realm:Realm;
		
		[BeforeClass (async)]
		public static function setUpBeforeClass():void
		{
			realmService = new RealmService(Region.EUROPE);
			realmService.getRealms(["khazgoroth"]);
			
			realmService.addEventListener(WowActionsEvent.REALMS_RETRIEVED, onInfoRetrieved);
			realmService.addEventListener(WowActionsEvent.DATA_ERROR, onErrorRetrieved);
			
			Async.proceedOnEvent(RealmServiceTest, realmService, WowActionsEvent.REALMS_RETRIEVED, 1000);
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
		public function testRealmService():void
		{
			Assert.assertNotNull(realmService, "RealmService is Null");
		}
		
		[Test]
		public function testGetRealmData():void
		{			
			Assert.assertNotNull(realm, "Realm is Null");
		}
		
		//
		// PRIVATE METHODS
		//
		
		private static function onInfoRetrieved(ev:WowActionsEvent):void
		{
			realm = ev.data[0];
		}
		
		private static function onErrorRetrieved(ev:WowActionsEvent):void
		{
			Assert.fail("Error retrieved getting realm info: " + ev.type);
		}
	}
}