------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       |||||||       |||   ||||||||           			--
--                         ||||      ||    ||     ||||         ||          				--
--                        ||  ||     ||   ||     || ||        ||                        --
--                       ||||||||    ||||||     ||||||||     ||                         --
--                      ||      ||   ||   ||        ||      ||                          --
--                     ||        ||  ||    ||       ||     ||   					    --
--                    ||          || ||     ||      ||    ||							--
--                                                                                      --
------------------------------------------------------------------------------------------
--																						--
--						  	 		   > [Functions]									--
--									   > [Arrays]		   								--
--									   > [Override]				    					--
--									   > [Adds] 										--
--									   > [Forbids] 										--
--									   > [Stance]										--
--									   > [Underbarrel] 							    	--
--									   > [Tweaks] 										--
--									   > [WIP] 											--
--																						--
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


---------------------------------------------
----<A><R><4><7> -Functions- <A><R><4><7>----
---------------------------------------------

--- Forbid Setup ---
function WeaponFactoryTweakData:arpack_setup_forbid( mod_one, mod_two )
	if self.parts[mod_one] and self.parts[mod_two] then
		self.parts[mod_one].forbids = self.parts[mod_one].forbids or {}
		table.insert(self.parts[mod_one].forbids, mod_two)
		self.parts[mod_two].forbids = self.parts[mod_two].forbids or {}
		table.insert(self.parts[mod_two].forbids, mod_one)
	else
		if not self.parts[mod_one] then
			self:ar15_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
		if not self.parts[mod_two] then
			self:ar15_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
	end
end

--- Override Base ---
function WeaponFactoryTweakData:arpack_check_override( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].override = self[mod_woa].override or {}
		else 
			self:ar15_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].override = self.parts[mod_woa].override or {}
		else 
			self:ar15_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	else
		self:ar15_write_error( "override_check", "fti", "mod_type", mod_type )
	end
end

--- Adds Base ---
function WeaponFactoryTweakData:arpack_check_adds( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].adds = self[mod_woa].adds or {}
		else 
			self:ar15_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].adds = self.parts[mod_woa].adds or {}
		else 
			self:ar15_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	else
		self:ar15_write_error( "adds_check", "fti", "mod_type", mod_type )
	end
end

--- Part Copy Base ---
--[[
function WeaponFactoryTweakData:ar15_copy_part( att_og, att_cp )
    if self.parts[att_og] then
        self.parts[att_cp] = deep_clone(self.parts[att_og])
        self.parts[att_cp].pcs = {}
        self.parts[att_cp].is_a_unlockable = true
        table.insert(self.wpn_fps_ass_stoy_556.uses_parts, att_cp)
    else
        self:ar15_write_error( "copy_part", "fti", "part", att_og )    
    end
end
]]
--- ERROR Base ---
function WeaponFactoryTweakData:ar15_write_error( func, cause, error_id, value  )
	if func and cause and error_id then 
		-- fti = failed to index
		if cause == "fti" and value then
			if error_id == "part" then
				log("AR47_ERROR: (" .. func .. ")Attempt to index Part ID: '" .. value .. "' (a nil value)")
			elseif error_id == "wpn" then
				log("AR47_ERROR: (" .. func .. ")Attempt to index Weapon ID: '" .. value .. "' (a nil value)")
			elseif error_id == "mod_type" then
				log("AR47_ERROR: (" .. func .. ")Attempt to index mod_type: '" .. value .. "' (a nil value)")
			end
		end
	end
end 

Hooks:PostHook( WeaponFactoryTweakData, "init", "AR47ModInit", function(self)

------------------------------------------
----<A><R><4><7> -Arrays- <A><R><4><7>----
------------------------------------------

--- Stocks ---

--- Handguard  ---
-- Default length --


--- Barrel ---
-- Default length --

--- Front Sights ---

--- Gas Blocks ---


--- Barrel Extensions --
local all_ar47ext = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ns_ass_pbs1",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_ass_stoy_762_md_dummy",
	"wpn_fps_ass_stoy_762_md_bca47"
}

--- Gadgets (Flashlights/Lasers) ---
local all_ar47fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Sights ---
local all_ar47sight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}
local nonacog_arsight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}


--- Grips ---

--- Compatibility Array Insertion ---
if self.wpn_fps_ass_stoy_556 then
	local all_ar15pts = {
		"wpn_fps_ass_stoy_556_st_m4a1",
		"wpn_fps_ass_stoy_556_st_m607",
		"wpn_fps_ass_stoy_556_st_m16a2",
		"wpn_fps_ass_stoy_556_pg_m16a2",
		"wpn_fps_ass_stoy_556_st_ar15",
		"wpn_fps_ass_stoy_556_pg_ar15",
		"wpn_fps_ass_stoy_556_hg_ar15",
		"wpn_fps_ass_stoy_556_hg_m16a2",
		"wpn_fps_ass_stoy_556_hg_m607",
		"wpn_fps_ass_stoy_556_hg_m4a1"
	}
	self.parts.wpn_fps_ass_stoy_556_hg_m16a2.override.wpn_fps_ass_stoy_762_gb_bca47 = {a_obj="a_gb_ar15"}
	self.parts.wpn_fps_ass_stoy_556_hg_ar15.override.wpn_fps_ass_stoy_762_gb_bca47 = {a_obj="a_gb_ar15"}
	for id, part_id in pairs(all_ar15pts) do
		table.insert(self.wpn_fps_ass_stoy_762.uses_parts, part_id)
	end
	table.insert(self.parts.wpn_fps_ass_stoy_762_ba_bca47.forbids, "wpn_fps_ass_stoy_556_hg_m16a2")
	table.insert(self.parts.wpn_fps_ass_stoy_762_ba_bca47.forbids, "wpn_fps_ass_stoy_556_hg_ar15")
	
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_hg_ar15  = {stats = {spread = 0,recoil = 2,concealment = -2}}
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_st_ar15  = {stats = {spread = 0,recoil = 1,concealment = -1}}
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_hg_m16a2 = {stats = {spread = 2,recoil = 0,concealment = -2}}
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_st_m16a2 = {stats = {spread = 1,recoil = 0,concealment = -2}}
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_hg_m607  = {stats = {spread = -1,recoil = 1,concealment = 0}}
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_st_m607  = {stats = {spread = 1,recoil = -1,concealment = -1}}
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_hg_m4a1  = {stats = {spread = 1,recoil = -1,concealment = 0}}
	self.wpn_fps_ass_stoy_762.override.wpn_fps_ass_stoy_556_st_m4a1  = {stats = {spread = -1,recoil = 1,concealment = 0}}
end
-----------------------------------------
----<A><R><4><7> -CAFCW- <A><R><4><7>----
-----------------------------------------
if BeardLib.Utils:FindMod("Custom attachments for custom weapons") then
	local cafcwsights_ar47 = {
		"wpn_fps_upg_o_acog_rmr",
		"wpn_fps_upg_o_gitsch",
		"wpn_fps_upg_o_aog",
		"wpn_fps_upg_o_rmr_riser",
		"wpn_fps_upg_o_eotech552",
		"wpn_fps_upg_o_po4",
		"wpn_fps_upg_o_st10",
		"wpn_fps_upg_o_susat",
		"wpn_fps_upg_o_okp7",
		"wpn_fps_upg_o_visionking",
		"wpn_fps_upg_o_compm2",
		"wpn_fps_upg_o_kobra",
		"wpn_fps_upg_o_compm4s",
		"wpn_fps_upg_o_m145",
		"wpn_fps_upg_o_pkas",
		"wpn_fps_upg_o_coyote",
		"wpn_fps_upg_o_hologram",
		"wpn_fps_upg_o_zeiss",
		"wpn_fps_upg_o_hd33",
		"wpn_fps_upg_o_prismatic",
		"wpn_fps_upg_o_srs",
		"wpn_fps_upg_o_hcog",
		"wpn_fps_upg_o_reflexholo",
		"wpn_fps_upg_o_elo",
		"wpn_fps_upg_o_kemper",
		"wpn_fps_upg_o_mepro",
		"wpn_fps_upg_o_rusak",
		"wpn_fps_upg_o_horzine",
		"wpn_fps_upg_o_pka",
		"wpn_fps_upg_o_anpas13d"
	}
	local cafcwgadgets_ar47 = { 
		"wpn_fps_upg_fl_ass_spotter",
		"wpn_fps_upg_fl_wml",
		"wpn_fps_upg_fl_anpeq2",
		"wpn_fps_upg_fl_dbal_d2",
		"wpn_fps_upg_fl_m600p",
		"wpn_fps_upg_fl_utg"
	}
	for id, part_id in pairs(cafcwsights_ar47) do
		if self.parts[part_id] then
			table.insert(all_ar47sight, part_id)
		end
	end
	for id, part_id in pairs(cafcwgadgets_ar47) do
		if self.parts[part_id] then
			table.insert(all_ar47fl, part_id)
		end
	end
end

if BeardLib.Utils:FindMod("gsup") then
	local AR15SneakySuppressorPack = {
		"wpn_fps_ass_ns_g_sup3",
		"wpn_fps_ass_ns_g_sup4",
		"wpn_fps_ass_ns_g_sup5"
	}
	for id, part_id in pairs(AR15SneakySuppressorPack) do
		table.insert(self.wpn_fps_ass_stoy_762.uses_parts, part_id)
		table.insert(all_ar47ext, part_id)
	end
end

if BeardLib.Utils:FindMod("Tromix Barrel-Ext") then
	table.insert(self.wpn_fps_ass_stoy_762.uses_parts, "wpn_fps_upg_ns_ass_smg_tromix")	
	table.insert(all_ar47ext, "wpn_fps_upg_ns_ass_smg_tromix")
end

if BeardLib.Utils:FindMod("M82 Muzzle Brake") then
	table.insert(all_ar47ext, "wpn_fps_upg_ns_m82")
	table.insert(all_ar47ext, "wpn_fps_upg_ns_aw50")
end

if BeardLib.Utils:FindMod("Thermal Scope") then
	table.insert(all_ar47sight, "wpn_fps_upg_o_thersig")
	table.insert(nonacog_arsight, "wpn_fps_upg_o_thersig")
end

--------------------------------------------
----<A><R><4><7> -Override- <A><R><4><7>----
--------------------------------------------

--- Barrels ---

--- Handguard ---

--FL overrides--
--self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override.wpn_fps_addon_ris = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
--for i, fl_id in pairs(all_ar15fl) do
--	if fl_id ~= "wpn_fps_addon_ris" then
--		self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[fl_id] = {a_obj="a_fl_m4a1"}
--	end
--end
--GB override--
--for id, gb_id in pairs(all_ar15gb) do
--	self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[gb_id] = {a_obj="a_gb_car15"}
--end
--MD override--
--- Lowers/Carry Handle ---
--O override--

----------------------------------------
----<A><R><4><7> -Adds- <A><R><4><7>----
----------------------------------------
for i, o_id in pairs(all_ar47sight) do
	self.wpn_fps_ass_stoy_762.adds[o_id] = {"wpn_fps_ass_stoy_762_sm_base","wpn_fps_ass_stoy_762_sm_knob"}
end
-------------------------------------------
----<A><R><4><7> -Forbids- <A><R><4><7>----
-------------------------------------------
for i, fl_id in pairs(all_ar47fl) do
	table.insert(self.parts.wpn_fps_ass_stoy_762_hg_bca47.forbids, fl_id)
end
------------------------------------------
----<A><R><4><7> -Stance- <A><R><4><7>----
------------------------------------------

--- Vanilla sights ---
-- non-acoc, default sights --
for i, o_id in pairs(nonacog_arsight) do
	self.parts[o_id].stance_mod.wpn_fps_ass_stoy_762 = {translation = Vector3(0, 7, -5.05)}
end
-- other sights --
self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_stoy_762 			  = {translation = Vector3(0, 5, -5.05)}
self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_stoy_762 		   	  = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_stoy_762 = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_stoy_762 		  = deep_clone(self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_flint)

------------------------------------------
----<A><R><4><7> -Tweaks- <A><R><4><7>----
------------------------------------------

--- Barrel Extensions ---
self.parts.wpn_fps_ass_stoy_762_md_dummy.pcs = nil

------------------------------------------
----<A><R><4><7> -CLONES- <A><R><4><7>----
------------------------------------------

---------------------------------------
----<A><R><4><7> -WIP- <A><R><4><7>----
---------------------------------------

end )
