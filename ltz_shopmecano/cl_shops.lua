print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^1 LouTzeTV^7")
print("^0[^3Serveur^0] ^7:^0 ^0Flashland & FlashLite^7")
print("^0======================================================================^7")

ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

local Deal = {

    Base = { Title = "Mécano" },
    Data = { currentMenu = "Mécano" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Kit de Carroserie" then
                    TriggerServerEvent('loutzemecano:buy', 3500, "carokit", "Kit de Carroserie")
              elseif btn.name == "Kit de Réparation" then
                    TriggerServerEvent('loutzemecano:buy', 5000, "fixkit", "Kit de Réparation")
              end
        end,
    },

    Menu = {
        --["Mécano"] = {
      --      b = {
          --      {name = "Catalogue", ask = "→ ~r~Voir", askX = true},
        --    }
      --  },

        ["Mécano"] = {
            b = {
                {name = "Kit de Carroserie", ask = "~g~3500$", askX = true},
                {name = "Kit de Réparation", ask = "~g~5000$", askX = true},
            }
        },

    }
}

local Shops = {
    { x = -354.64, y = -128.28, z = 39.43}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(Shops) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Shops[k].x, Shops[k].y, Shops[k].z)

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec le ~g~Mécano")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(Deal)
				end
            end
        end
    end
end)


    