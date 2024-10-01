wid_mon = 1920;
hei_mon = 1080;

wid = 445;
asp_rat = 16/9;
hei = wid/asp_rat;

mmx_pix = 475/1920;
poi_mmx = 1/0.3528;
wid_mon_poi = wid_mon*mmx_pix*poi_mmx;
hei_mon_poi = hei_mon*mmx_pix*poi_mmx;

h = gcf;
h.Units = 'points';
h.Position = [(wid_mon_poi - wid)/2 (hei_mon_poi - hei)/2 wid hei];