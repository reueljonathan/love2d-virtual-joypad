local Ship = {}

local img, pos, rotation,quad = nil, {}, 0
local elapsedTime, framerate = 0, 15/1000
local Bullet = require 'model.bullet'

function Ship:new(nick)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	self.vel = 1
	-- self.rotation = 0
	o.nick = nick
	o.bullets = {
		Bullet:new(),
		Bullet:new(),
		Bullet:new(),
		Bullet:new(),
		Bullet:new()
	}
	o.nextBullet = 1
	return o
end

function Ship:setImage(imgSrc)
	self.img = lg.newImage(imgSrc)
	self.quad = lg.newQuad(0,0,16,16, self.img:getDimensions())
end

-- function Ship.move(x, y)
-- 	pos.x = pos.x + x
-- 	pos.y = pos.y + y
-- end

function Ship:setposition(x, y)
	self.x = x
	self.y = y
end

function Ship:update(t)
	if self.rotation then
		self.x = self.x + ( math.cos(self.rotation) * self.vel)
		self.y = self.y + ( math.sin(self.rotation) * self.vel)
	end

	for i=1, #self.bullets do
		self.bullets[i]:update(t)
	end
end


function Ship:setrotation(r)
	-- print("set rotation " .. r)
	self.rotation = r
end

function Ship:setnick(nick)
	self.nick = nick
end

function Ship:shoot()
	print('Ship mousereleased')
	self.bullets[self.nextBullet]:shoot(self.x, self.y, self.rotation)
	self.nextBullet = self.nextBullet + 1

	if self.nextBullet > #self.bullets then self.nextBullet = 1 end
end

function Ship:draw()
	for i=1, #self.bullets do
		self.bullets[i]:draw()
	end

	love.graphics.draw(self.img, self.quad, self.x, 
		self.y, self.rotation, 1,1, 8,8)
	love.graphics.print(self.nick, self.x - (self.nick:len()/2)*10, self.y + 10)
end

return Ship