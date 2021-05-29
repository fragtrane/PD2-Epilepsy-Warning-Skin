if not _G.AnimatedSkinFramework then
	return
end

local skin_id = "epilepsy_warning"

--Stop sound when switching weapons if the other gun has a different skin.
Hooks:PostHook(PlayerStandard, "_start_action_equip_weapon", skin_id .. "_post_PlayerStandard_start_action_equip_weapon", function()
	--log(skin_id .. "_post_PlayerStandard_start_action_equip_weapon")
	
	local asf_data = AnimatedSkinFramework and AnimatedSkinFramework.skin_data and AnimatedSkinFramework.skin_data[skin_id]
	local weap_base = AnimatedSkinFramework:get_equipped_weap_base()
	--If new skin does not match, stop music. Otherwise, go to next song.
	local new_skin = weap_base and weap_base:get_cosmetics_id()
	if asf_data then
		if skin_id ~= new_skin then
			asf_data.stop_sound()
		else
			asf_data.next_sound()
		end
	end
end)
