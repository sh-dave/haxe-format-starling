package format.starling;

import haxe.ds.Option;
import format.starling.Data;

class XmlReader {
	public static function read( xml: Xml ) : Option<TextureAtlas> {
		var root = xml.firstElement();

		if (root.nodeName != 'TextureAtlas') {
			return None;
		}

		return Some({
			imagePath : root.get('imagePath'),
			width : _int(root, 'width'),
			height : _int(root, 'height'),
			subTextures : [
				for (e in root.elements())
					if (e.nodeName == 'SubTexture')
						e.get('name') => mapSubTexture(e)
			],
		});
	}

	static inline function mapSubTexture( xml: Xml ) : SubTexture {
		return {
			x: _int(xml, 'x'),
			y: _int(xml, 'y'),
			width: _int(xml, 'width'),
			height: _int(xml, 'height'),
			frameX: _int(xml, 'frameX'),
			frameY: _int(xml, 'frameY'),
			frameWidth: _int(xml, 'frameWidth'),
			frameHeight: _int(xml, 'frameHeight'),
			rotated: xml.get('rotated') == 'true',
		}
	}

	static inline function _int( xml: Xml, attribute: String )
		return Std.parseInt(xml.get(attribute));
}
