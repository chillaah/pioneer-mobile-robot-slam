function M = window(A, x, y)
    
    % top and bottom NaN row boundry
    A = [NaN(1,size(A,2));
                A
         NaN(1,size(A,2))];
    
    % right and left NaN column boundry
    A = [NaN(1,size(A,1))' A NaN(1,size(A,1))'];
    
    % change due to NaN boundries
    x = x + 1;
    y = y + 1;
    
    % window matrix
    M = [ A(y-1,x-1) A(y-1,x) A(y-1,x+1)
            A(y,x-1)   A(y,x)   A(y,x+1)
          A(y+1,x-1) A(y+1,x) A(y+1,x+1)];
end