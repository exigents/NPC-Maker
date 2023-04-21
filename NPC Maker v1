local Players = game:GetService("Players")

local NPC = {}
local NPCFolder = workspace:WaitForChild("NPCs")

function NPC:ValidateOptions(Defaults, Options)
	for i,v in pairs(Defaults) do
		if Options[i] == nil then
			Options[i] = v
		end
	end
	return Options
end

function NPC:Create(Options)
	local Options = Options or {}
	Options = NPC:ValidateOptions({
		UserId = 1,
		Name = "NPC",
		StartPos = Vector3.new(0, 0, 0)
	}, Options)
	
	local HumanoidDesc = Players:GetHumanoidDescriptionFromUserId(Options["UserId"])
	local Character = Players:CreateHumanoidModelFromDescription(HumanoidDesc, Enum.HumanoidRigType.R15, Enum.AssetTypeVerification.ClientOnly)
	
	Character.Name = Options["Name"]
	
	Character.Parent = NPCFolder
	
	repeat wait() until Character.Parent == NPCFolder
	
	local self = {}
	
	function self:TakeDamage(Options)
		local Options = Options or {}
		Options = NPC:ValidateOptions({
			Damage = 0,
		}, Options)
		
		Character:FindFirstChild("Humanoid"):TakeDamage(tonumber(Options["Damage"]) or 0)
	end
	
	function self:Heal(Options)
		local Options = Options or {}
		Options = NPC:ValidateOptions({
			Heal = Character:FindFirstChild("Humanoid").MaxHealth - Character:FindFirstChild("Humanoid").Health,
		}, Options)
		
		Character:FindFirstChild("Humanoid").Health = Character:FindFirstChild("Humanoid").Health + Options["Heal"]
	end
	
	function self:Move(Options)
		local Options = Options or {}
		Options = NPC:ValidateOptions({
			Position = nil,
		}, Options)
		
		if Options["Position"] ~= nil then
			Character:SetPrimaryPartCFrame(Options["Position"])
		end
	end
	
	function self:MoveTo(Options)
		local Options = Options or {}
		Options = NPC:ValidateOptions({
			Position = Character.PrimaryPart.Position,
		}, Options)
		
		Character:FindFirstChildWhichIsA("Humanoid"):MoveTo(Options["Position"])
		local MovedTo = {}
		
		function MovedTo:Finished()
			Character:FindFirstChildWhichIsA("Humanoid").MoveToFinished:Wait()
			
			return true
		end
		
		return MovedTo
	end
	
	function self:Jump()
		Character:FindFirstChild("Humanoid").Jump = true
		task.wait(0.2)
		Character:FindFirstChild("Humanoid").Jump = false
	end
	
	function self:Sit(Options)
		local Options = Options or {}
		Options = NPC:ValidateOptions({
			Sit = false,
		}, Options)
		
		Character:FindFirstChild("Humanoid").Sit = Options["Sit"]
	end
	
	function self:ChangeProperty(Options)
		local Options = Options or {}
		Options = NPC:ValidateOptions({
			MaxHealth = 100,
			Health = 100,
			WalkSpeed = 16,
			JumpPower = 50,
			UseJumpPower = true,
			HealthDisplayDistance = 100,
			DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer,
			DisplayName = "",
			HealthDisplayType = Enum.HumanoidHealthDisplayType.DisplayWhenDamaged,
			BreakJointsOnDeath = true,
			RequiresNeck = true,
			AutoRotate = true,
			Jump = false,
			PlatformStand = false,
			Sit = false,
			HipHeight = 2.192,
			MaxSlopeAngle = 89,
			AutoJumpEnabled = true,
			JumpHeight = 7.2
		}, Options)
		
		for Option, Value in pairs(Options) do
			Character:FindFirstChild("Humanoid")[Option] = Value
		end
	end
	
	function self:Attack(Options)
		local Options = Options or {}
		Options = NPC:ValidateOptions({
			Target = nil,
			Damage = nil,
		}, Options)
		
		if Options["Target"] ~= nil then
			if Options["Target"]:IsA("Model") then
				Options["Target"]:FindFirstChildWhichIsA("Humanoid"):TakeDamage(tonumber(Options["Damage"]) or 0)
			elseif Options["Target"]:IsA("Humanoid") then
				Options["Taget"]:TakeDamage(tonumber(Options["Damage"]) or 0)
			end
		end
	end
	
	function self:Destroy()
		Character:Destroy()
		self = {}
	end
	
	return self
end

return NPC
