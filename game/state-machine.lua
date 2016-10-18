local SM = {}
	
	local states = {}, initial, current

	function SM.add(name, module, isInitial)
		
		states[name] = require(module)

		if isInitial then
			current = states[name]
			current.load()
		end
	end

	function SM.mousereleased(x, y, btn, isTouch)
		print('SM mousereleased')
		if current.mousereleased then
			current.mousereleased(x, y, btn, isTouch)
		end
	end

	function SM.keyreleased(key)
		if current.keyreleased then
			current.keyreleased(key)
		end
	end

	function SM.go(name)
		if name then
			current = states[name]
			current.load()
		end
	end

	function SM.update(dt)
		current.update(dt)
	end

	function SM.draw(dt)
		current.draw(dt)
	end
return SM