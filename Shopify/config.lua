
--[[
This is where you specify the items and prices in individual categories

There is a max of 9 categories

The first item in each category is the display item for that category.

There is a max of 27 Items in each category (Excluding the Category Icon)

]]
function CategoryList()
	local Table = {
		{
			{"Misc", E_ITEM_LAVA_BUCKET},
			{E_ITEM_LAVA_BUCKET, 10000},
			{E_ITEM_LEAD, 250},
			{E_ITEM_RABBITS_FOOT, 2500},
			{E_BLOCK_ANVIL, 2000},
			{E_BLOCK_ENDER_CHEST, 10000},
			{E_BLOCK_SPONGE, 500},
			{E_ITEM_BOOK, 50},
			{E_ITEM_BOOK_AND_QUILL, 150},
			{E_ITEM_BOTTLE_O_ENCHANTING, 250, 16},
			{E_ITEM_CLOCK, 100},
			{E_ITEM_COOKIE, 10000000},
			{E_ITEM_EGG, 300, 16},
			{E_ITEM_EMPTY_MAP, 200},
			{E_ITEM_NAME_TAG, 300},
			{E_ITEM_SADDLE, 100},
		},
		{
			{"Redstone", E_BLOCK_BLOCK_OF_REDSTONE},
			{E_ITEM_REDSTONE_DUST, 50, 8},
			{E_ITEM_REDSTONE_REPEATER, 25, 4},
			{E_BLOCK_REDSTONE_TORCH_ON, 50, 8},
			{E_BLOCK_REDSTONE_LAMP_OFF, 100},
			{E_BLOCK_DISPENSER, 100},
			{E_BLOCK_DROPPER, 50},
			{E_BLOCK_ACTIVATOR_RAIL, 1000, 16},
			{E_BLOCK_POWERED_RAIL, 1000, 16},
			{E_BLOCK_RAIL, 100, 16},
			{E_BLOCK_HOPPER, 1000},
			{E_BLOCK_NOTE_BLOCK, 200},
			{E_BLOCK_PISTON, 50},
			{E_BLOCK_STICKY_PISTON, 50},
			{E_BLOCK_SLIME_BLOCK, 100, 8},
		},
		{
			{"Farming", E_ITEM_BEETROOT},
			{E_ITEM_BEETROOT_SEEDS, 100, 16},
			{E_BLOCK_CACTUS, 100, 16},
			{E_ITEM_CARROT, 100, 16},
			{E_ITEM_CHORUS_FRUIT, 100, 16},
			{E_BLOCK_SAPLING, 10, 8},
			{E_ITEM_SUGARCANE, 100, 16},
			{E_ITEM_MELON_SLICE, 20, 16},
			{E_ITEM_NETHER_WART, 100, 16},
			{E_ITEM_POTATO, 100, 16},
			{E_ITEM_SEEDS, 100, 16},
			{E_ITEM_WHEAT, 100, 16},
		},
		{
			{"Blocks", E_BLOCK_BONE_BLOCK},
			{E_BLOCK_BOOKCASE, 10},
			{E_BLOCK_CONCRETE_POWDER, 50, 16},
			{E_BLOCK_END_BRICKS, 50, 16},
			{E_BLOCK_END_ROD, 50, 16},
			{E_BLOCK_GLASS, 50, 16},
			{E_BLOCK_GLOWSTONE, 50, 16},
			{E_BLOCK_GRAVEL, 50, 16},
			{E_BLOCK_HARDENED_CLAY, 50, 16},
			{E_BLOCK_ICE, 50, 16},
			{E_BLOCK_LOG, 50, 16},
			{E_BLOCK_PACKED_ICE, 50, 16},
			{E_BLOCK_PRISMARINE_BLOCK, 50, 16},
			{E_BLOCK_PURPUR_BLOCK, 50, 16},
			{E_BLOCK_QUARTZ_BLOCK, 50, 16},
			{E_BLOCK_RED_SANDSTONE, 50, 16},
			{E_BLOCK_SANDSTONE, 50, 16},
			{E_BLOCK_SAND, 50, 16},
			{E_BLOCK_SEA_LANTERN, 50, 16},
			{E_BLOCK_SNOW_BLOCK, 50, 16},
			{E_BLOCK_SOULSAND, 50, 16},
			{E_BLOCK_STAINED_CLAY, 50, 16},
			{E_BLOCK_STAINED_GLASS, 50, 16},
			{E_BLOCK_WOOL, 50, 16},
			{E_BLOCK_WHITE_GLAZED_TERRACOTTA, 50, 16},
			{E_BLOCK_BONE_BLOCK, 50, 16},
		},
		{
			{"Mob Drops", E_ITEM_SPIDER_EYE},
			{E_ITEM_ARROW, 30, 64},
			{E_ITEM_BLAZE_ROD, 50, 16},
			{E_ITEM_BONE, 50, 16},
			{E_ITEM_ENDER_PEARL, 50, 16},
			{E_ITEM_FEATHER, 50, 16},
			{E_ITEM_FERMENTED_SPIDER_EYE, 50, 16},
			{E_ITEM_GHAST_TEAR, 50, 16},
			{E_ITEM_GUNPOWDER, 50, 16},
			{E_ITEM_MAGMA_CREAM, 50, 16},
			{E_ITEM_SLIMEBALL, 50, 16},
			{E_ITEM_SPIDER_EYE, 50, 16},
			{E_ITEM_STRING, 50, 16},
		},
		{
			{"Tools and Armor", E_ITEM_DIAMOND_AXE},
			{E_ITEM_STONE_AXE, 50},
			{E_ITEM_STONE_PICKAXE, 50},
			{E_ITEM_STONE_SHOVEL, 50},
			{E_ITEM_STONE_SWORD, 50},
			{E_ITEM_BOW, 50},
			{E_ITEM_CHAIN_BOOTS, 200},
			{E_ITEM_CHAIN_LEGGINGS, 200},
			{E_ITEM_CHAIN_CHESTPLATE, 200},
			{E_ITEM_CHAIN_HELMET, 200},
			
			{E_ITEM_IRON_AXE, 200},
			{E_ITEM_IRON_PICKAXE, 200},
			{E_ITEM_IRON_SHOVEL, 200},
			{E_ITEM_IRON_SWORD, 200},
			{E_ITEM_ARROW, 30, 64},
			{E_ITEM_IRON_BOOTS, 1000},
			{E_ITEM_IRON_LEGGINGS, 1000},
			{E_ITEM_IRON_CHESTPLATE, 1000},
			{E_ITEM_IRON_HELMET, 1000},
			
			{E_ITEM_DIAMOND_AXE, 1000},
			{E_ITEM_DIAMOND_PICKAXE, 1000},
			{E_ITEM_DIAMOND_SHOVEL, 1000},
			{E_ITEM_DIAMOND_SWORD, 1000},
			{E_ITEM_FLINT_AND_STEEL, 30},
			{E_ITEM_DIAMOND_BOOTS, 5000},
			{E_ITEM_DIAMOND_LEGGINGS, 5000},
			{E_ITEM_DIAMOND_CHESTPLATE, 5000},
			{E_ITEM_DIAMOND_HELMET, 5000},
		},
		
	}
	for K = 1,#Table do
		for T = 1,#Table[K] do
			if Table[K][T][3] == nil then
				Table[K][T][3] = 1
			end
		end
	end
	return Table
end