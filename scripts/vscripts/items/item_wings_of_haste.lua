function WingsOfHasteOnSpell(keys)
	if (keys.caster:IsRealHero() or keys.caster:GetName() == "npc_dota_lone_druid_bear") and (keys.target:IsRealHero() or keys.target:GetName() == "npc_dota_lone_druid_bear") and not keys.caster:HasModifier("modifier_arc_warden_tempest_double") and not keys.target:HasModifier("modifier_arc_warden_tempest_double") and not keys.target:HasModifier(keys.modifier) then
		-- keys.target:AddNewModifier(keys.caster, keys.ability, keys.modifier, {})
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, keys.modifier, {})
		keys.target:EmitSound("Hero_Alchemist.Scepter.Cast")
		keys.caster:RemoveItem(keys.ability)
	end
end
