tool
extends BitmapFont

export(Texture) var texture = null setget changeTexture
export(String, MULTILINE) var characterMap setget changeMap
export(Vector2) var size setget changeSize
export(int) var extraSpacing = 0 setget changeSpacing
export(bool) var monospace = true setget changeMonospace
export(Array, Dictionary) var customCharacter setget changeCustom

func changeTexture(value):
	texture = value
	if texture:
		update()

func changeMap(value):
	characterMap = value
	update()

func changeSpacing(value):
	extraSpacing = value
	update()

func changeSize(value):
	size = value
	update()

func changeMonospace(value):
	monospace = value
	update()

func changeCustom(value):
	customCharacter = value
	update()

func update():
	clear()
	if texture is Texture:
		add_texture(texture)
		var _characterArray = characterMap.to_utf8()
		for i in _characterArray.size():
			var _rect : Rect2
			var _offsetLeft : int
			var _offsetRight : int
			
			var _customized : bool
			if !customCharacter.empty():
				for _c in customCharacter:
					if _c.has_all(["Unicode", "Position", "Size"]):
						if _c["Unicode"] == _characterArray[i]:
							_rect = Rect2(_c["Position"].x, _c["Position"].y, _c["Size"].x, _c["Size"].y)
							_customized = true
							break
			
			if !monospace and !_customized:
				var data = texture.get_data()
				data.lock()
				
				var _hit : bool
				
				# Left
				for _x in size.x:
					if _hit: break
					for _y in size.y:
						var _px = data.get_pixel(fmod(size.x * i, texture.get_width()) + _x, floor((size.x * i)/texture.get_width()) * size.y + _y)
						if _px.a != 0:
							_hit = true
							_offsetLeft = _x
							break
				_hit = false
				
				# Right
				for _x in size.x:
					if _hit: break
					for _y in size.y:
						var _px = data.get_pixel(fmod(size.x * i, texture.get_width()) + ((size.x - 1) - _x), floor((size.x * i)/texture.get_width()) * size.y + _y)
						if _px.a != 0:
							_hit = true
							_offsetRight = _x
							break
				
				data.unlock()
			
			if !_customized:
				_rect = Rect2(fmod(size.x * i + _offsetLeft, texture.get_width()), floor((size.x * i)/texture.get_width()) * size.y, size.x - (_offsetLeft + _offsetRight), size.y)
			add_char(_characterArray[i], 0, _rect, Vector2.ZERO, _rect.size.x + extraSpacing)
		set_height(size.y)
		update_changes()
