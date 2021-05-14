function map_score = score_map(M_est,M)
    %M is 5x3 (the ground truth) M(i,:) = [id x y]
    %M_est is 5x6 (your estimate after SLAM)
    %M_est(i,:) = [id, x,y, variance_x , variance_y, covariance_xy].
    Mh_dist = 100*ones(5,3);
    E_dist   = [];
    for i=1:size(M_est,1)
        for j=1:size(M,1)
            if (M_est(i,1) == M(j,1))
                L = [M(j,2);M(j,3)];
                L_est = [M_est(i,2);M_est(i,3)];
                L_Sigma = [M_est(i,4) M_est(i,6);M_est(i,6) M_est(i,5)];
                for k=1:3
                    l_dist = mahala(L,L_est,k*L_Sigma);
                    Mh_dist(i,k) = l_dist;
                end
                
                l_dist = mahala(L,L_est,eye(2));
                E_dist = [E_dist,l_dist];
            end
        end
    end

    Mh_dist = mean(Mh_dist,1);
    map_score = 0;
    if mean(E_dist) < 0.15
        if Mh_dist(3) < 1
            map_score = map_score + 0.50;
        end
        if Mh_dist(2) < 1
            map_score = map_score + 0.30;
        end
        if Mh_dist(1) < 1
            map_score = map_score + 0.20;
        end        
    end
    
end