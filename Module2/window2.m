function M = window2(A, x, y)

    A2 = padarray(A, [1 1], NaN);
    x2 = x + 2;
    y2 = y + 2;
    M = A2(y:y2, x:x2);

end