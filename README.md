# A7-lock - Free


# This Script By A7 Store : https://discord.gg/aCnBJC3Pxb




![image](https://cdn.discordapp.com/attachments/1134189051356917917/1165210789536333884/image.png?ex=6546061c&is=6533911c&hm=b9436e327ef1a559b009d2f0fcd082cc89a556c18bb40ab64247745614bfc4b5&)

# Example useage
```lua

RegisterCommand("a7game", function()
	local time = math.random(7,10)
	local circles = math.random(2,4)
	local success = exports['A7-lock']:StartLockPickCircle(circles, time, success)
	print(success)
	if success then
		print("WIN")
	else
		print("FAIL")
	end
end)

```

```lua

local seconds = math.random(9,12)
local circles = math.random(1,3)
local success = exports['A7-lock']:StartLockPickCircle(circles, seconds, success)
if success then
QBCore.Functions.Notify(" Success", "success")
end
```

Only Ui Edited