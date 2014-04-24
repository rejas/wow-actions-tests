package test.wowactions
{
	import com.wowactions.characters.Character;
	import com.wowactions.characters.CharacterService;
	import com.wowactions.data.Region;
	import com.wowactions.events.WowActionsEvent;
	
	import flexunit.framework.Assert;
	
	import mx.controls.Alert;
	
	import org.flexunit.async.Async;
	
	public class CharacterServiceTest
	{
		private var charService:CharacterService;
		private var char:Character;
		private var errorType:String;
		
		[Before( async )]
		public function setUp():void
		{
			charService = new CharacterService(Region.EUROPE, "khazgoroth");
			charService.getCharacterData("ghorinchai");
			
			charService.addEventListener(WowActionsEvent.CHARACTER_INFO_RETRIEVED, onInfoRetrieved);
			charService.addEventListener(WowActionsEvent.DATA_ERROR, onErrorRetrieved);
			
			Async.proceedOnEvent(this, charService, WowActionsEvent.CHARACTER_INFO_RETRIEVED, 1000);
		}
		
		private function onInfoRetrieved(ev:WowActionsEvent):void
		{
			char = ev.data;
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
		public function testCharacterService():void
		{
			Assert.assertNotNull(charService, "CharacterService is Null");
		}
		
		[Test]
		public function testGetCharacterData():void
		{			
			Assert.assertNotNull(char, "Character is Null");
		}
	}
}