# Veruses: Minecraft Challenge 



## `finder.lua`
`finder.lua` is a minecraft Block Scanner

This Lua script allows you to scan for specific types of blocks in your Minecraft world and display them on a 3D canvas.
How to Use

    Connect a ComputerCraft or other compatible computer to the same network as your Minecraft server and attach a Wireless Modem to it.
    Open the Lua interpreter and paste the code from scanner.lua into it.
    Modify the block_color table to include the types of blocks you want to scan for and the colors you want them to be displayed in.
    Run the script with os.run("scanner.lua").
    The script will scan for the specified blocks and display them on the 3D canvas. Press 'p' to quit the program.

Configuration

You can modify the block_color table to include any block types you want to scan for. The keys of the table should be the names of the blocks, and the values should be the colors you want them to be displayed in. You can find a list of block names in the Minecraft Gamepedia.
Credits

This script was created by Dead_Knuckle. Feel free to modify and redistribute it as you see fit.
