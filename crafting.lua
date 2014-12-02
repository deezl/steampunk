
minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:wood 2',
	recipe = {'default:wood', 'default:wood', 'default:iron_lump'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:junglewood 2',
	recipe = {'default:junglewood', 'default:junglewood', 'default:iron_lump'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:fence 2',
	recipe = 
		{'default:fence_wood', 'default:fence_wood', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:glass 2',
	recipe = 
		{'default:glass', 'default:glass', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:ladder 2',
	recipe = 
		{'default:ladder', 'default:ladder', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:torch 2',
	recipe = 
		{'default:torch', 'default:torch', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:furnace 2',
	recipe = 
		{'default:furnace', 'default:furnace', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:mese 2',
	recipe = 
		{'default:mese', 'default:mese', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:cobble 2',
	recipe = 
		{'default:cobble', 'default:cobble', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:steelblock 2',
	recipe = 
		{'default:steelblock', 'default:steelblock', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:stonebrick 2',
	recipe = 
		{'default:stonebrick', 'default:stonebrick', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:brick 2',
	recipe = 
		{'default:brick', 'default:brick', 'default:iron_lump'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:brick_grey',
	recipe = 
		{'steampunk:brick', 'dye:grey'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:fence 2',
	recipe = 
		{'default:fence_wood', 'default:fence_wood', 'default:iron_lump'},
	
})

minetest.register_craft({
	output = 'steampunk:door_steampunk_wood',
	recipe = {
		{'steampunk:wood', 'steampunk:wood', ''},
		{'steampunk:wood', 'steampunk:wood', ''},
		{'steampunk:wood', 'steampunk:wood', ''},
	}
})

minetest.register_craft({
	output = 'steampunk:door_steampunk_iron',
	recipe = {
		{'steampunk:steelblock', 'steampunk:steelblock', ''},
		{'steampunk:steelblock', 'steampunk:steelblock', ''},
		{'steampunk:steelblock', 'steampunk:steelblock', ''},
	}
})

minetest.register_craft({
	output = 'steampunk:trapdoor 2',
	recipe = {
		{'steampunk:wood', 'steampunk:wood', 'steampunk:wood'},
		{'steampunk:wood', 'steampunk:wood', 'steampunk:wood'},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'steampunk:light 4',
	recipe = {
		{"default:stick", "steampunk:glass", "default:stick"},
		{"steampunk:glass", "steampunk:torch", "steampunk:glass"},
		{"default:stick", "steampunk:glass", "default:stick"},
	}
})

minetest.register_craft({
	output = 'steampunk:steelpanel 2',
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})
