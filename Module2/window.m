function M = window(A, x, y) 

     if x >= size(A,2) || y >= size(A,1) || x <= 1 || y <= 1
         M = [];
     else
        M = [ A(y-1,x-1) A(y-1,x) A(y-1,x+1)
                A(y,x-1)   A(y,x)   A(y,x+1)
              A(y+1,x-1) A(y+1,x) A(y+1,x+1)];
     end

end