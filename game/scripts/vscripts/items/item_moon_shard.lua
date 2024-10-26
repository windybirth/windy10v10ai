function MoonShardOnSpell(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local modifier = keys.modifier

	if caster:IsRealHero() and target:IsRealHero() and not caster:HasModifier("modifier_arc_warden_tempest_double") and not target:HasModifier("modifier_arc_warden_tempest_double") then
		AddStacks(ability, caster, target, modifier, 1, true)
		EmitSoundOnClient("Item.MoonShard.Consume", target)
		-- caster:RemoveItem(ability)
		UTIL_RemoveImmediate(ability)
	end
end
