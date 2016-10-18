local Button = {}

local lg = love.graphics

function Button:new(text, x, y)
	local b = {}
	setmetatable(b, self)
	self.__index = self


	b.text = text
	b.x = x
	b.y = y

	return b
end

function Button:press(x, y)
	if self.callback and
		x > self.x and x < self.x + self.width and 
		y > self.y and y < self.y + self.height then

		self.callback()
	end
end

function Button:setImage(src)
	if src then
		self.img = lg.newImage(src)
		self.width, self.height = self.img:getDimensions()
	end
end

function Button:setFont(src, glyphs)
	if src then
		self.font = lg.newImageFont(src, glyphs)
	else
		self.font = lg.newFont()
	end
end

function Button:draw()
	lg.setColor(255,255,255)
	lg.draw(self.img, self.x, self.y)
	lg.setFont(self.font)
	lg.print(self.text, self.x, self.y)
end

function Button:setCallback( func )
	self.callback = func
end

return Button