function next = minval(M)
    
   % manhattan filtering
%    M(1,1) = NaN; M(1,3) = NaN;
%    M(3,1) = NaN; M(3,3) = NaN;
   
   % minimum number coordinates
   minNum = min(M,[],'all');
   [posy,posx] = find(M == minNum);
   
   % center coordinates
   mid = M(2,2);
   [ceny,cenx] = find(M == mid);
   
   % coordinate difference of set [-1 0 1]
   next = [posx-cenx, posy-ceny];
   
   % if there are many, since distances are the same, pick the 2nd one
   if size(next,1) >= 2; next = next(2,:); end
   
end