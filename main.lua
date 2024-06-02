--prison break autofarm

if 1==2 or game.PlaceId ~= 2859914153 then

    return

else

    if not game:IsLoaded() then

        game.Loaded:Wait()

    end

end



local player = game:GetService("Players").LocalPlayer

local UIS = game:GetService("UserInputService")

local Mouse = player:GetMouse()



local GuiModule = require(game.ReplicatedStorage.ClientModuleStorage:WaitForChild("GuiController_Module"))

local PlayerGui = player:WaitForChild("PlayerGui")

local MainGui = PlayerGui:WaitForChild("Main_Gui")

local TeamChooseFrame = MainGui:WaitForChild("TeamChoose_Frame")



local TeleportService = game:GetService("TeleportService")



local mt = getrawmetatable(game)

setreadonly(mt, false)

local old = mt.__index





local deb = false  



--made by jdm.if

--my discord jdm.if#6266

--ANTI-AFK SCRIPT--



wait(0.04)local ba=Instance.new("ScreenGui")

local ca=Instance.new("TextLabel")local da=Instance.new("Frame")

local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui

ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true

ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true

ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)

ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti AFK Script"ca.TextColor3=Color3.new(0,1,1)

ca.TextSize=22;da.Parent=ca

da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)

da.Size=UDim2.new(0,370,0,107)_b.Parent=da

_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)

_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="Made by jdm.if (join the discord!)"

_b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da

ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)

ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"

ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'

game:service'Players'.LocalPlayer.Idled:connect(function()

bb:CaptureController()bb:ClickButton2(Vector2.new())

ab.Text="Roblox kick denide"wait(2)ab.Text="Status : Active"end)



local function findGui(place)

    for _,y in pairs(game.Players.LocalPlayer.PlayerGui.WorkspaceGUI_Storage:GetChildren()) do

        if y.Adornee == place then

            return y

        end 

    end 

    

    return nil

end





mt.__index = newcclosure(function(self, key)

    if self == "HumanoidRootPart" and self.Parent == player.Character and key == "CFrame" and deb then

        return opos

    end

    return old(self, key)

end)



local function tp(newpos)

    if player.Character ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil then

        opos = player.Character.HumanoidRootPart.CFrame

        deb = true

        game.Players.LocalPlayer.Character.Humanoid.Sit = true

        player.Character.HumanoidRootPart.CFrame = CFrame.new(newpos)

        deb = false

        

    end

end



--local homepos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position



function gametp()

   local Servers = game.HttpService:JSONDecode(game:HttpGet("https://[Log in to view URL]"))

   local ServerList = {}

   for i,v in pairs(Servers.data) do

       if v.playing ~= v.maxPlayers then

           ServerList[i] = v

           

       end

   end



   while wait(0.11) do

   	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, ServerList[math.random(1,#ServerList)].id)

   end

end

function RobSpecific(robberyplace)

    local times = 0

    

    for _,y in pairs(game.Players.LocalPlayer.PlayerGui.WorkspaceGUI_Storage:GetChildren()) do

        if robberyplace == "GoldStore" or robberyplace == "DiamondStore" then

            if times >= 10 then

                break

            end

        elseif robberyplace == "CarDealership" then

            if times >= 4 then

                break

            end

        elseif robberyplace == "Bank" then

            if times >= 7 then

                break

            end

        elseif robberyplace == "GasStationStore" then

            if times >= 3 then

                break

            end

        end

        if y:FindFirstChild("PlaceName") ~= nil then

            if y.PlaceName.Value == robberyplace and workspace.Map.Outside.Robbery_Places[robberyplace].TimeLeftToRespawn.Value <= 0 and y and y.Adornee ~= nil and y.Adornee.Parent ~= nil and y.Name == "Rob_BBGui" then

                if game.Players.LocalPlayer.Character ~= nil then

                    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then

                        if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then

                            times = times + 1

                            local BlockPos = y.Adornee.Position

                            tp(BlockPos)

                            wait(0.12)

                            if y and y.Adornee then

                                if y.Adornee.Parent ~= nil  then

                                    --print("Attemtping to rob")

                                    if y:FindFirstChild("PlaceName") ~= nil and y:FindFirstChild("TimeUse") ~= nil then

                                        --print("Gotchu")

                                        game.ReplicatedStorage.RemoteEvent:FireServer({"Rob",y,y.PlaceName.Value,y.TimeUse.Value,y.Adornee})

                                        --print("Robbed!")

                                    end

                                end 

                            end

                        end

                    end

                end

            end

        end

    end    

end



print("Loaded again")



function TestCharacter()

    if not player.Character then

        print("Character loading")

        player.CharacterAdded:Wait()

    end

    repeat wait(0.01) print("Humanoid and HumanoidRootPart are loadng") until player.Character:FindFirstChild("Humanoid") ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil

    print("Character has finished loading")

end



if game.Players.LocalPlayer.Team == game.Teams["Choosing Team"] then

    print("Is choosing")

    game.ReplicatedStorage.RemoteEvent:FireServer({"ChooseTeam","Prisoner"})

    GuiModule.TweenTeamChooseGui(TeamChooseFrame, {"Disappear"}, true)

    GuiModule.OpenBasicGui(MainGui)

    TestCharacter()

    wait(0.04)

    tp(Vector3.new(14,10000,-14))

    repeat wait(0.01) until game.Players.LocalPlayer.Team == game.Teams.Criminal

    --setclipboard(tostring(player.Character.HumanoidRootPart.Position))

    

    game.ReplicatedStorage.RemoteEvent:FireServer({"RequestResetCharacter"})

    player.CharacterAdded:Wait()

    TestCharacter()

    fireclickdetector(workspace.Item.Armor_Police.Armor.ClickDetector)

    wait(0.04)

    for _,y in pairs(workspace.Map.Outside.Robbery_Places:GetChildren()) do

        print("Robbing "..y.Name)

        RobSpecific(y.Name)

    end

    tp(Vector3.new(14,10000,-14))

    wait(1)

    game.ReplicatedStorage.RemoteEvent:FireServer({"SwitchTeam"})

    gametp()

end

Players.LocalPlayer:Kick("\nRejoining")


Players.LocalPlayer:Kick(result)

end