package format.starling;

typedef SubTexture = {
	x : Int,
	y : Int,
	width : Int,
	height : Int,
	?frameX : Int,
	?frameY : Int,
	?frameWidth : Int,
	?frameHeight : Int,
	?rotated : Bool,
}

typedef TextureAtlas = {
	imagePath : String,
	width : Int,
	height : Int,
	subTextures : Map<String, SubTexture>,
}
