function posterior_belief = update(prior_belief,signs_map,measur_prob,z)
% prior_belief: The prior belief of the robot about its location before incorporating any sensor information
% signs_map : the map of where the signs are in the hallway.
% measurements probabilities = [p(z=1|sign) , p(z=1|no_sign)]
% z is the detector output. 1 sign, 0 no_sign.

    if z == 0
        measur_prob = [1 - measur_prob(1), 1 - measur_prob(2)];
    end
    
    likelihood = 0;
    len = length(signs_map);
    prior = zeros(len, 1);
    
    for i = 1:len
        
        if signs_map(i) == 1
            prior(i) = prior_belief(i) * measur_prob(1);
        else
            prior(i) = prior_belief(i) * measur_prob(2);
        end
        likelihood = likelihood + prior(i);
    end
    
    likelihood = 1/likelihood;
    posterior_belief = likelihood * prior;
    
end