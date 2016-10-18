package format.starling;

import format.starling.Data;

class Reader {
	var xml : Xml;

	public function new( xml : Xml ) this.xml = xml;

	public function read() : TextureAtlas {
		var root = xml.firstElement();

		if (root.nodeName != 'TextureAtlas') {
			throw 'not a starling texture atlas';
		}

		return {
			imagePath : root.get('imagePath'),
			width : _int(root, 'width'),
			height : _int(root, 'height'),
			subTextures : [
				for (e in root.elements())
					if (e.nodeName == 'SubTexture')
						e.get('name') => mapSubTexture(e)
			],
		}
	}

	inline function mapSubTexture( xml : Xml ) : SubTexture {
		return {
			x : _int(xml, 'x'),
			y : _int(xml, 'y'),
			width : _int(xml, 'width'),
			height : _int(xml, 'height'),
			frameX : _int(xml, 'frameX'),
			frameY : _int(xml, 'frameY'),
			frameWidth : _int(xml, 'frameWidth'),
			frameHeight : _int(xml, 'frameHeight'),
			rotated : xml.get('rotated') == 'true',
		}
	}

	inline function _int( xml : Xml, attribute : String ) return Std.parseInt(xml.get(attribute));
}
