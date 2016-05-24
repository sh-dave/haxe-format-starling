package format.starling;

class Reader {
	var xml : Xml;

	public function new( xml : Xml ) {
		this.xml = xml;
	}

	public function read() : Data.TextureAtlas {
		var root = xml.firstElement();

		if (root.nodeName != 'TextureAtlas') {
			throw 'not a starling texture atlas';
		}

		var subTextures = [
			for (e in root.elements())
				if (e.nodeName == 'SubTexture') {
					e.get('name') => {
						x : Std.parseInt(e.get('x')),
						y : Std.parseInt(e.get('y')),
						width : Std.parseInt(e.get('width')),
						height : Std.parseInt(e.get('height')),
						frameX : Std.parseInt(e.get('frameX')),
						frameY : Std.parseInt(e.get('frameY')),
						frameWidth : Std.parseInt(e.get('frameWidth')),
						frameHeight : Std.parseInt(e.get('frameHeight')),
						rotated : e.get('rotated') == 'true',
					}
				}
		];

		return {
			imagePath : root.get('imagePath'),
			width : Std.parseInt(root.get('width')),
			height : Std.parseInt(root.get('height')),
			subTextures : subTextures,
		}
	}
}
