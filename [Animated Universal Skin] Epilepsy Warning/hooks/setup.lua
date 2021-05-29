if not _G.AnimatedSkinFramework then
	log("ERROR: Animated Skin Framework missing.")
	return
else
	AnimatedSkinFramework.skin_data = AnimatedSkinFramework.skin_data or {}
end

--Epilepsy Warning Legacy
local skin_id = "epilepsy_legacy"
AnimatedSkinFramework.skin_data[skin_id] = {
	frequency = 4,
	preset = "sawtooth_up",--Wear goes from 0 to 1 (Battle-Worn -> Mint-Condition)
	max_quality = 1,
	min_quality = 0
}

--Epilepsy Warning New
local skin_id = "epilepsy_warning"
AnimatedSkinFramework.skin_data[skin_id] = {
	idx = 1,--Custom data, not part of ASF
	loops = {}--Custom data, not part of ASF
}

--Set up music data
dofile(ModPath .. "hooks/loop_data.lua")

--Set total loops. Custom data, not part of ASF
AnimatedSkinFramework.skin_data[skin_id].total_loops = #AnimatedSkinFramework.skin_data[skin_id].loops

--Register list of hook IDs so ASF can remove them if the skin isn't equipped.
AnimatedSkinFramework.hooks[skin_id] = {
	post = {
		skin_id .. "_post_PlayerStandard_start_action_equip_weapon"
	}
}

--Simple synced wear
local function wear_simple(t, bpm)
	local f = bpm/60
	local min_q = 0
	local max_q = 1
	return AnimatedSkinFramework:calc_wear_sawtooth_up(t, f, min_q, max_q)
end

--Custom synced wear
local function wear_custom(t, times)
	local start_time
	local end_time
	local preset
	for idx, t_end in ipairs(times) do
		if t < t_end then
			start_time = times[idx-1]
			end_time = t_end
			break
		end
	end
	--Just in case
	if not start_time or not end_time then
		return 1
	end
	--Progress
	local progress = (t - start_time) / (end_time - start_time)
	return progress
end

--Main handler
local function cf_main(t, ...)
	local asf_data = AnimatedSkinFramework.skin_data[skin_id]
	
	local start_time = asf_data.start_time
	local idx = asf_data.idx or 1
	local loop = asf_data.loops[idx]
	
	if not start_time or t - start_time > 60/loop.bpm*loop.bars then
		managers.player:local_player():sound():play(loop.id, loop.id)
		start_time = t
		asf_data.start_time = start_time
	end
	
	local real_t = t - start_time
	local wear
	if loop.times then
		wear = wear_custom(real_t, loop.times)
	else
		wear = wear_simple(real_t, loop.bpm)
	end
	return wear
end

--Stop sound
local function stop_sound()
	local asf_data = AnimatedSkinFramework.skin_data[skin_id]
	local idx = asf_data.idx or 1
	local loop = asf_data.loops[idx]
	managers.player:local_player():sound():stop(loop.id)
	asf_data.start_time = nil
end

--Next loop
local function next_sound()
	local asf_data = AnimatedSkinFramework.skin_data[skin_id]
	local idx = asf_data.idx or 1
	local loop = asf_data.loops[idx]
	managers.player:local_player():sound():stop(loop.id)
	local total_loops = asf_data.total_loops or #asf_data.loops
	idx = (idx % total_loops) + 1
	asf_data.idx = idx
	asf_data.start_time = nil
end

--Add custom function to ASF
AnimatedSkinFramework.skin_data[skin_id].custom_func = cf_main--Will be called every frame by ASF
AnimatedSkinFramework.skin_data[skin_id].stop_sound = stop_sound--Custom data, not part of ASF
AnimatedSkinFramework.skin_data[skin_id].next_sound = next_sound--Custom data, not part of ASF
