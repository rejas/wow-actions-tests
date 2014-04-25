package test.wowactions
{
	import com.wowactions.characters.CharacterClassData;
	import com.wowactions.data.Region;
	import com.wowactions.races.RaceData;

	public class TestCases
	{
		public static var TEST_CHAR:String			= "Хируко";
		public static var TEST_GUILD:String			= "КрашТест";
		public static var TEST_REALM:String			= "Razuvious";
		public static var TEST_BATTLEGROUP:String	= "Sturmangriff / Charge";
		public static var TEST_REGION:String		= Region.EUROPE;
		public static var TEST_FACTION:String		= RaceData.FACTION_ALLIANCE;
		public static var TEST_RACE:String 			= RaceData.PANDAREN;
		public static var TEST_RACE_FALSE:String 	= RaceData.ORC;
		public static var TEST_CLASS:String 		= CharacterClassData.MONK;
	}
}