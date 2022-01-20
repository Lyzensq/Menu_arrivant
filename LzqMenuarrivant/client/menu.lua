--#----------------#-
    ---Lzq#6565---
--#----------------#-

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

local mainMenu = RageUI.CreateMenu("Bienvenue", "menu") -- menu principal
local info = RageUI.CreateSubMenu(mainMenu, "Info", "menu") -- sous-menu réseau
local touche = RageUI.CreateSubMenu(mainMenu, "Touches", "menu") -- sous-menu touche
local metier = RageUI.CreateSubMenu(mainMenu, "Métier", "menu") -- sous-menu touche
local illegal = RageUI.CreateSubMenu(mainMenu, "Illégal", "menu") -- sous-menu touche
local commandes = RageUI.CreateSubMenu(mainMenu, "Commandes", "menu") -- sous-menu touche
local gps = RageUI.CreateSubMenu(mainMenu, "GPS", "menu") -- sous-menu touche

local open = false
mainMenu.Closed = function() 
    open = false 
end 

function arrivants() -- fonction principale
    if open then 
        open = false 
            RageUI.Visible(mainMenu, false) 
        return 
    else 
        open = true 
            RageUI.Visible(mainMenu, true)
            CreateThread(function()
                while open do 
                    RageUI.IsVisible(mainMenu, function()
                        RageUI.Separator("~y~___________________")
                        RageUI.Button("Info", "Ouvrir le menu Info", {RightLabel = "~y~→→"}, true, {}, info) -- bouton dans le menu principal pour ouvrir le menu réseaux
                        RageUI.Button("Touches", "Ouvrir le menu Touches", {RightLabel = "~y~→→"}, true, {}, touche) -- bouton dans le menu principal pour ouvrir le menu touche
                        RageUI.Button("Commandes", "Ouvrir le menu Commandes", {RightLabel = "~y~→→"}, true, {}, commandes) -- bouton dans le menu principal pour ouvrir le menu commandes
                        RageUI.Separator("~y~___________________")
                        RageUI.Button("GPS", "Ouvrir le menu GPS", {RightLabel = "~y~→→"}, true, {}, gps) -- bouton dans le menu principal pourouvrir le menu gps
                        RageUI.Button("Métier", "Ouvrir le menu Métier", {RightLabel = "~y~→→"}, true, {}, metier) -- bouton dans le menu principal pour ouvrir le menu touche
                        RageUI.Button("Illegal", "Ouvrir le menu Illégal", {RightLabel = "~y~→→"}, true, {}, illegal) -- bouton dans le menu principal pour ouvrir le menu touche
                    end)

                    RageUI.IsVisible(info, function()
                        RageUI.Separator("~y~___________________")
                        RageUI.Button(("Nom Steam : " ..GetPlayerName(PlayerId())), nil, {RightLabel = ""}, true, {}) -- steam de la personne
                        RageUI.Button(("ID~s~ : " ..GetPlayerServerId(PlayerId())), nil, {RightLabel = ""}, true, {}) -- id de la personne
                        RageUI.Button("Discord", "Afficher le lien du Discord", {RightLabel = "~y~→→"}, true, { -- bouton dans le menu réseau pour afficher le lien du discord
                            onSelected = function()
                                ESX.ShowAdvancedNotification("Réseaux", "Info", "Lien du discord: ~b~https://discord.gg/TnDTdgPcdy", "CHAR_AMANDA", 7) -- contenue de la notif
                                PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                            end
                        })                   
                        RageUI.Separator("https://discord.gg/TnDTdgPcdy") -- afficher le lien du discord en bas du menu réseaux
                    end)

                    RageUI.IsVisible(touche, function()
                        RageUI.Separator("~y~___________________")
                        RageUI.Button("Téléphone", nil, {RightLabel = "F1"}, true, {}) -- bouton du menu touche
                        RageUI.Button("Menu Intéraction", nil, {RightLabel = "F5"}, true, {}) -- bouton du menu touche
                        RageUI.Button("Menu Emote", nil, {RightLabel = "F2"}, true, {}) -- bouton du menu touche
                        RageUI.Button("Ceinture", nil, {RightLabel = "K"}, true, {}) -- bouton du menu touche
                        RageUI.Button("Lever les mains", nil, {RightLabel = "²"}, true, {}) -- bouton du menu touche
                        RageUI.Button("Menu Job", nil, {RightLabel = "F6"}, true, {}) -- bouton du menu touche
                        RageUI.Button("Menu Orga", nil, {RightLabel = "F7"}, true, {}) -- bouton du menu touche
                        RageUI.Button("Radio", nil, {RightLabel = "="}, true, {}) -- bouton du menu touche
                    end)
                    RageUI.IsVisible(metier, function()
                        RageUI.Separator("~y~___________________")
                        RageUI.Button("Lspd", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Ems", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,,
                        RageUI.Button("Concessionnaire", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Unicorn", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                        RageUI.Button("Benny's", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Taxi", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                        RageUI.Button("Mcdo", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                        RageUI.Button("Vigneron", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Tabac", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                        RageUI.Button("Agent Immobilier", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                    end)
                    RageUI.IsVisible(illegal, function()
                        RageUI.Separator("~y~___________________")
                        RageUI.Button("Ballas", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Vagos", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,,
                        RageUI.Button("Marabunta", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Crips", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Bloods", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                        RageUI.Button("Famillies", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                        RageUI.Button("Cartel", nil, {RightLabel = "❌"}, true, {}) -- bouton du metier,
                        RageUI.Button("Orga", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                        RageUI.Button("Mafia", nil, {RightLabel = "✅"}, true, {}) -- bouton du metier,
                    end)
                    RageUI.IsVisible(commandes, function()    
                        RageUI.Separator("~y~___________________")
                        RageUI.Button("Signalement", "Signaler un joueur", {RightLabel = "/report + raison"}, true, {}) -- bouton du menu commandes pour monter la commande /report + raison
                        RageUI.Button("Aide", "Ouvrir le menu arrivants", {RightLabel = "/help"}, true, {}) -- bouton du menu commandes pour monter la commande /help
                        RageUI.Button("Twitter", "Message par Twitter", {RightLabel = "/twt"}, true, {})
                        RageUI.Button("Anonyme", "Message Crypté", {RightLabel = "/ano"}, true, {})
                        RageUI.Button("ME", "Action au dessus de votre tete ", {RightLabel = "/me"}, true, {})
                        RageUI.Separator("https://discord.gg/TnDTdgPcdy") -- afficher le lien du discord en bas du menu commandes
                    end)
                    RageUI.IsVisible(gps, function()
                        RageUI.Separator("~y~___________________")
                        RageUI.Button("Concessionaire", "Aller au Concessionaire", {RightLabel = "→"}, true, { -- bouton dans le menu gps pour mettre un point au concess
                            onSelected = function()
                                ESX.ShowAdvancedNotification("GPS", "Concessionaire", "Position marquée sur votre GPS", "CHAR_DAVE2", 7) -- contenue de la notif
                                PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                                SetNewWaypoint(-45.09, -1107.69, 26.44) -- coordonnées du marqueur sur la map du conces
                            end
                        })
                        RageUI.Button("Argent ", "Aller a la Banque Principale", {RightLabel = "→"}, true, { -- bouton dans le menu gps pour mettre un point a la banque principale
                            onSelected = function()
                                ESX.ShowAdvancedNotification("GPS", "Banque", "Position marquée sur votre GPS", "CHAR_BANK_FLEECA", 7) -- contenue de la notif
                                PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                                SetNewWaypoint(243.55, 224.55, 106.29) -- coordonnées du marqueur sur la map de la banque
                            end
                        })
                        RageUI.Button("Nourriture ", "Aller a une supérette", {RightLabel = "→"}, true, { -- bouton dans le menu gps pour mettre un point sur une supérette
                            onSelected = function()
                                ESX.ShowAdvancedNotification("GPS", "Supérette", "Position marquée sur votre GPS", "CHAR_DAVE", 7) -- contenue de la notif
                                PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1) -- "nom du son" / "ref du son"
                                SetNewWaypoint(-48.52, -1757.51, 29.42) -- coordonnées du marqueur sur la map de la supérette la plus proche de l'aéroport
                            end
                        })
                    end)
                Wait(0)
            end
        end)
    end
end

RegisterCommand("help", function(source, args, rawcommand) -- /help pour ouvrir le menu arrivants
   -- Citizen.Wait(0)
  -- ESX.ShowNotification("~r~Patientez 5 secondes ...")
   -- Citizen.Wait(5000)  -- temps d ouverture du Menu
    arrivants() -- nom de la fonction principale
end, false)

---Ou alors avec une touche ig , possible de la changer directement IG (Touches FiveM)---

--Keys.Register('F1', 'F1', 'Ouvrir le menu arrivants', function() -- touche par défaut pour ouvrir le menu 
  --  arrivants() -- nom de la fonction principale
--end)
