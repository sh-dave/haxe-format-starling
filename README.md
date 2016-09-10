# haxe-format-starling

```haxe
function loadAtlasData( atlasXml : Xml ) {
	var atlas = new format.starling.Reader(atlasXml).read();

	for (subtexture in atlas.subtextures) {
		doStuff(...);
	}
}

```
