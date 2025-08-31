--[[
	// PlatformDetector.lua - An extenstion that used for checking the device platform.
	
	// Created by timothy1498_boi
	// Version 0.3
]]--

local MOBILE = game.UserInputService.TouchEnabled
local CONSOLE = game.UserInputService.GamepadEnabled
local PC = game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled
local VR = game.UserInputService.VREnabled

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

