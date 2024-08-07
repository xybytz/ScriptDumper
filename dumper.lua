local clock = tick()
local x = 0
function Write(txt)
	if Drawing ~= nil or Drawing.new ~= nil then
		local Text = Drawing.new("Text")
		Text.Visible = true
		Text.Transparency = 1
		Text.Color = Color3.fromRGB(255,255,255)
		Text.Text = txt
		Text.Size = 18
		Text.Center = true
		Text.Outline = true
		Text.OutlineColor = Color3.fromRGB(0,0,0)
		Text.Position = Vector2.new(672,696)
		Text.Font = Drawing.Fonts.System
		return Text
	end
end
local Text = Write("Making Script Dumper folder. (Game ID: "..tostring(game.PlaceId)..")")
local id = game.PlaceId
makefolder("ScriptDumper-"..id)
local name = "ScriptDumper-"..id
makefolder(name.."/Workspace")
makefolder(name.."/ReplicatedStorage")
makefolder(name.."/ReplicatedFirst")
makefolder(name.."/Players")
makefolder(name.."/StarterGui")
makefolder(name.."/StarterPack")
makefolder(name.."/LocalPlayer")
makefolder(name.."/LocalPlayer/Backpack")
makefolder(name.."/LocalPlayer/PlayerGui")
makefolder(name.."/LocalPlayer/Character")
function save(dirpath,inst)
	if inst:IsA("LocalScript") or inst:IsA("ModuleScript") then
		local suc, err = pcall(function() decompile(inst) end)
		local src = suc == true and decompile(inst) or suc == false and "-- Failed to decompile, reason: "..err
		writefile(name.."/"..dirpath.."/"..inst.Name.." (CLIENT("..inst.ClassName..")).lua","--"..inst:GetFullName().."\n"..src)
	elseif inst:IsA("Script") then
		writefile(name.."/"..dirpath.."/"..inst.Name.." (SERVER).lua","--"..inst:GetFullName().."\n-- ServerScripts (Script) can not be decompiled.")
	end
end
wait(1)
Text.Text = "Saving."
wait(0.5)
for i,v in pairs(workspace:GetDescendants()) do
	save("Workspace",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
	save("ReplicatedStorage",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
for i,v in pairs(game:GetService("ReplicatedFirst"):GetDescendants()) do
	save("ReplicatedFirst",v)
	if v:IsA("LocalScript") or v:IsA("Folder")  or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
for i,v in pairs(game:GetService("Players"):GetDescendants()) do
	save("Players",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
end
for i,v in pairs(game:GetService("StarterGui"):GetDescendants()) do
	save("StarterGui",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
for i,v in pairs(game:GetService("StarterPack"):GetDescendants()) do
	save("StarterPack",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
	save("LocalPlayer/Backpack",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
	save("LocalPlayer/PlayerGui",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
	save("LocalPlayer/Character",v)
	if v:IsA("LocalScript") or v:IsA("Folder") or v:IsA("ModuleScript") then
		Text.Text = "Saved "..v.Name.." ("..v:GetFullName()..")"
		x += 1
	end
	game:GetService("RunService").RenderStepped:wait()
end
Text.Text = "Completely saved, enjoy! (Please check ur exploit's workspace folder)"
wait(2)
Text.Text = "Folder Name (result): "..name..", instances saved: "..x..", took time: "..tostring(tick() - clock)
wait(5)
Text:Destroy()
