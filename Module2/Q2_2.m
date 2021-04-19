%% Q2.2 Prep For Distance Transform

%----- YOUR CODE GOES BELOW HERE -----

A = rand(10,12);

function M = window(A, x, y) 
% Input:
%  A an arbitrary sized real matrix, at least 3x3.
%  x the x-coordinate (horizontal index) of the centre of the window.
%  y the y-coordinate (vertical index) of the centre of the window.
% Return:
%  M as 3x3 matrix which are the elements of M centered on the element (x,y).
%
% Should the window extend beyond the edges of the matrix the function must
% return an empty matrix [].

     if x >= size(A,2) || y >= size(A,1) || x <= 1 || y <= 1
         M = [];
     else
        M = [ A(y-1,x-1) A(y-1,x) A(y-1,x+1)
                A(y,x-1)   A(y,x)   A(y,x+1)
              A(y+1,x-1) A(y+1,x) A(y+1,x+1)];
     end
     
% M = size(3,3);
% for i = 0:2
%     for j = 0:2
%         if isempty(A(y+i,x+j))
%             M(i+1,j+1) = [];
%         else
%             M(i+1,j+1) = A(y+i,x+j);
%         end
%     end
% end

end

function B = minwin(A) 
% Input:
%  A returns a matrix the same size as A where each element of B is the minimum 
% of a 3x3 window of A centered at the corresponding element.  Elements of B 
% that correspond to a window which "falls off the edge" of the matrix A should be set to a value of NaN.

B = zeros(size(A));

    for x = 1:size(A,1)
        for y = 1:size(A,2)
            M = window(A,y,x);
            if isempty(M)
                B(x,y) = NaN;
            else
                B(x,y) = min(M,[],'all');
            end
        end
    end
end

function next = minval(M)
% Input:
%  M is a real 3x3 matrix
% Return:
%  next is a 1x2 matrix with elements [x, y] which are the horizontal and vertical coordinates relative to the centre
%       element, of the smallest element in the matrix.
   [posx,posy] = find(M == min(M,[],'all'));
   mid = M(ceil(numel(M)/2));                                                       
   [cenx,ceny] = find(M == mid);
   next = [posx-cenx posy-ceny];
end
