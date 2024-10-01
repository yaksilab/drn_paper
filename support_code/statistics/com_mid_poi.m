function mid_poi = com_mid_poi(vec)

mid_poi = mean([vec(1:end - 1) vec(2:end)], 2);