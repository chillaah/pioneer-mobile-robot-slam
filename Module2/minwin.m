function B = minwin(A) 

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