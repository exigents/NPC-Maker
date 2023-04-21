--[[
  NPC Maker Documentation
  Version 1
]]--

--// REQUIRING THE MODULE
local Module = require(game:GetService("ReplicatedStorage"):WaitForChild("NPC Maker"))

--// CREATING NPCS
local NPC_Example = Module:Create({
	UserId = 1, --// The Avatar The NPC Will Be
	Name = "NPC Example" --// The Name The NPC Will Have
})

--// Changing Humanoid Properties
--[[
	NOTE: You do NOT have to include all properties, as it will set the properties you do not add to the default values.
]]--

NPC_Example:ChangeProperty({
	MaxHealth = 100, --// MaxHealth
	Health = 100, --// Health
	WalkSpeed = 16, --// WalkSpeed
	JumpPower = 50, --// JumpPower
	UseJumpPower = true, --// UseJumpPower
	JumpHeight = 7.2, --// JumpHeight (If Above Is False)
	HealthDisplayDistance = 100, --// HealthDisplay Distance
	DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer, --// DisplayDistanceType
	DisplayName = "", --// DisplayName
	HealthDisplayType = Enum.HumanoidHealthDisplayType.DisplayWhenDamaged, --// HealthDisplayType
	BreakJointsOnDeath = true, --// BreakJointsOnDeath
	RequiresNeck = true, --// Requires A Neck
	AutoRotate = true, --// Auto Rotate
	Jump = false, --// Jump
	PlatformStand = false, --// Platform Stand
	Sit = false, --// Sit
	HipHeight = 2.192, --// Hip height
	MaxSlopeAngle = 89, --// MaxSlope Angle
	AutoJumpEnabled = true, --// AutojumpEnabled
})

--// Sit | You can pass an empty table to unsit
NPC_Example:Sit({
	Sit = true --// State
})

--// Jump
NPC_Example:Jump() -- Jumps the character

--// MoveTo
local MoveTo = NPC_Example:MoveTo({
	Position = Vector3.new(0, 0, 0) --// The Position To Move The Character To
})

local Finished = MoveTo.Finished() --// Will return true once the MovedTo is finished

repeat task.wait() until Finished == true

--// Move (Sets Position Instantly)
NPC_Example:Move({
	Position = Vector3.new(0, 0, 0) --// The Position To Move The Character To
})

--// Damaging the NPC
NPC_Example:TakeDamage({
	Damage = 25 --// Amount of damage to deal
})

--// Healing the NPC
-- Pass a blank table to make it heal the NPC Fully. 
NPC_Example:Heal({
	Heal = 25 -- Amount To heal the NPC by
})

--// Attacking
-- You can pass a model that has a Humanoid In it, or pass a Humanoid Object
NPC_Example:Attack({
	Target = Players.Player1.Character,
	Damage = 25,
})

--// Destroying the NPC
NPC_Example:Destroy()
