local function f_to_c(f)
	return (f - 32) * (5 / 9)
end

local function round(n)
	return math.floor(n + 0.5)
end

local function round_to_nearest(n, threshold)
    return round(n / threshold) * threshold
end

local function pluralize(word, number)
	if number == 1 then
		return word
	else
		return word .. "s"
	end
end

local function split_frac(fraction)
	-- check for fraction form
	n, d = string.gmatch(fraction, "(%d+)/(%d+)")()
	if n then
		return tonumber(n), tonumber(d)
	end
	-- check for single number
	local whole = string.gmatch(fraction, "%d+")()
	return tonumber(whole), 1
end

local function density(name, measure, dens, quantity)
	local n, d = split_frac(quantity)
	texio.write("numerator: " .. n .. " denominator: " .. d)
	local frac = nil
	if d == 1 then
		frac = n
	else
		frac = "\\fr{" .. n .. "}{" .. d .. "}"
	end
	local m = pluralize(measure, n)
	local mass = round(n / d * dens)
	return frac .. " " .. m .. " (" .. mass .. " grams) " .. name
end

return {
    f_to_c = f_to_c,
    density = density,
    round_to_nearest = round_to_nearest,
}