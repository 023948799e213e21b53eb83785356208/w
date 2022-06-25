--Start Clock
local start = os.clock()
print("Started the obfuscation procedure, this may take longer for large scripts and or low-end pcs.")

local options = {
  ["Anti-Beautify"] = true
}

local version = "0.0.8"

--Reading the script
local script = io.open('input.lua','r'):read("*all")

local variable_names = {}

--Adding credit protection
script = [[
if getfenv()['_obfuscated_by_overrideobfuscator'] == nil then return error('give me some credit, damn (Case: 1)') end if getfenv()["_OVERRIDE_"] == nil then return error('give me some credit, damn (Case: 3)') end
local override = {}
function override.get_version() 
  return "]]..version..[["
end
function override.get_author() 
  return 'Avian#0002'
end
function override.get_discord()
  return 'discord.gg/XfE9UPzV5S'
end
function override.print(msg)
  print('[OVERRIDE PRINT]: '..msg)
end
function override.get_message()
  return 'Thank you for using Override! This honestly means a lot <3'
end
]]..script

function toBits(num)
  -- returns a table of bits, least significant first.
  local t={} -- will contain the bits
  while num>0 do
      local rest=math.fmod(num,2)
      t[#t+1]=rest
      num=(num-rest)/2
  end
  return table.concat(t,"")
end

--Random Variable Name Generator (Example: IlIlllII)
function random_name(length) 
  local s = 'OverrideBest_'
  while true do
  for i=1,length do
    if math.random(1,2) == 1 then
      s=s.."I"
    else
      s=s.."l"
    end
  end
  if variable_names[s] == nil then
    variable_names[s] = true
    break
  end
end
  return s
end


local list_arabic={"ا","ب","ت","ث","ج","ح","خ","د","ذ","ر","ز","س","ش","ص","ض","ط","ظ","ع","غ","ف","ق","ك","ل","م","ن","ه","و","ي"}
local list_random = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
local list_russian = {"а","б","в","г","д","е","ё","ж","з","и","й","к","л","м","н","о","п","р","с","т","у","ф","х","ц","ч","ш","щ","ъ","ы","ь","э","ю","я"}
local emojis = {"😀","😃","😄","😁","😆","😅","😂","🤣","😊","😇","🙂","🙃","😉","😌","😍","🥰","😘","😗","😙","😚","😋","😛","😝","😜","🤪","🤨","🧐","🤓","😎","🥸","🤩","🥳","😏","😒","😞","😔","😟","😕","🙁","☹️","😣","😖","😫","😩","🥺","😢","😭","😤","😠","😡","🤬","🤯","😳","🥵","🥶","😱","😨","😰","😥","😓","🤗","🤔","🤭","🤫","🤥","😶","😐","😑","😬","🙄","😯","😦","😧","😮","😲","🥱","😴","🤤","😪","😵","🤐","🥴"}
local all_together = {}
for i=1,#list_arabic do
  all_together[#all_together+1] = list_arabic[i]
end
for i=1,#list_random do
  all_together[#all_together+1] = list_random[i]
end
for i=1,#list_russian do
  all_together[#all_together+1] = list_russian[i]
end
for i=1,#emojis do
  all_together[#all_together+1] = emojis[i]
end

function random_string(length,rig)
  local a = '"'

  local list_rand = rig or math.random(1,5)
  
  local list_to_use = {}

  if list_rand == 1 then list_to_use = list_arabic end
  if list_rand == 2 then list_to_use = list_random end
  if list_rand == 3 then list_to_use = list_russian end
  if list_rand == 4 then list_to_use = all_together end
  if list_rand == 5 then list_to_use = emojis end

  
  for i=1,length do
    a=a..list_to_use[math.random(1,#list_to_use)]
  end
  return a..'"'
end

--Turns bytes into a slightly protected string
function make_byte_representation(b)
  
    local a = ''
    local random = math.random(1000,10000)
    local ascii = math.random(65,90)
    local strings = {}
    for line in io.open("memestrings.txt",'r'):lines() do
      table.insert(strings,line)
    end    
    local stringg = strings[math.random(1,#strings)]
    if math.random(1,2) == 2 then
      stringg = random_string(10)
    end
    a = a.."(({...})[1])()["..to_bytes('string').."]["..to_bytes('byte').."](".."(({...})[1])()["..to_bytes('string').."]["..to_bytes('sub').."]([["..stringg.."]],1,1))+0x"..string.format("%x",b*random).."/0x"..string.format("%x",random)..'-0x'..string.format("%x",string.byte(stringg:sub(1,1)))
  
  return a
end

--Make a string of bytes (example: \255\255\255\255)
function to_bytes(word)
  local s = '"'
    
  for i = 1,#word do
    s=s.."\\"..string.byte(string.sub(word,i,i))
  end
  
  return s.."\""
end

--Random variable names
local random_unpack = random_name(20)
local random_s = random_name(20)
local random_f = random_name(20)
local random_t = random_name(20)
local random_i = random_name(20)
local random_v = random_name(20)
local antibeautifyI = random_name(20)
local antibeautifyII = random_name(20)
local largerandstring = random_string(100000,4)

--Starting script

local newscript = "_obfuscated_by_overrideobfuscator='discord.gg/XfE9UPzV5S';_indev_version=\""..version.."\";if getfenv == nil then return error(\"You can only use this on lua that supports getfenv (Roblox or LuaU)\") end; return (function(...) function "..random_unpack.."("..random_t..",...) "..random_s.." = '' for "..random_i..","..random_v.." in pairs("..random_t..") do  "..random_s.." = "..random_s.."..(({...})[1])()["..to_bytes("string").."]["..to_bytes("char").."]("..random_v..") end return ".."(({...})[1])()["..to_bytes(random_s).."] end; "

function random_stuff()
  for i = 1,math.random(500,1000) do
    newscript=newscript..random_name(math.random(20,30)).."="..random_string(math.random(50,100))
  end
end

random_stuff()

newscript = newscript..random_f.." = {"

newscript = "_OVERRIDE_=[["..[[
  ____                            _      _                       
 / __ \                          (_)    | |                   
| |  | |__   __  ___  _ __  _ __  _   __| |  ___ 
| |  | |\ \ / / / _ \| '__|| '__|| | / _` | / _ \
| |__| | \ V / |  __/| |   | |   | || (_| ||  __/
 \____/   \_/   \___||_|   |_|   |_| \__,_| \___| 
            VERSION ]]..version..[[
            Open Source Project
            By: Avian#0002, also known as the Avian's Account Generator developer
            Discord: discord.gg/XfE9UPzV5S
                                                                                                                                                             
]].."]]\n"..newscript

--Loop through the script and add meme strings + byte representation
for i = 1,#script do
  local f = i
  i = string.sub(script,i,i)
  local random = math.random(1000,10000)
  


  newscript=newscript..make_byte_representation(i:byte())
  if f ~= #script then
    newscript=newscript..","
  end
end

newscript = newscript.."};"
--Ending script
if options["Anti-Beautify"] then
  newscript = newscript.."function "..random_name(20).."()pcall(function()local "..antibeautifyI.."="..antibeautifyII.." "..antibeautifyI.."*=-1; end) end "
end
random_stuff()
newscript=newscript.." if(({...})[1])()["..to_bytes('loadstring').."]==(({...})[1])()["..to_bytes('print').. "]then return end;if rawequal((({...})[1])()["..to_bytes('loadstring').."],(({...})[1])()["..to_bytes("warn").."])".."then return end;if rawequal((({...})[1])()["..to_bytes('loadstring').."],(({...})[1])()["..to_bytes("error").."])then return end;"

newscript=newscript.."return(({...})[1])()['\\108\\111\\97\\100\\115\\116\\114\\105\\110\\103']((({...})[1])()["..to_bytes(random_unpack).."]("..random_f..",...)) end)(getfenv,"..largerandstring..")()\n"

--Editing the output file
io.open('output.lua',"w+"):write(newscript)

--Ending Clock and Printing Time
local done = os.clock()
print("Finished in "..done-start.." seconds.\nThank you for using Override! (Discord: discord.gg/XfE9UPzV5S)")
if done > 60 then
  print("This took longer than usual! Please report this to Avian#0002 on Discord (or the offical server: discord.gg/XfE9UPzV5S)")
end

print'obfuscated'