--[[
	// PlatformDetector.lua - An extenstion that used for checking the device platform.
	
	// Created by timothy1498_boi
	// Version 0.3
]]--

local GuiService = game:GetService("GuiService")
local MOBILE
local CONSOLE
local PC
local VR
function updateDevices()
	MOBILE = game.UserInputService.TouchEnabled and not game.UserInputService.MouseEnabled and not game.UserInputService.KeyboardEnabled
	CONSOLE = GuiService:IsTenFootInterface() and game.UserInputService.GamepadEnabled
	PC = game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled
	VR = game.UserInputService.VREnabled
end
updateDevices()

function getViewportSize()
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:wait()
	end

	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0,0) or
		game.Workspace.CurrentCamera.ViewportSize == Vector2.new(1,1) do
		game.Workspace.CurrentCamera.Changed:wait()
	end

	return game.Workspace.CurrentCamera.ViewportSize
end

--// Public APIs

local apis = {}

function apis:Check()
	-- UPDATE THE DEFAULT SETTINGS IN THE CASE OF CHANGING CONNECTED DEVICES
	updateDevices()
	--//
	if MOBILE then
		if MOBILE and (getViewportSize().Y <= 370) then
			return "Phone"
		else
			return "Tablet"
		end
	elseif CONSOLE then
		return "Console"
	elseif PC then
		if game.GuiService.IsWindows == true then
			return "Windows"
		else
			return "Mac"
		end
	elseif VR then
		return "VR"
	else
		return nil
	end
end

return apis

