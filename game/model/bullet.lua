local Bullet = {}

local velocity = 5
local bulletImg = lg.newImage('assets/img/bullet.png')

function Bullet:new()
	local b = {}
	setmetatable(b, self)
	self.__index = self
	return b
end

function Bullet:shoot(x, y, rotation)
	print('Bullet shoot')
	self.x, self.y, self.rotation = x, y, rotation
	self.moving = true
end

function Bullet:update(t)
	if self.moving then
		self.x = self.x + ( math.cos(self.rotation) * velocity)
		self.y = self.y + ( math.sin(self.rotation) * velocity)

		-- improve later
		if self.x < 0 or self.x > lg.getWidth()
			or self.y < 0 or self.y > lg.getHeight() then
			self.moving = false
		end
	end
end

function Bullet:draw()
	if self.moving then
		lg.draw(bulletImg, self.x, self.y, self.rotation, 1, 1, 3, 3)
	end
end

return Bullet