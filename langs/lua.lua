--[[

LUA LANGUAGE REFERENCE

- The official Programming in Lua book is freely available online:
    https://www.lua.org/pil/contents.html
- Lua docs:
    https://www.lua.org/docs.html
- Reference Manual (really long page with everything)
    https://www.lua.org/manual/5.4/manual.html#9
- Also, neovim-specific lua information:
    https://neovim.io/doc/user/lua.html or do `:help lua`
- also see
    https://learnxinyminutes.com/docs/lua/
- sample style guide
    https://github.com/luarocks/lua-style-guide

# Installation
    - search your package manager for lua.
    - then you can run the `lua` command for a repl or run `lua <filename>`.
    - to run a file and then load into the repl, run lua with the -i flag.
    - to run literal code instead of code from a file, use the -e flag
    - to execute a file from within lua, use the dofile("myfile.lua") function


Note that you can run yanked lua code directly within nvim with :lua
and then pressing ctrl+r 0 to select the "previously yanked text" register

# Reserved keywords
    and       break     do        else      elseif
    end       false     for       function  if
    in        local     nil       not       or
    repeat    return    then      true      until
    while

--]]

-- important stuff to note
-- 'false' and 'nil' are the only falsy values. everything else is truthy.

-- lol, closing comments are valid even if there is no matching opening comment
--]]

-- semicolons are optional
print 'parentheses are optional for functions requiring exactly 1 string or table literal';

-- functions are first-class
function mySuperFunnerFunction(args) end

mySuperFunFunction = function(args) end

-- string concatentation uses ..
local myname = "sam"
local myname2 = myname .. "kablammy"

-- when combining strings and numbers, it will try to coerce one to the other.
-- however, you should use tonumber() and tostring() for clarity.
-- on lua styling, you might want to use snake_case for functions and PascalCase
-- for methods as in C#


--[[
# Scopes (lua is weird #1)
anything declared at the top level of a file is global (not surprising).
here's the crazy part: anything not local is global. global is default.
(but you CAN define a local that overwrites a global of the same name).
you can see all the global stuff using the _G table.
long story short, always use 'local' unless you have a reason to make a global.
--]]

outmostScope = 1000
function demonstrateScopes()
    local outmostScope = 500   -- overwrite global outmostScope
    local outerScope1 = 10
    outerScope2 = 20           -- once run, this var is added to the global scope
    function innerFunction()
        local innerScope1 = 30 -- will be nil anywhere outside of innerFunction
        innerScope2 = 40       -- once run, this var is added to the global scope!
    end

    print(outmostScope) -- 500
    print(outerScope1)  -- 10
    print(outerScope2)  -- 20
    print(innerScope1)  -- nil
    print(innerScope2)  -- nil
    -- RUNNING THE INNER FUNCTION CHANGES THE OUTCOME!!!
    innerFunction()
    print(outmostScope) -- 500
    print(outerScope1)  -- 10
    print(outerScope2)  -- 20
    print(innerScope1)  -- nil
    print(innerScope2)  -- 40
end

demonstrateScopes()

-- print(outmostScope) -- 1000
-- print(outerScope1)  -- nil
-- print(outerScope2)  -- 20
-- print(innerScope1)  -- nil
-- print(innerScope2)  -- 40

local showTypeInfo = function(arrrg)
    print(tostring(arrrg) .. " is of type " .. type(arrrg))
end

function demonstrateScopes()
    print '----- DATA TYPES -----'

    -- lua is dynamically typed
    changeMe = 10
    changeMe = "howdy"

    showTypeInfo(nil)           --> nil
    showTypeInfo(true)          --> boolean
    showTypeInfo("Hello world") --> string
    showTypeInfo(myname)        --> string
    showTypeInfo(10.4 * 3)      --> number
    showTypeInfo(print)         --> function
    showTypeInfo(type)          --> function
end

-- Any arguments you forget to pass are received as nil.
-- Extra arguments are ignored.
showTypeInfo("howdy howdy", "this string should be ignored")

local longstring = [[
multiline string
(it is long and stringy)
]]

-- note that loops include both end points
function fizzbuzz(n)
    for i = 1, n, 1 do
        if i % 15 == 0 then
            print "fizzbuzz"
        elseif i % 3 == 0 then
            print "fizz"
        elseif i % 5 == 0 then
            print "buzz"
        else
            print(i)
        end
    end
end

-- print "fizzing..."
-- fizzbuzz(15)

local function demonstrateTables()
    local newtable = {}
    newtable["apple"] = 10
    print(newtable["apple"])

    -- 'othertable' now references the same underlying table as 'newtable'
    local othertable = newtable
    othertable["orange"] = 20

    -- assigning 'nil' frees a variable. GC'll get it.
    -- 'newtable' now loses access to the table. 'othertable' is the sole owner.
    newtable = nil

    local person = {
        name = "sam"
    }
    print(person.name)

    -- when iterating over a table, you need to specify how your table is
    -- structured. should it be treated like a dict or like a list?
    local list = { 5, 10, 15, 20, 25 }
    for i in ipairs(list) do print(i) end
    local dict = { a = 1, b = 2, c = 3 }
    for k, v in pairs(dict) do print(k, v) end

    -- when working with tables, use the built-in 'table' library.
    table.insert(person, 69)
    table.insert(person, -1, 69)
    table.sort(person)

    -- manual iteration over tables:
    local mylist = { 1, 2, 3, 4 }
    -- (yes, it starts at 1. # is the 'length' operator)
    for i = 1, #mylist do
        print(mylist[i])
    end
end

local function demonstrateOop()
    -- a key difference between something like java's objects and lua's tables
    -- is this:
    -- in java, methods are aware of context. an instance of Foo has access to
    -- Foo's instance variables.
    -- in lua, functions do not have any such context. you might put the bar()
    -- function inside of the foo table, but the function doesn't know this.
    -- this means that in order to do "OOP" in lua, any methods you write need
    -- to be told which "object" they are a part of. the conventional way to do
    -- this is to always pass in a reference to the table itself as the first
    -- argument to any "methods" you write. example:
    local my_stack = {
        -- ...[other instance variables and other methods]...
        underlying_array = {},
        push = function(self, data)
            -- this is wrong! 'underlying_array' exists in a different scope
            -- than the 'push' function!
            -- table.insert(underlying_array, data) -- WRONG!
            table.insert(self.underlying_array, data) -- hooray!
        end,
    }
    -- we can call this push "method" like this:
    my_stack.push(my_stack, 69)
    -- ...but it can be annoying to retype the variable "my_stack" all the time.
    -- so, lua introduces the : operator that condenses this "method" call
    my_stack:push(69)
end
