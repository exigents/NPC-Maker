--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Vars
local Map = workspace:FindFirstChild("Map")
local Points = Map:FindFirstChild("Points")
local Base = Map:FindFirstChild("Base")

local NPCMaker = require(ReplicatedStorage:WaitForChild("NPC Maker"))

local RealPointsCFrames = {}
local RealPointsVectors = {}


for i,v in pairs(Points:GetChildren()) do
	RealPointsCFrames[v:FindFirstChild("Order").Value] = v.CFrame
	RealPointsVectors[v:FindFirstChild("Order").Value] = v.Position

	v:Destroy()
end

repeat task.wait() until #RealPointsCFrames > 0 and #RealPointsVectors > 0

for i = 0, 10, 1 do
	local NPC = NPCMaker:Create({
		UserId = 266723646,
		Name = "Enemy1",
	})


	NPC:Move({
		Position = RealPointsCFrames[1]
	})

	for i,v in pairs(RealPointsVectors) do
		if i ~= 1 then
			local Moving = NPC:MoveTo({
				Position = v
			})

			local Moved = Moving.Finished()
			repeat task.wait() until Moved == true
		end
	end

	NPC:Attack({
		Target = Base,
		Damage = 10,
	})
	NPC:Destroy()
end
