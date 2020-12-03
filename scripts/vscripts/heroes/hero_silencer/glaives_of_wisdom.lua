--[[Glaives of Wisdom intelligence to damage
	Author: chrislotix
	Date: 10.1.2015.]]

function IntToDamage(keys)

	local ability = keys.ability
	local caster = keys.caster
	local target = keys.target
	local int_caster = caster:GetIntellect()
	local int_damage = ability:GetLevelSpecialValueFor("intellect_damage_pct", (ability:GetLevel() -1))
	

	local damage_table = {}

	damage_table.attacker = caster
	damage_table.damage_type = ability:GetAbilityDamageType()
	damage_table.ability = ability
	damage_table.victim = target

	damage_table.damage = int_caster * int_damage / 100

	ApplyDamage(damage_table)

end

--[[Author: YOLOSPAGHETTI
	Date: 02.02.2016
	Adds stacks to the aesthetic modifiers]]
function AddStacks(keys)
	local ability = keys.ability
	local caster = keys.caster
	local int_steal_modifier = "modifier_glaives_of_wisdom_status"
	local int_steal = ability:GetLevelSpecialValueFor("int_steal", (ability:GetLevel() -1))
	local duration = ability:GetLevelSpecialValueFor("int_steal_duration", (ability:GetLevel() -1))

	if(caster:HasModifier(int_steal_modifier)) then
		local stacks = caster:GetModifierStackCount( int_steal_modifier, ability )

		-- Adds stacks to the aesthetic modifiers
		ability:ApplyDataDrivenModifier(caster, caster, int_steal_modifier, {Duration = duration})
		caster:SetModifierStackCount( int_steal_modifier, ability, stacks + int_steal )
	else
		-- Applies aesthetic stack modifiers to the caster
		ability:ApplyDataDrivenModifier(caster, caster, int_steal_modifier, {Duration = duration})
		caster:SetModifierStackCount( int_steal_modifier, ability, int_steal )
	end
end

--[[Author: YOLOSPAGHETTI
	Date: 02.02.2016
	Removes stacks from the aesthetic modifiers]]
function RemoveStacks(keys)
	local ability = keys.ability
	local caster = keys.caster
	local int_steal_modifier = "modifier_glaives_of_wisdom_status"
	local duration = ability:GetLevelSpecialValueFor("int_steal_duration", (ability:GetLevel() -1))
	local levels_since_start = 0
	local game_time = GameRules:GetGameTime()

	-- Checks how many times the ability has been leveled up during the modifier duration
	if ability.level_four_time ~= null then
		if ability.level_four_time > game_time - duration then
			levels_since_start = levels_since_start + 1
		end
	end
	if ability.level_three_time ~= null then
		if ability.level_three_time > game_time - duration then
			levels_since_start = levels_since_start + 1
		end
	end
	if ability.level_two_time ~= null then
		if ability.level_two_time > game_time - duration then
			levels_since_start = levels_since_start + 1
		end
	end

	-- Sets the stacks to remove accordingly
	local int_steal = ability:GetLevelSpecialValueFor("int_steal", (ability:GetLevel() - levels_since_start -1))

	-- Removes the stacks from the aesthetic modifier
	local stacks = caster:GetModifierStackCount( int_steal_modifier, ability )
	caster:SetModifierStackCount( int_steal_modifier, ability, stacks - int_steal )
end

--[[Author: YOLOSPAGHETTI
	Date: 02.02.2016
	Notes ability level up times to help with properly removing stacks]]
function LevelTime(keys)
	local ability = keys.ability

	-- Keeps note of the time the ability is leveled
	if ability:GetLevel() == 2 then
		ability.level_two_time = GameRules:GetGameTime()
	elseif ability:GetLevel() == 3 then
		ability.level_three_time = GameRules:GetGameTime()
	elseif ability:GetLevel() == 4 then
		ability.level_four_time = GameRules:GetGameTime()
	end
end











-- Added code from Rook's essence shift

function OrbSteal( keys )
	if keys.target:IsHero() and keys.target:IsOpposingTeam(keys.caster:GetTeam()) then
		local previous_stack_count = 0
		if keys.caster:HasModifier("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter") then
			previous_stack_count = keys.caster:GetModifierStackCount("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter", keys.caster)
			keys.caster:RemoveModifierByNameAndCaster("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter", keys.caster)
		end

		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_silencer_glaives_of_wisdom_datadriven_buff_counter", nil)
		keys.caster:SetModifierStackCount("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter", keys.caster, previous_stack_count + keys.IntSteal)
		
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster, "modifier_silencer_glaives_of_wisdom_datadriven_buff", nil)
	end
end

function BuffOnDestroy( keys )
	if keys.caster:HasModifier("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter") then
		local previous_stack_count = keys.caster:GetModifierStackCount("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter", keys.caster)
		if previous_stack_count > 1 then
			keys.caster:SetModifierStackCount("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter", keys.caster, previous_stack_count - keys.IntSteal)
		else
			keys.caster:RemoveModifierByNameAndCaster("modifier_silencer_glaives_of_wisdom_datadriven_buff_counter", keys.caster)
		end
	end
end