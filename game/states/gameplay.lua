local gameplay = {}

-- utils --
local utils = require 'utils'

local socket = require 'socket'
local Ship  = require 'model.ship'
-- local udp = socket.udp()
local data, msg_or_ip, port_or_nil
local msg
local players = {}
local splited
local udp
local updaterate, t = 0.1, 0


function gameplay.mousereleased(x, y, btn, isTouch)
	-- print('gameplay mousereleased')
	-- if #players > 0 then
	-- 	players[1]:shoot()
	-- end
end

function gameplay.load()
	t = 0
	udp = socket.udp()

	udp:settimeout(0)
	udp:setsockname('*', 12345)
	print('love.load()')
end

function gameplay.update(t)
	for i=1, #players do
		players[i]:update(deltatime)
	end

	repeat 
		data, msg_or_ip, port_or_nil = udp:receivefrom()

		if data then 
			msg = data
			print(data, msg_or_ip, port_or_nil)
			splited = utils.split(msg)

			if splited[1] == "C" then
				local ship = Ship:new(splited[2])
				ship:setImage('assets/img/ship.png')
				ship:setposition(math.floor(math.random(200)), 
					math.floor(math.random(200)))
				
				udp:sendto("i " .. #players+1, msg_or_ip, port_or_nil)
				

				players[#players+1] = ship

				print('players: ')
				for k, v in pairs(players) do print(k, v) end


			elseif splited[1] == "r" then
				local r, i = msg:match('r (%d+%.*%d+) (%d+)')
				i = tonumber(i)

				print('messageeee: ' .. msg)
				print('r: ' .. r, 'i: '.. type(i))
				players[i]:setrotation(r/100)
			elseif splited[1] == 'D' then
				local i = msg:match('D (%d+)')
				print('Disconnecting ' .. (i or 'NaN'))
				players[tonumber(i)] = nil
			elseif splited[1] == 's' then
				players[tonumber(splited[2])]:shoot()
			else
				for c in splited do
					if c == "l" then
						players[1]:acel(-1, 0)
					elseif c == "r" then
						players[1]:acel(1, 0)
					elseif c == "u" then
						players[1]:acel(-1, 0)
					end
				end
			end
		end

	until not data
end

function gameplay.draw()
	if #players > 0 then
		for i=1, #players do
			players[i]:draw()
		end
	else
		lg.print('Waiting for players...', 100, 100)
	end
end

return gameplay