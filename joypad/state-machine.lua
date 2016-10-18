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
		if current.mousereleased then
			current.mousereleased(x, y, btn, isTouch)
		end
	end

	function SM.mousepressed(x, y, btn, isTouch)
		if current.mousepressed then
			current.mousepressed(x, y, btn, isTouch)
		end
	end

	function SM.textinput(text)
		if current.textinput then
			current.textinput(text)
		end
	end

	function SM.keypressed(key)
		if current.keypressed then
			current.keypressed(key)
		end
	end

	function SM.keyreleased(key)
		if current.keyreleased then
			current.keyreleased(key)
		end
	end

	function SM.resize(w, h)
		print(2)
		if current.resize then
			print(3)
			current.resize(w, h)
		end
	end

	function SM.go(name, params)
		if name then
			current = states[name]
			current.load(params)
		end
	end

	function SM.update(dt)
		current.update(dt)
	end

	function SM.draw(dt)
		current.draw(dt)
	end

	function SM.quit()
		if current.quit then
			current.quit()
		end
	end
return SM