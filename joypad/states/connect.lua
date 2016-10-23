local connect = {}

local Button, Input = require 'gui.button', require 'gui.input'
local connectButton, ipInput, nickInput

function connect.load()
	connectButton = Button:new('connect', 300, 10)
	connectButton:setImage('assets/img/button.png')
	connectButton:setFont()
	connectButton:setCallback(function()
		lk.setTextInput(false)
		SM.go('joypad', {
			address = ipInput:getText() or '192.168.137.1',
			nickname = nickInput:getText()  or 'abacate'
		})
	end)

	ipInput = Input:new(10, 10, 200, 20)
	nickInput = Input:new(10, 50, 200, 20)
end

function connect.mousereleased(x, y, btn, isTouch)
	connectButton:press(x, y)
	ipInput:mousereleased(x, y, btn, isTouch)
	nickInput:mousereleased(x, y, btn, isTouch)
end

function  connect.mousepressed(x, y, btn, isTouch)
	ipInput:mousepressed(x, y)
	nickInput:mousepressed(x, y)
end

function connect.resize(w, y)
	ipInput:resize(w, y)
	nickInput:resize(w, y)
end

function connect.keypressed(key)
	-- if key == 'backspace' then
		ipInput:keypressed(key)
		nickInput:keypressed(key)	
	-- end
end

function connect.textinput(text)
	ipInput:textinput(text)
	nickInput:textinput(text)
end

function connect.update(t)
end

function connect.draw()
	ipInput:draw()
	nickInput:draw()
	connectButton:draw()
end

return connect