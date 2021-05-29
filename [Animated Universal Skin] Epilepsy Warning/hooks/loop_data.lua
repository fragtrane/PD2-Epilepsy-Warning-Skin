local skin_id = "epilepsy_warning"

--SunStroke Project & Olia Tira - Run Away
--Syncs on beat so we don't need to specify times
table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_sax",
	bpm = 130,
	bars = 16
})

--Dimitri Vegas, Martin Garrix, Like Mike - Tremor
local tremor_beats = {
	--Bar 1-4
	0,
	1,
	2,
	3,
	--Bar 5-8
	4,
	4.5,
	5,
	5.5,
	6,
	--Bar 9-12 (same as 1-4)
	8,
	9,
	10,
	11,
	--Bar 13-16
	12,
	12.5,
	13,
	13.5,
	14,
--	15,--Remove?
	--End
	16
}
--Turn beats into time
for k, v in pairs(tremor_beats) do
	local bpm = 128
	tremor_beats[k] = v / bpm * 60
end

table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_tremor",
	bpm = 128,
	bars = 16,
	times = tremor_beats
})

--Noisestorm - Crab Rave
local crab_beats = {
	--Bar 1-4
	0,
	0.5,
	1,
	1.5,
	1.75,
--	2.25,
	2.5,
	3,
	3.5,
	3.75,
	--Bar 5-8
--	4.25,
	4.5,
	5,
	5.5,
	5.75,
--	6.25,
	6.75,
	7.25,
	7.5,
	--Bar 9-12 (same as 1-4)
	8,
	8.5,
	9,
	9.5,
	9.75,
--	10.25,
	10.5,
	11,
	11.5,
	11.75,
	--Bar 13-16 (same as 5-8)
--	12.25,
	12.5,
	13,
	13.5,
	13.75,
--	14.25,
	14.75,
	15.25,
	15.5,
	--End
	16
}
--Turn beats into time
for k, v in pairs(crab_beats) do
	local bpm = 125
	crab_beats[k] = v / bpm * 60
end

table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_crab",
	bpm = 125,
	bars = 16,
	times = crab_beats
})

--Marshmello - Alone
--Flashes twice per beat so we can just double bpm and bars instead of specifying times
table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_alone",
	bpm = 142*2,--Double it
	bars = 16*2--Double it
})

--Manian - Ravers Fantasy
local ravers_beats = {
	--Bar 1-4
	0,
	1,
	1.5,
	2,
	2.5,
	3.5,
	--Bar 5-8
	5,
	5.5,
	6,
	6.5,
	7,
	7.5,
	--Bar 9-12 (same as 1-4)
	8,
	9,
	9.5,
	10,
	10.5,
	11.5,
	--Bar 13-16 (same as 5-8)
	13,
	13.5,
	14,
	14.5,
	15,
	15.5,
	--End
	16
}
--Turn beats into time
for k, v in pairs(ravers_beats) do
	local bpm = 146
	ravers_beats[k] = v / bpm * 60
end

table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_ravers",
	bpm = 146,
	bars = 16,
	times = ravers_beats
})

--Skrillex - Bangarang (ft. Sirah)
local bangarang_beats = {
	--Bar 1-4
	0,
	1,
	2,
	2.5,
	2.75,
	3,
	--Bar 5-8
	4,
	4.25,
	4.5,
	4.75,
	5,
	5.25,
	5.5,
	6,
	7,
	--Bar 9-12 (same as 1-4)
	8,
	9,
	10,
	10.5,
	10.75,
	11,
	--Bar 13-16 (same as 5-8)
	12,
	12.25,
	12.5,
	12.75,
	13,
	13.25,
	13.5,
	14,
	15,
	--End
	16
}
--Turn beats into time
for k, v in pairs(bangarang_beats) do
	local bpm = 110
	bangarang_beats[k] = v / bpm * 60
end

table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_bangarang",
	bpm = 110,
	bars = 16,
	times = bangarang_beats
})

--Avicii - Levels
local levels_beats = {
	--Bar 1-4
	0,
	0.5,
	1,
	2,
	2.5,
	3,
	3.5,
	--Bar 5-8
	4,
	4.5,
	5,
	5.5,
	6.5,
	7,
	7.5,
	--Bar 9-12 (same as 1-4)
	8,
	8.5,
	9,
	10,
	10.5,
	11,
	11.5,
	--Bar 13-16 (same as 5-8)
	12,
	12.5,
	13,
	13.5,
	14.5,
	15,
	15.5,
	--End
	16
}
--Turn beats into time
for k, v in pairs(levels_beats) do
	local bpm = 126
	levels_beats[k] = v / bpm * 60
end

table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_levels",
	bpm = 126,
	bars = 16,
	times = levels_beats
})

--Vicetone & Tony Igy - Astronomia
local astronomia_beats = {
	--Bar 1-4
	0,
	1,
	1.5,
	2,
	3,
	--Bar 5-8
	4,
	5,
	5.5,
	6,
	7,
	7.5,
	--Bar 9-12
	8,
	9,
	9.5,
	10,
	10.5,
	11,
	11.5,
	--Bar 13-16 (same as 9-12)
	12,
	13,
	13.5,
	14,
	14.5,
	15,
	15.5,
	--End
	16
}
--Turn beats into time
for k, v in pairs(astronomia_beats) do
	local bpm = 126
	astronomia_beats[k] = v / bpm * 60
end

table.insert(AnimatedSkinFramework.skin_data[skin_id].loops, {
	id = "ewj_astronomia",
	bpm = 126,
	bars = 16,
	times = astronomia_beats
})
