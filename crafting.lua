
minetest.register_craft({
	output = 'steampunk:wood 4',
	recipe = {
	      {'default:wood', '', 'default:wood'},
	      {'', 'steel_ingot', ''},
	      {'default:wood', '', 'default:wood'},
	}
})

minetest.register_craft({
	output = 'steampunk:junglewood 4',
	recipe = {
	  {'default:junglewood', '', 'default:junglewood'},
	  {'', 'default:steel_ingot', ''},
	  {'default:junglewood', '', 'default:junglewood'},
	}
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
		{'default:steelblock', 'dye:black'},
	
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:stonebrick 2',
	recipe = 
		{'default:stonebrick', 'default:stonebrick', 'dye:black'},
	
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
		{'default:wood', 'steampunk:wood', ''},
		{'steampunk:wood', 'default:wood', ''},
		{'default:wood', 'steampunk:wood', ''},
	}
})

minetest.register_craft({
	output = 'steampunk:door_steampunk_iron',
	recipe = {
		{'steampunk:wood', 'default:steel_ingot', ''},
		{'steampunk:wood', 'default:steel_ingot', ''},
		{'steampunk:wood', 'default:steel_ingot', ''},
	}
})

minetest.register_craft({
	output = 'steampunk:trapdoor',
	recipe = {
		{'default:stick', '', 'default:stick'},
		{'', 'steampunk:wood', ''},
		{'default:stick', '', 'default:stick'},
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
	output = 'steampunk:steelpanel 4',
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:wood", "default:wood", "default:wood"},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:glass_black',
	recipe = 
		{"steampunk:glass", "dye:black"},
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:glass_blue',
	recipe = 
		{"steampunk:glass", "dye:blue"},

})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:glass_green',
	recipe = 
		{"steampunk:glass", "dye:dark_green"},

})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:glass_red',
	recipe = 
		{"steampunk:glass", "dye:red"},
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:glass_magenta',
	recipe = 
		{"steampunk:glass", "dye:magenta"},
})

minetest.register_craft({
	type = "shapeless",
	output = 'steampunk:glass_purple',
	recipe = 
		{"steampunk:glass", "dye:violet"},
})

minetest.register_craft({
	output = 'steampunk:bookshelf 2',
	recipe = {
		 {'steampunk:wood', 'default:wood', 'steampunk:wood'},
		 {'default:book', 'default:book', 'default:book'},
		 {'steampunk:wood', 'default:wood', 'steampunk:wood'},
	}
})

minetest.register_craft({
		output = "stairs:stair_steampunk_wood 6",
		recipe = {
			{"steampunk:wood", "", ""},
			{"steampunk:wood", "steampunk:wood", ""},
			{"steampunk:wood", "steampunk:wood", "steampunk:wood"},
		},
	})
	

	minetest.register_craft({
		output = "stairs:stair_steampunk_junglewood 6",
		recipe = {
			{"", "", "steampunk:junglewood"},
			{"", "steampunk:junglewood", "steampunk:junglewood"},
			{"steampunk:junglewood", "steampunk:junglewood", "steampunk:junglewood"},
		},
	})

	minetest.register_craft({
		output = "stairs:stair_steampunk_cobble 6",
		recipe = {
			{"", "", "steampunk:cobble"},
			{"", "steampunk:cobble", "steampunk:cobble"},
			{"steampunk:cobble", "steampunk:cobble", "steampunk:cobble"},
		},
	})
	
minetest.register_craft({
		output = "stairs:slab_steampunk_wood 6",
		recipe = {
			{"steampunk:wood", "steampunk:wood", "steampunk:wood"},
		},
	})
	
minetest.register_craft({
		output = "stairs:slab_steampunk_cobble 6",
		recipe = {
			{"steampunk:cobble", "steampunk:cobble", "steampunk:cobble"},
		},
	})
	

	
minetest.register_craft({
		output = "stairs:slab_steampunk_junglewood 6",
		recipe = {
			{"steampunk:junglewood", "steampunk:junglewood", "steampunk:junglewood"},
		},
	})

minetest.register_craft({
	output = 'steampunk:copperblock',
	recipe = {
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
		{"default:copper_ingot", "steampunk:wood", "default:copper_ingot"},
		{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"},
	}
})

minetest.register_craft({
	output = 'steampunk:copperblock_r',
	recipe = {
		{"default:stick", "", "default:stick"},
		{"", "steampunk:copperblock", ""},
		{"default:stick", "", "default:stick"},
	}
})

minetest.register_craft({
	output = 'steampunk:table 2',
	recipe = {
		{"", "steampunk:glass_purple", ""},
		{"", "steampunk:wood", ""},
		{"default:stick", "", "default:stick"},
	}
})