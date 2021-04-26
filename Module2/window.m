function M = window(A, x, y)
    
    % top and bottom NaN row boundry
    A2 = [NaN(1,size(A,2));
                 A
          NaN(1,size(A,2))];
    
    % right and left NaN column boundry
    A3 = [NaN(1,size(A2,1))' A2 NaN(1,size(A2,1))'];
    
    % change due to NaN boundries
    M = [   A3(y,x)   A3(y,x+1)   A3(y,x+2)
          A3(y+1,x) A3(y+1,x+1) A3(y+1,x+2)
          A3(y+2,x) A3(y+2,x+1) A3(y+2,x+2)];
    
end