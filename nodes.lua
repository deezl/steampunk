minetest.register_node("steampunk:bookshelf", {
	description = "Steampunk Bookshelf",
	tiles = {"steampunk_wood.png", "steampunk_wood.png", "steampunk_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steampunk:glass", {
	description = "Steampunk Glass",
	drawtype = "glasslike",
	tiles = {"steampunk_glass.png"},
	inventory_image = minetest.inventorycube("steampunk_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
	})

minetest.register_node("steampunk:fence", {
	description = "Steampunk Fence",
	drawtype = "fencelike",
	tiles = {"steampunk_wood.png"},
	paramtype = "light",
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steampunk:ladder", {
	description = "Steampunk Ladder",
	drawtype = "signlike",
	tiles = {"steampunk_ladder.png"},
	inventory_image = "steampunk_ladder.png",
	wield_image = "steampunk_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		
	},
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steampunk:wood", {
	description = "Steampunk Wooden Planks",
	tiles = {"steampunk_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steampunk:junglewood", {
	description = "Steampunk Jungle Wood Planks",
	tiles = {"steampunk_junglewood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steampunk:torch", {
	description = "Steampunk Torch",
	drawtype = "torchlike",
	tiles = {"steampunk_torch_on_floor.png", "steampunk_torch_on_ceiling.png", "steampunk_torch.png"},
	inventory_image = "steampunk_torch_on_floor.png",
	wield_image = "steampunk_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = 15,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1,hot=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})


function steampunk.get_furnace_active_formspec(pos, percent)
	local formspec =
		"size[8,9]"..
		"image[2,2;1,1;steampunk_furnace_fire_bg.png^[lowpart:"..
		(100-percent)..":steampunk_furnace_fire_fg.png]"..
		"list[current_name;fuel;2,3;1,1;]"..
		"list[current_name;src;2,1;1,1;]"..
		"list[current_name;dst;5,1;2,2;]"..
		"list[current_player;main;0,5;8,4;]"
	return formspec
end

steampunk.furnace_inactive_formspec =
	"size[8,9]"..
	"image[2,2;1,1;steampunk_furnace_fire_bg.png]"..
	"list[current_name;fuel;2,3;1,1;]"..
	"list[current_name;src;2,1;1,1;]"..
	"list[current_name;dst;5,1;2,2;]"..
	"list[current_player;main;0,5;8,4;]"

minetest.register_node("steampunk:furnace", {
	description = "Steampunk Furnace",
	tiles = {"steampunk_furnace_top.png", "steampunk_furnace_bottom.png", "steampunk_furnace_side.png",
		"steampunk_furnace_side.png", "steampunk_furnace_side.png", "steampunk_furnace_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", steampunk.furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
				return stack:get_count()
			else
				return 0
			end
		elseif listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
				return count
			else
				return 0
			end
		elseif to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

minetest.register_node("steampunk:furnace_active", {
	description = "Furnace",
	tiles = {
		"steampunk_furnace_top.png",
		"steampunk_furnace_bottom.png",
		"steampunk_furnace_side.png",
		"steampunk_furnace_side.png",
		"steampunk_furnace_side.png",
		{
			image = "steampunk_furnace_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "steampunk:furnace",
	groups = {cracky=2, not_in_creative_inventory=1,hot=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", steampunk.furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace");
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
				return stack:get_count()
			else
				return 0
			end
		elseif listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "fuel" then
			if minetest.get_craft_result({method="fuel",width=1,items={stack}}).time ~= 0 then
				if inv:is_empty("src") then
					meta:set_string("infotext","Furnace is empty")
				end
				return count
			else
				return 0
			end
		elseif to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

local function swap_node(pos,name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos,node)
end

minetest.register_abm({
	nodenames = {"steampunk:furnace","steampunk:furnace_active"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		for i, name in ipairs({
				"fuel_totaltime",
				"fuel_time",
				"src_totaltime",
				"src_time"
		}) do
			if meta:get_string(name) == "" then
				meta:set_float(name, 0.0)
			end
		end

		local inv = meta:get_inventory()

		local srclist = inv:get_list("src")
		local cooked = nil
		local aftercooked
		
		if srclist then
			cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		
		local was_active = false
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			was_active = true
			meta:set_float("fuel_time", meta:get_float("fuel_time") + 1)
			meta:set_float("src_time", meta:get_float("src_time") + 1)
			if cooked and cooked.item and meta:get_float("src_time") >= cooked.time then
				-- check if there's room for output in "dst" list
				if inv:room_for_item("dst",cooked.item) then
					-- Put result in "dst" list
					inv:add_item("dst", cooked.item)
					-- take stuff from "src" list
					inv:set_stack("src", 1, aftercooked.items[1])
				else
					--print("Could not insert '"..cooked.item:to_string().."'")
				end
				meta:set_string("src_time", 0)
			end
		end
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			local percent = math.floor(meta:get_float("fuel_time") /
					meta:get_float("fuel_totaltime") * 100)
			meta:set_string("infotext","Furnace active: "..percent.."%")
			swap_node(pos,"steampunk:furnace_active")
			meta:set_string("formspec",steampunk.get_furnace_active_formspec(pos, percent))
			return
		end

		local fuel = nil
		local afterfuel
		local cooked = nil
		local fuellist = inv:get_list("fuel")
		local srclist = inv:get_list("src")
		
		if srclist then
			cooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		if fuellist then
			fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
		end

		if not fuel or fuel.time <= 0 then
			meta:set_string("infotext","Furnace out of fuel")
			swap_node(pos,"steampunk:furnace")
			meta:set_string("formspec", steampunk.furnace_inactive_formspec)
			return
		end

		if cooked.item:is_empty() then
			if was_active then
				meta:set_string("infotext","Furnace is empty")
				swap_node(pos,"steampunk:furnace")
				meta:set_string("formspec", steampunk.furnace_inactive_formspec)
			end
			return
		end

		meta:set_string("fuel_totaltime", fuel.time)
		meta:set_string("fuel_time", 0)
		
		inv:set_stack("fuel", 1, afterfuel.items[1])
	end,
})

minetest.register_node("steampunk:cobble", {
	description = "Steampunk Cobblestone",
	tiles = {"steampunk_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("steampunk:steelblock", {
	description = "Steampunk Steel Block",
	tiles = {"steampunk_steel_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("steampunk:steelpanel", {
	description = "Steampunk Steel Panel",
	tiles = {"steampunk_steelpanel.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("steampunk:mese", {
	description = "Steampunk Mese Block",
	tiles = {"steampunk_mese.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab("steampunk wood", "steampunk:wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"steampunk_wood.png"},
		"Steampunk Wooden Stair",
		"Steampunk Wooden Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("steampunk cobble", "steampunk:cobble",
		{cracky=3},
		{"steampunk_cobble.png"},
		"Steampunk Cobblestone Stair",
		"Steampunk Cobblestone Slab",
		default.node_sound_stone_defaults())

doors.register_door("steampunk:door_steampunk_wood", {
	description = "Steampunk Wooden Door",
	inventory_image = "steampunk_door_wood.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles_bottom = {"steampunk_door_wood_lower.png", "steampunk_wood.png"},
	tiles_top = {"steampunk_door_wood_upper.png", "steampunk_wood.png"},
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
})

doors.register_door("steampunk:door_steampunk_iron", {
	description = "Steel Door",
	inventory_image = "steampunk_door_iron.png",
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2,door=1},
	tiles_bottom = {"steampunk_door_iron_lower.png", "steampunk_door_iron_upper.png"},
	tiles_top = {"steampunk_door_iron_upper.png", "steampunk_door_iron_upper.png"},
	only_placer_can_open = true,
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_node("steampunk:stonebrick", {
	description = "Steampunk Stone Brick",
	tiles = {"steampunk_stonebrick.png"},
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("steampunk:brick", {
	description = "Steampunk Brick Block",
	tiles = {"steampunk_brick.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("steampunk:brick_grey", {
	description = "Steampunk Grey Brick Block",
	tiles = {"steampunk_brick_grey.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


local function update_door(pos, node) 
	minetest.set_node(pos, node)
end

local function punch(pos)
	local meta = minetest.get_meta(pos)
	local state = meta:get_int("state")
	local me = minetest.get_node(pos)
	local tmp_node
	local tmp_node2
	oben = {x=pos.x, y=pos.y+1, z=pos.z}
		if state == 1 then
			state = 0
			minetest.sound_play("door_close", {pos = pos, gain = 0.3, max_hear_distance = 10})
			tmp_node = {name="steampunk:trapdoor", param1=me.param1, param2=me.param2}
		else
			state = 1
			minetest.sound_play("door_open", {pos = pos, gain = 0.3, max_hear_distance = 10})
			tmp_node = {name="steampunk:trapdoor_open", param1=me.param1, param2=me.param2}
		end
		update_door(pos, tmp_node)
		meta:set_int("state", state)
end

minetest.register_node("steampunk:trapdoor", {
	description = "Trapdoor",
	inventory_image = "steampunk_trapdoor.png",
	drawtype = "nodebox",
	tiles = {"steampunk_trapdoor.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	sounds = default.node_sound_wood_defaults(),
	drop = "steampunk:trapdoor",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
	},
	on_creation = function(pos)
		state = 0
	end,
	on_rightclick = function(pos, node, clicker)
		punch(pos)
	end,
})

minetest.register_node("steampunk:trapdoor_open", {
	drawtype = "nodebox",
	tiles = {"steampunk_trapdoor.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	pointable = true,
	stack_max = 0,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	climbable = true,
	sounds = default.node_sound_wood_defaults(),
	drop = "steampunk:trapdoor",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.4, 0.5, 0.5, 0.5}
	},
	on_rightclick = function(pos, node, clicker)
		punch(pos)
	end,
})

minetest.register_node("steampunk:table", {
	description = "Steampunk Table",
	tiles = {"steampunk_table_top.png", "steampunk_table.png", "steampunk_table.png", "steampunk_table.png", "steampunk_table.png", "steampunk_table.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steampunk:light",{
	drawtype = "glasslike",
	description = "Light Block",
	sunlight_propagates = true,
	light_source = 14,
	tiles = {"steampunk_light.png"},
	groups = {cracky=2},
	paramtype = "light",
})











--[[xpanes.register_pane(":steampunk_bar", {
	description = "Steampunk_Iron bar",
	tiles = {"xpanes_space.png"},
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	pointable = false,
	diggable = true,
	buildable_to = false,
	air_equivalent = true,
	textures = {"steampunk_bar.png","steampunk_bar.png","xpanes_space.png"},
	inventory_image = "steampunk_bar.png",
	wield_image = "steampunk_bar.png",
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		update_pane(pos, "bar")
	end,
})]]--