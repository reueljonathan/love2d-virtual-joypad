-- global variables to store love modules --
lg = love.graphics
la = love.audio
lk = love.keyboard

-- state machine --
SM = require 'state-machine'

function love.load()
	
	SM.add('connect', 'states.connect', true)
	SM.add( 'joypad', 'states.joypad')
end

function love.quit()
	SM.quit()
end

function love.resize(w, h)
	print(1)
	SM.resize(w, h)
end

-- function love.mousepressed(x, y)
	-- local rotation = 6.28
	-- udp:send("r " .. rotation)
-- end

function love.mousereleased(x, y, btn, isTouch)
	-- if x > 240 and playerIndex then
	-- 	udp:send('s ' .. playerIndex)
	-- end

	SM.mousereleased(x, y, btn, isTouch)
end

function love.mousepressed(x, y, btn, isTouch)
	SM.mousepressed(x, y, btn, isTouch)
end

function love.keypressed(key)
	SM.keypressed(key)
end

function love.keyreleased(key)
	SM.keyreleased(key)
end

function love.textinput(text)
	-- print(text)
	SM.textinput(text)
end

function love.update(t)
	SM.update(t)
end

function love.draw()
	SM.draw()
end