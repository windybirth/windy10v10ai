require("libraries/popups")

item_tome_of_strength = class({})
LinkLuaModifier("modifier_str_tome", "items/item_tome_of_strength.lua", LUA_MODIFIER_MOTION_NONE)



if IsServer() then
    function item_tome_of_strength:OnSpellStart()
        local caster = self:GetCaster()
        local str = self:GetSpecialValueFor("bonus")
        local tome_table = CustomNetTables:GetTableValue("str_tomes", caster:GetUnitName())
        caster:ModifyStrength(str)
        caster:EmitSound("Item.TomeOfKnowledge")

        if caster:HasModifier("modifier_str_tome") then
            local modifier = caster:FindModifierByName("modifier_str_tome")
            modifier:SetStackCount(modifier:GetStackCount() + 1)
            local newValue = tome_table.str + str
            CustomNetTables:SetTableValue("str_tomes", caster:GetUnitName(), {str = newValue})
        else
            caster:AddNewModifier(caster, self, "modifier_str_tome", {})
            caster:FindModifierByName("modifier_str_tome"):SetStackCount(1)
            CustomNetTables:SetTableValue("str_tomes", caster:GetUnitName(), {str = str})
        end

        self:SpendCharge()
        PopupStrTome(caster, str)
    end
end



modifier_str_tome = class({})


function modifier_str_tome:RemoveOnDeath()
    return false
end

function modifier_str_tome:AllowIllusionDuplicate()
    return true
end


function modifier_str_tome:IsPermanent()
    return true
end

function modifier_str_tome:OnCreated(kv)
    if IsServer() then
        local parent = self:GetParent()
        if parent:IsIllusion() or parent:IsTempestDouble() then
            local tome_table = CustomNetTables:GetTableValue("str_tomes", self:GetParent():GetUnitName())
            parent:ModifyStrength(tome_table.str)
            local mod = parent:FindModifierByName("modifier_str_tome")
            mod:SetStackCount(tome_table.str/25)
        end
    end
end

function modifier_str_tome:OnRefresh(kv)
    if IsServer() then
        local parent = self:GetParent()
        if parent:IsIllusion() or parent:IsTempestDouble() then
            local tome_table = CustomNetTables:GetTableValue("str_tomes", self:GetParent():GetUnitName())
            parent:ModifyStrength(tome_table.str)
            local mod = parent:FindModifierByName("modifier_str_tome")
            mod:SetStackCount(tome_table.str/25)
        end
    end
end

function modifier_str_tome:DeclareFunctions()
	local funcs = {
        MODIFIER_PROPERTY_TOOLTIP,
    }
    return funcs
end



function modifier_str_tome:OnTooltip()
    return self:GetStackCount() * 25
end

function modifier_str_tome:GetTexture()
    return "item_tome_of_strength"
end
