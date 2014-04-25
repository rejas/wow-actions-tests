package test.wowactions.characters
{
	import com.wowactions.characters.Character;
	import com.wowactions.characters.CharacterService;
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	
	public class CharacterServiceTest
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
			
			Async.proceedOnEvent(CharacterServiceTest, charService, WowActionsEvent.CHARACTER_INFO_RETRIEVED, 1000);
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
		public function testCharacterService():void
		{
			Assert.assertNotNull(charService, "CharacterService is Null");
		}
		
		[Test]
		public function testGetCharacterData():void
		{			
			Assert.assertNotNull(char, "Character is Null");
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