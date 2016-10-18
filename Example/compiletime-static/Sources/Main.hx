import format.starling.Data.SubTexture;

class Main {
	public static function main() {
		trace('${TestSheet.hello_world}');
		trace('${TestSheet.basic_button_active}');
	}
}

@:build(format.starling.macro.SheetBuilder.build('sheets/test.xml', false))
private class TestSheet {}
