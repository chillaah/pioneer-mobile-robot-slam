function err = get_err(t1,t2)
% The error between two trajectories
% root-mean-square deviation (RMSD) 
err = sqrt(mean((t1(:,1) - t2(:,1)).^2 + (t1(:,2) - t2(:,2)).^2));
end