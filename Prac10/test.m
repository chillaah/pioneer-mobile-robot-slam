close all; clear; clc

N = 10;

range_gt = 0.1 : 0.2 : 2;

z_range = 0.2 * randn(1,N) + range_gt;

bearings_gt = -25 : 5:  24;

z_bearing = wrapTo180(5 * randn(1,N) + bearings_gt);

%%

z_range_err = z_range - range_gt;

z_bearing_err = z_bearing - bearings_gt;

cov(z_range_err, z_bearing_err)
