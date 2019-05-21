package format.starling;

@:structInit
class SubTexture {
	public var x: Int;
	public var y: Int;
	public var width: Int;
	public var height: Int;
	public var frameX: Int;
	public var frameY: Int;
	public var frameWidth: Int;
	public var frameHeight: Int;
	public var rotated: Bool;
}

@:structInit
class TextureAtlas {
	public var imagePath: String;
	public var width: Int;
	public var height: Int;
	public var subTextures: Map<String, SubTexture>;
}
