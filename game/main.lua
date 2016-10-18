-- global variables to store love modules --
lg = love.graphics
la = love.audio

-- state machine --
SM = require 'state-machine'

function love.mousereleased(x, y, btn, isTouch)
	print('main mousereleased')
	SM.mousereleased(x, y, btn, isTouch)
end

function love.keyreleased(key)
	SM.keyreleased(key)
end

function love.load()
	SM.add(    'menu',     'states.menu')
	SM.add('gameplay', 'states.gameplay', true)
end

function love.update(t)
	SM.update(t)
end

function love.draw()
	SM.draw()
end