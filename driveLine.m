function prop = driveLine(q, L)

    % gain constants
    Kd = 1;
    
    x = q(1);
    y = q(2);
    
    a = L(1); b = L(2); c = L(3);
    
    d = (x*a + y*b + c)/hypot(a, b);
    
    prop = -Kd * d;

end