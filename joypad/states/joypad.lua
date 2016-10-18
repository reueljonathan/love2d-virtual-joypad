local joypad = {}

local socket = require('socket')
local address, port = '192.168.137.1', 12345
local udp = socket.udp()
local msg
local response
local data
local playerIndex


function getRotation(x, y, rx, ry)
	if x > rx then
		if y > ry then
			return math.atan2(y-ry, x-rx)
		else
			return 2*math.pi - math.atan2(ry-y, x-rx)
		end
	else
		if y > ry then
			return math.pi - math.atan2(y-ry, rx-x)
		else
			return math.pi + math.atan2(ry-y, rx-x)
		end
	end
end

function joypad.quit()
	udp:send('D ' .. playerIndex)
end

function joypad.mousereleased(x, y, btn, isTouch)
	if x > 240 and playerIndex then
		udp:send('s ' .. playerIndex)
	end
end


function joypad.load(params)
	udp:settimeout(0)
	udp:setpeername(params.address, --[[params.]]port)
	udp:send('C ' .. params.nickname)
end

function joypad.update(t)
	local x, y = love.mouse.getPosition()
	if love.mouse.isDown(1) and x < 240 and playerIndex then		
		local rotation = getRotation(x, y, 120, 120) * 100
		udp:send("r " .. rotation .. ' ' .. playerIndex)
	end

	repeat
		data, msg_or_ip, port_or_nil = udp:receive()

		if data then
			local cmd, val = data:match('(%a) (%d+)')

			if cmd == 'i' then
				playerIndex = val
			end
			response = data
		end
	until not data
end

function joypad.draw()
	lg.print('No estado joypad! =)')

	local x, y = love.mouse.getPosition()
	if love.mouse.isDown(1) and x < 240 then
		love.graphics.circle("fill", x, y, 20, 6)
	else
		love.graphics.circle("fill", 120, 120, 20, 6)
	end


	if response and playerIndex then
		love.graphics.print( response .. ', your index is ' .. playerIndex, 160, 120)
	end
end

return joypad