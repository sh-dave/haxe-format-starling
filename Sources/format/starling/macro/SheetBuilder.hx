package format.starling.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.Field;
import sys.io.File;

using StringTools;

class SheetBuilder {
	macro public static function build( filename : String, instanced : Bool ) : Array<Field> {
		var fields = Context.getBuildFields();
		var fileContent = File.getContent(Context.resolvePath(filename));
		var atlas = new Reader(Xml.parse(fileContent)).read();
		var subTextures = atlas.subTextures;

		for (id in subTextures.keys()) {
			var st = subTextures.get(id);
			fields.push({
				name : sanitizeId(id),
				kind : FVar(macro : format.starling.Data.SubTexture, macro {
					x : $v{st.x}, y : $v{st.y}, width : $v{st.width}, height : $v{st.height},
					frameX : $v{st.frameX}, frameY : $v{st.frameY}, frameWidth : $v{st.frameWidth}, frameHeight : $v{st.frameHeight},
					rotated : $v{st.rotated} 
				}),
				access : instanced ? [APublic] : [APublic, AStatic],
				pos : Context.currentPos(),
			}); 
		}

		if (instanced) {
			fields.push({
				name : 'new',
				kind : FFun({ ret : null, expr : macro {}, args : [] }),
				access : [APublic],
				pos : Context.currentPos(),
			});
		}

		return fields;
	}

	static inline function sanitizeId( id : String ) return id
		.replace('-', '_')
		.replace(' ', '_')
		.replace('+', '_')
		.replace('.', '_')
		.replace('/', '_')
		.replace(',', '_')
		.replace('\\', '_')
		.replace(';', '_');
}
