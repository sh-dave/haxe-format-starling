# haxe-format-starling

## use it at compile time
```xml
	...
    <SubTexture name="hello/world" x="16" y="16" width="32" height="32"/>
    <SubTexture name="basic-button/active" x="64" y="64" width="128" height="32"/>
	...
```

```haxe
import format.starling.Data;

class MySheets {
	public static var ui = new UiSheet();
	public static var chars = new CharactersSheet();
}

@:build(format.starling.macro.SheetBuilder.build('somepath/ui-sheet.xml'))
class UiSheet {}

@:build(format.starling.macro.SheetBuilder.build('somepath/characters-sheet.xml'))
class CharactersSheet {}
```

```haxe

class MyGame {
	public function init() {
		trace(MySheets.ui.hello_world);
		trace(MySheets.ui.basic_button_active);		
	}
}
```

## or at runtime
```haxe
class MyGame {
	public function init() {
		var atlasXml = '... get the xml somehow...'; 
		var atlas = new format.starling.Reader(atlasXml).read();

		trace(atlas.subtextures.get('hello/world'));
		trace(atlas.subtextures.get('basic-button/active'));
	}
}
```
