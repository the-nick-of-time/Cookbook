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

local function density(name, measure, dens, numerator, denominator)
	local frac = nil
	local d = nil
	if denominator == "" then
		frac = numerator
		d = 1
	else
		d = tonumber(denominator)
		frac = "\\fr{" .. numerator .. "}{" .. denominator .. "}"
	end
	local m = pluralize(measure, tonumber(numerator))
	local mass = round(tonumber(numerator) / d * dens)
	return frac .. " " .. m .. " (" .. mass .. " grams) " .. name
end

return {
    f_to_c = f_to_c,
    density = density,
    round_to_nearest = round_to_nearest,
}