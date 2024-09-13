local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G

function S:WorldMapFrame()
	if not (E.private.skins.blizzard.enable and E.private.skins.blizzard.worldmap) then return end

	local WorldMapFrame = _G.WorldMapFrame
	WorldMapFrame:StripTextures()

	WorldMapFrame.BorderFrame:StripTextures()
	WorldMapFrame.BorderFrame:CreateBackdrop('Transparent')
	WorldMapFrame.BorderFrame.backdrop:Point('TOPLEFT', 0, -0.5)

	WorldMapFrame.MiniBorderFrame:StripTextures()
	WorldMapFrame.MiniBorderFrame:CreateBackdrop('Transparent')
	WorldMapFrame.MiniBorderFrame.backdrop:Point('TOPLEFT', 6, -25)

	S:HandleMaxMinFrame(_G.WorldMapFrame.MaximizeMinimizeFrame)

	_G.WorldMapZoomOutButton:Point('LEFT', _G.WorldMapZoneDropDown, 'RIGHT', 3, 3)
	_G.WorldMapZoomOutButton:Height(23)
	_G.WorldMapZoomOutButton:Width(100)
	_G.WorldMapZoomOutButton:SetFrameLevel(_G.WorldMapFrame.BlackoutFrame:GetFrameLevel() + 2)

	S:HandleButton(_G.WorldMapZoomOutButton)
	S:HandleSliderFrame(_G.OpacityFrameSlider)

	if E:IsAddOnEnabled('Questie') and _G.Questie_Toggle then
		S:HandleButton(_G.Questie_Toggle)
	end

	S:HandleCloseButton(_G.WorldMapFrameCloseButton, WorldMapFrame.backdrop)
	_G.WorldMapFrameCloseButton:SetFrameLevel(_G.WorldMapFrameCloseButton:GetFrameLevel() + 2)
end

S:AddCallback('WorldMapFrame')
