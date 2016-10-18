import format.starling.Data;
import format.starling.Reader;

class Main {
	public static function main() {
		var atlas = new Reader(Xml.parse(haxe.Resource.getString('test-sheet'))).read();
		trace('${atlas.subTextures.get("hello/world")}');
		trace('${atlas.subTextures.get("basic-button/active")}');
	}
}
