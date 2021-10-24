require("libraries/popups")

item_tome_of_intelligence = class({})
LinkLuaModifier("modifier_int_tome", "items/item_tome_of_intelligence.lua", LUA_MODIFIER_MOTION_NONE)



if IsServer() then
    function item_tome_of_intelligence:OnSpellStart()
        local caster = self:GetCaster()
        local int = self:GetSpecialValueFor("bonus")
        local tome_table = CustomNetTables:GetTableValue("int_tomes", caster:GetUnitName())
        caster:ModifyIntellect(int)
        caster:EmitSound("Item.TomeOfKnowledge")

        if caster:HasModifier("modifier_int_tome") then
            local modifier = caster:FindModifierByName("modifier_int_tome")
            modifier:SetStackCount(modifier:GetStackCount() + 1)
            local newValue = tome_table.int + int
            CustomNetTables:SetTableValue("int_tomes", caster:GetUnitName(), {int = newValue})
        else
            caster:AddNewModifier(caster, self, "modifier_int_tome", {})
            caster:FindModifierByName("modifier_int_tome"):SetStackCount(1)
            CustomNetTables:SetTableValue("int_tomes", caster:GetUnitName(), {int = int})
        end

        self:SpendCharge()
        PopupIntTome(caster, int)
    end
end



modifier_int_tome = class({})


function modifier_int_tome:RemoveOnDeath()
    return false
end

function modifier_int_tome:AllowIllusionDuplicate()
    return true
end


function modifier_int_tome:IsPermanent()
    return true
end

function modifier_int_tome:OnCreated(kv)
    if IsServer() then
        local parent = self:GetParent()
        if parent:IsIllusion() or parent:IsTempestDouble() then
            local tome_table = CustomNetTables:GetTableValue("int_tomes", self:GetParent():GetUnitName())
            parent:ModifyIntellect(tome_table.int)
            local mod = parent:FindModifierByName("modifier_int_tome")
            mod:SetStackCount(tome_table.int/25)
        end
    end
end

function modifier_int_tome:OnRefresh(kv)
    if IsServer() then
        local parent = self:GetParent()
        if parent:IsIllusion() or parent:IsTempestDouble() then
            local tome_table = CustomNetTables:GetTableValue("int_tomes", self:GetParent():GetUnitName())
            parent:ModifyIntellect(tome_table.int)
            local mod = parent:FindModifierByName("modifier_int_tome")
            mod:SetStackCount(tome_table.int/25)
        end
    end
end


function modifier_int_tome:DeclareFunctions()
	local funcs = {
        MODIFIER_PROPERTY_TOOLTIP,
    }
    return funcs
end



function modifier_int_tome:OnTooltip()
    return self:GetStackCount() * 25
end

function modifier_int_tome:GetTexture()
    return "item_tome_of_intelligence"
end
