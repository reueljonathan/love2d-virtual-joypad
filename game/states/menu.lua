local menu = {}

	function menu.mousereleased(x, y, btn)
		if x < 101 and y < 101 then
			SM.go('gameplay')
		end
	end

	function menu.update(t)

	end

	function menu.draw()
		lg.print('MENU', 100, 100)
	end

return menu