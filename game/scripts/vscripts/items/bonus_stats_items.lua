LinkLuaModifier( "modifier_bonus_stats_items", "items/bonus_stats_items.lua", LUA_MODIFIER_MOTION_NONE )
--Abilities
if bonus_stats_items == nil then
	bonus_stats_items = class({})
end
function bonus_stats_items:GetIntrinsicModifierName()
	return "modifier_bonus_stats_items"
end
---------------------------------------------------------------------
--Modifiers
if modifier_bonus_stats_items == nil then
	modifier_bonus_stats_items = class({})
end
function modifier_bonus_stats_items:OnCreated(params)
	if IsServer() then
	end
end
function modifier_bonus_stats_items:OnRefresh(params)
	if IsServer() then
	end
end
function modifier_bonus_stats_items:OnDestroy()
	if IsServer() then
	end
end
function modifier_bonus_stats_items:DeclareFunctions()
	return {
	}
end