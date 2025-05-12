local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local PlatformDetector = {}

function PlatformDetector:Check()
	local dev = ""

	if UserInputService.VREnabled then
		dev = "Virtual Reality Headset"

	elseif GuiService.IsWindows then
		local version = getfenv().version()
		if version:sub(1, 2) == "0." then
			dev = "Windows"
		elseif version:sub(1, 2) == "2." then
			dev = "Windows ‒ Microsoft Store Version"
		end

	elseif getfenv().version():sub(1, 2) == "2." then
		if UserInputService.TouchEnabled then
			dev = "Mobile"
		else
			dev = "Linux"
		end

	elseif GuiService:IsTenFootInterface() or getfenv().version():sub(1, 2) == "1." then
		if getfenv().version():sub(1, 2) == "1." then
			dev = "Console"
		else
			dev = "Console " .. getfenv().version()
		end

	elseif getfenv().version():sub(1, 2) == "0." then
		dev = "MacOS"

	else
		dev = "Unknown game version: " .. getfenv().version()
	end

	return dev or "Unknown"
end

return PlatformDetector
