--[[---------------------------------------------------------------------------------
  This is a template for the plugin/module system for XAD.

  Plugins are used in XAD to a specify a  button action/use.
  
  Plugins are registered with XAD with a shortname that is used for all
  commands.  In addition they are required to have a fullname parameter that is
  used in all display messages
----------------------------------------------------------------------------------]]

-- Create the object and expose the name of the mod for options setting
local core=XAD
local tempweaponbuffs = core:GetTemplate("WeaponBuffs")

local Plugin = core:NewModule("poisonmindnumbing", tempweaponbuffs)
Plugin.fullname = "Poison Mindnumbing"

local PT = PeriodicTableEmbed:GetInstance("1")
-- register our custom item set w/ PT
PT:RegisterCustomSet("5237:1 6951:2 9186:3","XADpoisonmindnumbing")	

-- Plugin:OnEnable() is called if Plugin:Test() is true, and the mod hasn't been explicitly
-- disabled.  This is where you should handle all your hooks, etc.
function Plugin:OnEnable()
end

--ShowItem return bag, slot, spells, showcount
--	bag, slot = iventory location of item to display in the button
--	spells = table of spells that can be cast to create new items
--	showcount = true/false to show item counts on the button
function Plugin:ShowItem()
	local bag, slot = PT:GetBest("XADpoisonmindnumbing")
	return bag, slot, nil, false
end

--UseItem return bag, slot, spells, trade, leftaction, rightaction
--	bag, slot = iventory location of item to be uses
--	spells = table of spells that can be cast to create new items
--	trade = true/false to allow trading of the item
-- 	leftaction/rightaction = optional custom functions to be called on left/right clicking the button
function Plugin:UseItem()
	local bag, slot = PT:GetBest("XADpoisonmindnumbing")
	return bag, slot, nil, nil, "UseMain", "UseOffhand"
end

function Plugin:ItemInList(itemlink, spellid)
	if not itemlink then return end
	--local itemlink = GetContainerItemLink(bag,slot)
	return PT:ItemInSet(itemlink, "XADpoisonmindnumbing")
end
