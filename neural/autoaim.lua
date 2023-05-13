local whitelist = {"minecraft:zombie"}
local neuralNetwork = peripheral.wrap("back")

local mobs_in_area = neuralNetwork.sense()

local function fire(entity)
	local x, y, z = entity.x, entity.y, entity.z
	local pitch = -math.atan2(y, math.sqrt(x * x + z * z))
	local yaw = math.atan2(-x, z)

	neuralNetwork.fire(math.deg(yaw), math.deg(pitch), 5)
	sleep(0.2)
end


for index, value in ipairs(mobs_in_area) do
    print("Found:", value.name)
    for jndex, jalue in ipairs(whitelist) do
        if jalue == value.key then
            print("Firing on:", value.name)
            fire(value)
        end
    end
end
