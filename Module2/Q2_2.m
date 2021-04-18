%% Q2.2 Prep For Distance Transform

%----- YOUR CODE GOES BELOW HERE -----

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
    if x == size(A,2)
        
    M = [A(y-1,x-1) A(y-1,x) A(y-1,x+1)
           A(y,x-1)   A(y,x)   A(y,x+1)
         A(y+1,x-1) A(y+1,x) A(y+1,x+1)];
     
    for i = 1:size(M,1)
        for j = 1:size(M,2)
            if isempty(M(i,j))
                M(i,j) = [];
            end
        end
    end
end

function B = minwin(A) 
% Input:
%  A returns a matrix the same size as A where each element of B is the minimum 
% of a 3x3 window of A centered at the corresponding element.  Elements of B 
% that correspond to a window which "falls off the edge" of the matrix A should be set to a value of NaN.

    B = ;
end

function next = minval(M)
% Input:
%  M is a real 3x3 matrix
% Return:
%  next is a 1x2 matrix with elements [x, y] which are the horizontal and vertical coordinates relative to the centre
%       element, of the smallest element in the matrix.

    next = ;
end
