function factor_meter = ext_factor_meter(fil_pat_met_cal)
load(fil_pat_met_cal, 'metadata')
voxelSize = metadata.voxelSize;
factor_meter = voxelSize(1);% in um !
end
