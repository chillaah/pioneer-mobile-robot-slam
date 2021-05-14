function d = mahala(x,mu,sigma)
    d = sqrt((x-mu)'* (sigma \ (x-mu)));
end