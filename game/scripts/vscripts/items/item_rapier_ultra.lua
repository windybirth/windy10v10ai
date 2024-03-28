item_rapier_ultra = class({})

LinkLuaModifier("modifier_item_rapier_ultra", "items/item_rapier_ultra.lua", LUA_MODIFIER_MOTION_NONE)

local dropTable = nil

local function CreateItemLocal(sItemName, hEntity)
    local item = CreateItem(sItemName, nil, nil)
    local pos = hEntity:GetAbsOrigin()
    CreateItemOnPositionSync(pos, item)
    local pos_launch = pos + RandomVector(RandomFloat(150, 200))
    item:LaunchLoot(false, 200, 0.75, pos_launch, nil)
end

local function RollDrops(hHero)
    if not dropTable then
        dropTable = LoadKeyValues("scripts/kv/item_drops.kv")
    end
    for item_name, chance in pairs(dropTable) do
        for i = 0, 8 do
            local hItem = hHero:GetItemInSlot(i)
            if hItem then
                local hItem_name = hItem:GetName()
                if item_name == hItem_name then
                    if RollPercentage(chance) then
                        -- Remove the item
                        hHero:RemoveItem(hItem)
                    end
                end
            end
        end
    end
end
