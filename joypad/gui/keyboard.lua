local Keyboard = {}
	
	local letters = {
		{'q','w','e','r','t','y','u','i','o','p'},
		{'a','s','d','f','g','h','j','k','l'},
		{'z','x','c','v','b','n','m'}
	}

	local wid, hei = love.graphics.getDimensions()

	function Keyboard:new(input)
		local k = {}
		setmetatable(k, self)
		self.__index = self
		k.input = input
		return k
	end

	function Keyboard:mousepressed(x, y)
		if y > hei-50 then
			local index = math.ceil( x*10 /wid )
			self.input:textinput(letters[1][index])
		end
	end

	function Keyboard:update(t)

	end

	function Keyboard:pressed(y)
		return y > hei-50
	end

	function Keyboard:resize(w, h)
		wid, hei = w, h
	end

	function Keyboard:draw()
		for i=1, #letters[1] do
			love.graphics.print(letters[1][i], 0.1*(i-1)*wid, hei-50)
		end
		for i=1, #letters[2] do
			love.graphics.print(letters[2][i], 0.05*wid + 0.1*(i-1)*wid, hei-25)
		end

		for i=1, #letters[3] do
			love.graphics.print(letters[3][i], 0.1*i*wid, hei-10)
		end
	end
return Keyboard