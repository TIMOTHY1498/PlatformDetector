--[[
	// PlatformDetector.lua - An extenstion that used for checking the device platform.
	
	// Created by PakTimoGus124
	// Version 0.1
]]--

local MOBILE = game.UserInputService.TouchEnabled
local CONSOLE = game.UserInputService.GamepadEnabled
local PC = game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled

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
		return "PC/Mac"
	else
		return nil
	end
end

return apis
