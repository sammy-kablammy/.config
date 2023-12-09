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


-- lol, closing comments are valid even if there is no matching opening comment
--]]

print("in lua, semicolons are optional");;;;
print "parentheses are optional for functions requiring exactly 1 string or table literal"

-- different ways to write functions
-- since 'function' is a type (remember that functions are first-class), you
-- can assign a function to a variable
function mySuperFunnerFunction(arg1, arg2)
    -- stuff
end

mySuperFunFunction = function(arg1, arg2)
    -- stuff
end

--[[
# Variable Scopes
anything declared at the top level of a file is global (not surprising).
here's the crazy part: anything not local is global. global is default.
(but you CAN define a local that overwrites a global of the same name).
you can see all the global stuff using the _G table.
--]]

outmostScope = 1000
function demonstrateScopes()
    local outmostScope = 500 -- overwrite global outmostScope
    local outerScope1 = 10
    outerScope2 = 20         -- once run, this var is added to the global scope
    function innerFunction()
        local innerScope1 = 30
        innerScope2 = 40 -- once run, this var is added to the global scope!
    end

    print(outmostScope) -- 10
    print(outerScope1)  -- 10
    print(outerScope2)  -- 20
    print(innerScope1)  -- nil
    print(innerScope2)  -- nil
    -- RUNNING THE INNER FUNCTION CHANGES THE OUTCOME!!!
    innerFunction()
    print(outmostScope) -- 10
    print(outerScope1)  -- 10
    print(outerScope2)  -- 20
    print(innerScope1)  -- nil
    print(innerScope2)  -- 40
end

--[[
# Data types
--]]

showTypeInfo = function(arrrg)
    print(tostring(arrrg) .. " is of type " .. type(arrrg))
end


-- string concatentation uses ..
myname = "sam"
myname2 = myname .. "kablammy"

-- lua is dynamically typed
changeMe = 10
changeMe = "howdy"

print "----- DATA TYPES -----"

showTypeInfo(nil)           --> nil
showTypeInfo(true)          --> boolean
showTypeInfo("Hello world") --> string
showTypeInfo(myname)        --> string
showTypeInfo(10.4 * 3)      --> number
showTypeInfo(print)         --> function
showTypeInfo(type)          --> function

-- when combining strings and numbers, it will try to coerce one to the other.
-- however, you should use tonumber() and tostring()

-- Function theory:
-- Any arguments you forget to pass are received as nil.
-- Any extra arguments are simply ignored
showTypeInfo("howdy howdy", "this string should be ignored")

[[
multiline string
(it is long and stringy)
]]

-- on lua styling, you might want to use snake_case for functions and PascalCase
-- for methods as in C#

-- note that loops include both end points
function fizzbuzz(n)
    for i=1,n,1 do
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

print "fizzing..."
fizzbuzz(15)

-- note that 'false' and 'nil' are the only falsey values in lua. everything
-- else is truthy.

--[[
# Tables
(the data structure of all time)
--]]

newtable = {}
newtable["apple"] = 10
print(newtable["apple"])

-- 'othertable' now references the same underlying table as 'newtable'
othertable = newtable
-- 'newtable' now loses access to the table. 'othertable' is the sole owner.
newtable = nil

person = {
    name = "sam"
}
print(person.name) -- hey, that looks like a struct or something
