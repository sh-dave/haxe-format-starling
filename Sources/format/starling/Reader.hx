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

		var subTextures : Map<String, Data.SubTexture> = [
			for (e in root.elements())
				if (e.nodeName == 'SubTexture')
					e.get('name') => mapSubTexture(e)
		];

		return {
			imagePath : root.get('imagePath'),
			width : Std.parseInt(root.get('width')),
			height : Std.parseInt(root.get('height')),
			subTextures : subTextures,
		}
	}

	inline function mapSubTexture( xml : Xml ) : Data.SubTexture {
		return {
			x : Std.parseInt(xml.get('x')),
			y : Std.parseInt(xml.get('y')),
			width : Std.parseInt(xml.get('width')),
			height : Std.parseInt(xml.get('height')),
			frameX : Std.parseInt(xml.get('frameX')),
			frameY : Std.parseInt(xml.get('frameY')),
			frameWidth : Std.parseInt(xml.get('frameWidth')),
			frameHeight : Std.parseInt(xml.get('frameHeight')),
			rotated : xml.get('rotated') == 'true',
		}
	}
}
