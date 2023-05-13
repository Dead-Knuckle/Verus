local network = peripheral.wrap("back")
local canvas = network.canvas3d().create()

RUN = true
FLIP = true

local block_color = {

    --Traps
    ["minecraft:tnt"] = 0xFE938CFF,
    ["minecraft:activator_rail"] = 0xEFC69BFF,


    --ETC
    ["minecraft:amethyst_block"] = 0x858AE3FF,
    ["minecraft:ancient_debris"] = 0x373F51FF,

    --Ore Groups
    ["minecraft:diamond_ore"] = 0x6CD4FFFF,
    ["minecraft:deepslate_diamond_ore"] = 0x6CD4FFFF,

    ["minecraft:emerald_ore"] = 0x82C09AFF,
    ["minecraft:deepslate_emerald_ore"]= 0x82C09AFF,

    
    ["minecraft:gold_ore"] = 0xE3B23CFF,
    ["minecraft:deepslate_gold_ore"] = 0xE3B23CFF,
    ["minecraft:nether_gold_ore"] = 0xE3B23CFF,

    ["minecraft:iron_ore"] = 0xC1BFB5FF,
    ["minecraft:deepslate_iron_ore"] = 0xC1BFB5FF,
}




local block_names = {}


for key, value in pairs(block_color) do
    table.insert(block_names, key)
end


local found_blocks = {}




local function createBox(vectorList, controlList, color)
    local boxes = canvas.addBox(vectorList[1], vectorList[2], vectorList[3], controlList[1], controlList[2], controlList[3], color)
    boxes.setDepthTested(false)
end




local function terminalClear()
    term.clear()
    term.setCursorPos(1,1)
end

local function find_block(blockList)
    local counter = 0
    local blocks = network.scan()
    
    for i = 1,#blocks, 1 do
        
        for j = 1,#blockList do
            
            if blocks[i].name == blockList[j] then
                counter = counter + 1
                table.insert(found_blocks, counter, blocks[i])
            end
        end
    end
end

local function find_mobs(mobList)
    local counter = 0
    local mobs = network.sense()
    
    for i = 1,#mobs, 1 do
        
        for j = 1,#mobList do
            
            if mobs[i].key == mobList[j] then
                counter = counter + 1
                table.insert(found_mobs, counter, mobs[i])
            end
        end
    end
end


local function quitProgram()
    while true do
        local event, key = os.pullEvent("key")
        if key == keys.p then
            network.canvas3d().clear()
            terminalClear()
            RUN = false
            return
        end
    end
end

function MAIN()
    while RUN do

        find_block(block_names)
        print("  ___  ___   _   ___   ___  ___ ")
        print(" |   \\| __| /_\\ |   \\ / _ \\/ __|")
        print(" | |) | _| / _ \\| |) | (_) \\__ \\")
        print(" |___/|___/_/ \\_\\___/_\\___/|___/")
        print("                   |___|       ")
        print("Press 'p' to quit the program.")
        if FLIP then
            print("Program status : \\\n")
            FLIP = not FLIP
        else
            print("Program status : /\n")
            FLIP = not FLIP
        end
        for i, block in ipairs(found_blocks) do
            print(i .. ": " .. block.name.. ": " .. block.x .. "," .. block.y .. ",".. block.z)
            createBox({block.x,block.y, block.z}, {0.5,0.5,0.5}, block_color[block.name])
        end
        

        found_blocks={}

        sleep(0.001)
        network.canvas3d().clear()
        canvas = network.canvas3d().create()
        terminalClear()
    end
end


terminalClear()
textutils.slowPrint("  ___  ___   _   ___   ___  ___ ")
textutils.slowPrint(" |   \\| __| /_\\ |   \\ / _ \\/ __|")
textutils.slowPrint(" | |) | _| / _ \\| |) | (_) \\__ \\")
textutils.slowPrint(" |___/|___/_/ \\_\\___/_\\___/|___/")
print("                   |___|       ")
sleep(1)
print("Press 'p' to quit the program.")
sleep(1)



parallel.waitForAny(MAIN, quitProgram)