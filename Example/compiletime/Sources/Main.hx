import format.starling.Data.SubTexture;

class Main {
	public static function main() {
		trace('${Assets.test.hello_world}');
		trace('${Assets.test.basic_button_active}');
	}
}

private class Assets {
	public static var test = new TestSheet();
}

@:build(format.starling.macro.SheetBuilder.build('sheets/test.xml', true))
private class TestSheet {}
