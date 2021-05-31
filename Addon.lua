--[[--------------------------------------------------------------------
	PhanxFont
	Simple font replacement and scaling.
	Based on tekticles by Tekkub, which is based on ClearFont2 by Kirkburn.
	Copyright 2012-2018 Phanx <addons@phanx.net>
	Zlib license; see LICENSE.txt for the full license text.
	https://www.wowinterface.com/downloads/info24565-PhanxFont.html
	https://www.curseforge.com/wow/addons/phanxfont
	https://github.com/phanx-wow/PhanxFont
----------------------------------------------------------------------]]

local ADDON, Addon = ...
_G.PhanxFont = Addon

Addon.Classic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
Addon.BCC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
Addon.Mainline = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE

PhanxFontDB = {
	normal = "Lato",
	bold   = "Lato Black",
	damage = "Lato Black",
	scale  = 1,
	damagescale = 2,
}

local NORMAL       = [[Interface\AddOns\PhanxMedia\font\Lato.ttf]]
local BOLD         = [[Interface\AddOns\PhanxMedia\font\Lato-Black.otf]]
local DAMAGE       = [[Interface\AddOns\PhanxMedia\font\Lato-Black.otf]]
local BOLDITALIC   = BOLD
local ITALIC       = NORMAL
local NUMBER       = BOLD

------------------------------------------------------------------------

function Addon:SetFont(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	if not obj then return end
	obj:SetFont(font, floor(size * PhanxFontDB.scale + 0.5), style)
	if sr and sg and sb then
		obj:SetShadowColor(sr, sg, sb)
	end
	if sox and soy then
		obj:SetShadowOffset(sox, soy)
	end
	if r and g and b then
		obj:SetTextColor(r, g, b)
	elseif r then
		obj:SetAlpha(r)
	end
end

function Addon:SetFonts(event, addon)
	NORMAL     = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.normal)
	BOLD       = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.bold)
	DAMAGE 	   = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.damage)
	BOLDITALIC = BOLD
	ITALIC     = NORMAL
	NUMBER     = BOLD

	UNIT_NAME_FONT     = NORMAL
	NAMEPLATE_FONT     = BOLD
	DAMAGE_TEXT_FONT   = DAMAGE
	STANDARD_TEXT_FONT = NORMAL

	-- Base fonts in Fonts.xml
	self:SetFont(AchievementFont_Small,                BOLD, 12)
	self:SetFont(ChatBubbleFont,                     NORMAL, 13)
	self:SetFont(CoreAbilityFont,                      BOLD, 32)
	self:SetFont(DestinyFontHuge,                      BOLD, 32)
	self:SetFont(DestinyFontLarge,                     BOLD, 18)
	self:SetFont(FriendsFont_Large,                  NORMAL, 15, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	self:SetFont(FriendsFont_Normal,                 NORMAL, 13, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	self:SetFont(FriendsFont_Small,                  NORMAL, 13, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	self:SetFont(FriendsFont_UserText,               NUMBER, 13, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	self:SetFont(Game15Font_o1,                      NORMAL, 15, "OUTLINE")
	self:SetFont(Game18Font,                         NORMAL, 18)
	self:SetFont(Game24Font,                         NORMAL, 24) -- there are two of these, good job Blizzard
	self:SetFont(Game27Font,                         NORMAL, 27)
	self:SetFont(Game30Font,                         NORMAL, 30)
	self:SetFont(Game32Font,                         NORMAL, 32)
	self:SetFont(GameFont_Gigantic,                    BOLD, 32, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	self:SetFont(GameTooltipHeader,                    BOLD, 15, "OUTLINE") -- SharedFonts.xml
	self:SetFont(InvoiceFont_Med,                    ITALIC, 13, nil, 0.15, 0.09, 0.04)
	self:SetFont(InvoiceFont_Small,                  ITALIC, 11, nil, 0.15, 0.09, 0.04)
	self:SetFont(MailFont_Large,                     ITALIC, 15, nil, 0.15, 0.09, 0.04, 0.54, 0.4, 0.1, 1, -1)
	self:SetFont(NumberFont_GameNormal,              NORMAL, 10)
	self:SetFont(NumberFont_Normal_Med,              NUMBER, 14)
	self:SetFont(NumberFont_Outline_Huge,            NUMBER, 30, "THICKOUTLINE", 30)
	self:SetFont(NumberFont_Outline_Large,           NUMBER, 17, "OUTLINE")
	self:SetFont(NumberFont_Outline_Med,             NUMBER, 15, "OUTLINE")
	self:SetFont(NumberFont_OutlineThick_Mono_Small, NUMBER, 13, "OUTLINE")
	self:SetFont(NumberFont_Shadow_Med,              NORMAL, 14)
	self:SetFont(NumberFont_Shadow_Small,            NORMAL, 12)
	self:SetFont(NumberFont_Shadow_Tiny,             NORMAL, 11)
	self:SetFont(NumberFont_Small,                   NORMAL, 12)
	self:SetFont(NumberFont_GameNormal,              NORMAL, 13) -- orig 10 -- inherited by WhiteNormalNumberFont, tekticles = 11
	self:SetFont(Number12Font,                       NUMBER, 13)
	self:SetFont(Number13Font,                       NUMBER, 13)
	self:SetFont(Number13FontWhite,                  NUMBER, 13)
	self:SetFont(Number14FontWhite,                  NUMBER, 14)
	self:SetFont(Number15FontWhite,                  NUMBER, 15)
	self:SetFont(PriceFont,                          NUMBER, 14)
	self:SetFont(QuestFont_Enormous,                   BOLD, 30)
	self:SetFont(QuestFont_Huge,                       BOLD, 19)
	self:SetFont(QuestFont_Large,                    NORMAL, 16) -- SharedFonts.xml
	self:SetFont(QuestFont_Shadow_Huge,                BOLD, 19, nil, nil, nil, nil, 0.54, 0.4, 0.1)
	self:SetFont(QuestFont_Shadow_Small,             NORMAL, 16)
	self:SetFont(QuestFont_Super_Huge,                 BOLD, 24)
	self:SetFont(QuestFont_Super_Huge_Outline,         BOLD, 24, "OUTLINE")
	self:SetFont(ReputationDetailFont,                 BOLD, 12, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	self:SetFont(SpellFont_Small,                      BOLD, 11)
	self:SetFont(SplashHeaderFont,                     BOLD, 24)
	self:SetFont(SystemFont_Huge1,                   NORMAL, 20)
	self:SetFont(SystemFont_Huge1_Outline,           NORMAL, 20, "OUTLINE")
	self:SetFont(SystemFont_InverseShadow_Small,       BOLD, 11)
	self:SetFont(SystemFont_Large,                   NORMAL, 17)
	self:SetFont(SystemFont_Med1,                    NORMAL, 13) -- SharedFonts.xml
	self:SetFont(SystemFont_Med2,                    ITALIC, 14, nil, 0.15, 0.09, 0.04)
	self:SetFont(SystemFont_Med3,                    NORMAL, 15)
	self:SetFont(SystemFont_Outline,                 NUMBER, 13, "OUTLINE")
	self:SetFont(SystemFont_Outline_Small,           NUMBER, 13, "OUTLINE")
	self:SetFont(SystemFont_OutlineThick_Huge2,      NORMAL, 22, "THICKOUTLINE")
	self:SetFont(SystemFont_OutlineThick_Huge4,  BOLDITALIC, 27, "THICKOUTLINE")
	self:SetFont(SystemFont_OutlineThick_WTF,    BOLDITALIC, 31, "THICKOUTLINE", nil, nil, nil, 0, 0, 0, 1, -1)
--	self:SetFont(SystemFont_OutlineThick_WTF2,   BOLDITALIC, 36) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Huge1,              BOLD, 20) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Huge2,              BOLD, 24) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Huge3,              BOLD, 25) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Large,            NORMAL, 17) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Large2,           NORMAL, 19) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Large_Outline,    NORMAL, 17, "OUTLINE") -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Med1,             NORMAL, 13) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Med1_Outline,     NORMAL, 12, "OUTLINE") -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Med2,             NORMAL, 14) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Med3,             NORMAL, 15)
	self:SetFont(SystemFont_Shadow_Outline_Huge2,    NORMAL, 22, "OUTLINE") -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Small,            NORMAL, 13) -- SharedFonts.xml
	self:SetFont(SystemFont_Shadow_Small2,           NORMAL, 13) -- SharedFonts.xml
	self:SetFont(SystemFont_Small,                   NORMAL, 12) -- SharedFonts.xml
	self:SetFont(SystemFont_Small2,                  NORMAL, 12) -- SharedFonts.xml
	self:SetFont(SystemFont_Tiny,                    NORMAL, 11) -- SharedFonts.xml
	self:SetFont(SystemFont_Tiny2,                   NORMAL, 10) -- SharedFonts.xml
	self:SetFont(Tooltip_Med,                        NORMAL, 13)
	self:SetFont(Tooltip_Small,                        BOLD, 12)

	-- Derived fonts in FontStyles.xml
	self:SetFont(BossEmoteNormalHuge,  BOLDITALIC, 27, "THICKOUTLINE") -- inherits SystemFont_Shadow_Huge3
	self:SetFont(CombatTextFont,           DAMAGE, 26) -- inherits SystemFont_Shadow_Huge3
	self:SetFont(ErrorFont,                ITALIC, 16, nil, 60) -- inherits GameFontNormalLarge
	self:SetFont(QuestFontNormalSmall,       BOLD, 13, nil, nil, nil, nil, 0.54, 0.4, 0.1) -- inherits GameFontBlack
	self:SetFont(WorldMapTextFont,     BOLDITALIC, 31, "THICKOUTLINE", 40, nil, nil, 0, 0, 0, 1, -1) -- inherits SystemFont_OutlineThick_WTF

	--[[ Fancy stuff!
	self:SetFont(ZoneTextFont,           BOLD, 31, "THICKOUTLINE") -- inherits SystemFont_OutlineThick_WTF
	self:SetFont(SubZoneTextFont,        BOLD, 27, "THICKOUTLINE") -- inherits SystemFont_OutlineThick_Huge4
	self:SetFont(PVPInfoTextFont,      NORMAL, 22, "THICKOUTLINE") -- inherits SystemFont_OutlineThick_Huge2
	]]

	-- Chat frames
	local _, size = ChatFrame1:GetFont()
	FCF_SetChatWindowFontSize(nil, ChatFrame1, size)

	-- CombatTextFont scale
	local SetCVar = C_CVar and C_CVar.SetCVar or SetCVar
	SetCVar("WorldTextScale", PhanxFontDB.damagescale)

	-- Fix for adventure journal
	if addon == "Blizzard_EncounterJournal" then
		self:SetFont(EncounterJournalSuggestFrame.Suggestion1.centerDisplay.description.text, NORMAL, 15)
	end

	-- WorldMap Bounty board
	if WorldMapFrame.overlayFrames then
		self:SetFont(WorldMapFrame.overlayFrames[4].BountyName, NORMAL, 16, "OUTLINE", nil, nil, nil, 0, 0, 0, 1, -1)
	end
end

------------------------------------------------------------------------

local f = CreateFrame("Frame", "PhanxFont")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 14
	CHAT_FONT_HEIGHTS = { 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 }

	Addon:SetFonts(event, addon)

	if Addon.Mainline then
		for _, button in pairs(PaperDollTitlesPane.buttons) do
			button.text:SetFontObject(GameFontHighlightSmallLeft)
		end

		BattlePetTooltip.Name:SetFontObject(GameTooltipHeaderText)
		FloatingBattlePetTooltip.Name:SetFontObject(GameTooltipHeaderText)

		LFGListFrame.CategorySelection.CategoryButtons[1].Label:SetFontObject(GameFontNormal)
		WorldMapFrameHomeButtonText:SetFontObject(GameFontNormal)
	end
end)

hooksecurefunc("FCF_SetChatWindowFontSize", function(self, frame, size)
	if not frame then
		frame = FCF_GetCurrentChatFrame()
	end
	if not size then
		size = self.value
	end

	-- Set all the other frames to the same size.
	for i = 1, 10 do
		local f = _G["ChatFrame"..i]
		if f then
			f:SetFont(NORMAL, size)
			SetChatWindowSize(i, size)
		end
	end

	-- Set the language override fonts to the same size.
	for _, f in pairs({
		ChatFontNormalKO,
		ChatFontNormalRU,
		ChatFontNormalZH,
	}) do
		local font, _, outline = f:GetFont()
		f:SetFont(font, size, outline)
	end
end)

if Addon.Mainline then
	hooksecurefunc("BattlePetToolTip_Show", function()
		BattlePetTooltip:SetHeight(BattlePetTooltip:GetHeight() + 12)
	end)

	hooksecurefunc("FloatingBattlePet_Show", function()
		FloatingBattlePetTooltip:SetHeight(FloatingBattlePetTooltip:GetHeight() + 12)
	end)
end
