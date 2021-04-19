function next = minval(M)

   [posy,posx] = find(M == min(M,[],'all'));
   mid = M(ceil(numel(M)/2));
   [ceny,cenx] = find(M == mid);
   next = [posx-cenx, posy-ceny];
end