local Input = {}

	local lg = love.graphics

	function Input:new(x, y, width, height)
		local i = {}
		setmetatable(i, self)
		self.__index = self

		i.x = x
		i.y = y
		i.width = width
		i.height = height
		return i
	end

	function Input:resize(w, h)
	end

	function Input:keypressed(key)
		if self.focus and key == 'backspace' and self.text and self.text ~= '' then
			self.text = self.text:sub(1, self.text:len()-1)
		end
	end
	function Input:textinput(text)
		print(text)
		if self.focus then
			self.text = (self.text or '') .. text
		end
	end

	function Input:mousepressed(x, y, btn, isTouch)
		if self.focus then
		end
	end

	function Input:mousereleased(x, y)
		if not self.focus and x > self.x and x < self.x + self.width and 
			y > self.y and y < self.y + self.height then

			self.focus = true
			love.keyboard.setTextInput(true)
		else
			self.focus = false
		end
	end

	function Input:draw()
		if self.focus then
			lg.setColor(255, 255, 255)
		else
			lg.setColor(100,100,100)
		end

		lg.rectangle('fill', self.x, self.y, self.width, self.height)
		
		lg.setColor(0,0,0)
		if self.text then lg.print(self.text, self.x + 5, self.y + 5) end


	end

	function Input:getText()
		return self.text
	end

return Input