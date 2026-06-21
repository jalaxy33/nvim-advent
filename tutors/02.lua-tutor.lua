-- lua-tutor.lua

--
-- 01. Comments
--

-- This is a comment. It starts with two dashes

--[[ This is also
	a comment.

	But this spans multiple lines!
--]]

--
-- 02. Variables: Simple Literals
--
local number = 5

local string = "hello world"
local single = "also works"
local crazy = [[ This 
  is multi line and Literal ]]

local truth, lie = true, false

local nothing = nil

--
-- 03. Variables: Functions
--
local function hello(name)
	print("Hello!", name)
end

local greet = function(name)
	-- .. is string concatenation
	print("Greeings, " .. name .. "!")
end

-- function return the other function
local higher_order = function(value)
	return function(another)
		return value + another
	end
end

local add_one = higher_order(1)
print("add_one(2) ->", add_one(2))

--
-- 04. Variables: Tables
--
-- Lua's only data structure. Same structure is used for maps & lists

-- As a list
local list = {
	"first",
	2,
	false,
	function()
		print("Fourth!")
	end,
}
print("Yup, 1-indexed:", list[1])
print("Fourth is 4...", list[4]())

-- As a map
local t = {
	literal_key = "a string",
	["an expression"] = "also works",
	[function() end] = true,
}

print("literal_key   :", t.literal_key)
print("an expression :", t["an expression"])
print("function() end:", t[function() end])

--
-- 05. Control Flow: `for`
--

-- For list
local favorite_accounts = { "user1", "user2", "uzer3" }

-- `#` is the length operator
for index = 1, #favorite_accounts do
	print(index, favorite_accounts[index])
end

-- `ipairs` is kinda like `enumerate` in python
for index, value in ipairs(favorite_accounts) do
	print(index, value)
end

-- For map
local reading_records = { user1 = 10, user2 = "N/A" }

-- length of map is 0, so nothing/error happens below
--
--    for index = 1, #reading_record do
--      print(reading_scores[index])
--    end

-- iterate map with `pairs`
for key, value in pairs(reading_records) do
	print(key, value)
end

--
-- 06. Control Flow: `if`
--
local function action(loves_coffee)
	if loves_coffee then
		print("it's truthy")
	else
		print("it's falsey")
	end
end

-- "falsey": nil, false
action() -- Same as: action(nil)
action(false)

-- Everything else is "truthy"
action(true)
action(0)
action({})

--
-- 07. Modules
--
-- Modules are just returns of files!

-- load module from 'example-modules/foo.lua'
local foo = require("example-modules.foo")
foo.cool_function()

-- NOTE: you could only load lua modules inside the runtime paths
-- You could check runtime path by
--    :echo nvim_list_runtime_paths()

--
-- 08. Functions: Multiple Returns
--
local returns_four_values = function()
	return 1, 2, 3, 4
end

first, second, last = returns_four_values()

print("first: ", first)
print("second:", second)
print("last:  ", last)
-- the `4` is discarded

-- `...` represents variable amount of arguments
local variable_arguments = function(...)
	local arguments = { ... }
	for i, v in ipairs({ ... }) do
		print(i, v)
	end
	return unpack(arguments)
end

print("=====================")
print("1:", variable_arguments("hello", "world", "!"))
print("=====================")
-- only one output slot
print("2:", variable_arguments("hello", "world", "!"), "<lost>")

--
-- 09. Functions: Calling
--

-- String Shorthand
local single_string = function(s)
	return s .. " - WOW!"
end

local x = single_string("hi")
-- if only one literal argument
local y = single_string("hi")
print(x, y)

-- Table Shorthand
--
-- Emulate default/option values in lua function
local setup = function(opts)
	if opts.default == nil then
		opts.default = 17
	end

	print(opts.default, opts.other)
end

setup({ default = 12, other = false })
setup({ other = true })

--
-- 10. Functions: Colon Functions
--
-- `:` is syntax sugar for `.` and `self`

local MyTable = {}

-- equivalent
function MyTable.something(self, ...) end
function MyTable:something(...) end

--
-- 11. Metatables
--
-- Metatables describe or change behaviors of table

-- define "add" operation via `__add`
local vector_mt = {}
vector_mt.__add = function(left, right)
	return setmetatable({
		left[1] + right[1],
		left[2] + right[2],
		left[3] + right[3],
	}, vector_mt)
end

local v1 = setmetatable({ 3, 1, 5 }, vector_mt)
local v2 = setmetatable({ -3, 2, 2 }, vector_mt)
local v3 = v1 + v2 -- use add op we define
vim.print(v3[1], v3[2], v3[3])
vim.print(v3 + v3)

-- define "indexing" operation via `__index`
local fib_mt = {
	__index = function(self, key)
		-- `self` stores the table that method called on
		if key < 2 then
			return 1
		end
		-- Update the table. to save the intermediate results
		self[key] = self[key - 2] + self[key - 1]
		-- Return the result
		return self[key]
	end,
}

-- `self` in method is actually the `{}` table below
local fib = setmetatable({}, fib_mt)

print(fib[5]) -- use indexing op we define
print(fib[1000])

-- Other notable fields:
--
-- `__newindex(self, key, value)`  ->  override behavior of calling new index, useful for index error handling
-- `__call(self, ...)`  ->  call table as function
