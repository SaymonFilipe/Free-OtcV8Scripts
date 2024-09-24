--[[
**TROCA DE SET COM TECLA, AO BAIXAR A TECLA ELE TROCA AS 4 PARTES PRINCIPAIS DO SET**

● **BAG COM OS 2 SET DEVEM ESTAR ABERTAS**

● **PRIMEIRO ID É O ITEM NA BAG, O SEGUNDO É O EQUIPADO**
**   1         2
{123, 5677**

**CASO O SET EQUIPADO NAO ALTERE O ID, APENAS COLOQUE COMO "NIL" OU REPITA O PRIMEIRO ID**
**Ex: {1234, nil, slotHead};
Ex: {1234, 1234, slotHead}**

]]--
local swap = false;
local uswapKey = "5"; -- swap key
--SET PRINCIPAL
--SET SENJU(NtoUltimate) \/ JA DEFINIDO
local set1 = {
    -- id na bag, id equipado
    {12898, 12899, SlotHead}, -- helmet
    {12916, 12917, SlotBody}, -- armor
    {12934, 12935, SlotLeg}, -- legs
    {12952, 12953, SlotFeet}, -- boots
}

-- SET SECUNDARIO
local set2 = {
    --idNaBag, idEquipado
    {10754, 10754, SlotHead}, -- helmet
    {10753, 10753, SlotBody}, -- armor
    {8098, 8098, SlotLeg}, -- legs
    {10751, 10751, SlotFeet}, -- boots
};

onKeyDown(function(keys)
    if (keys == uswapKey) then
        swap = not swap;
    end
end)

local function uswapSet(table)
    for i, uv in ipairs(table) do
        if uv[2] == nil then
            uv[2] = uv[1];
        end
        local us = getSlot(uv[3]);
        if (us and us:getId() ~= uv[2]) then
            return moveToSlot(uv[1], uv[3])
        end
    end
end

macro(100, "swap set", function()
    if (not swap) then
        uswapSet(set1)
    else
        uswapSet(set2)
    end
end)
