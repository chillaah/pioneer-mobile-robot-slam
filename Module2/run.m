clear; clc

% load queensland_towns
load queensland_towns_match_lecture
[p,f,e]=graph_planner(distanceMatrix, placeCoords, placeNames, 5, 1);

for i = 1:length(p); disp(placeNames(p(i))); end
disp((length(p))); disp((length(f))); disp((length(e)));

