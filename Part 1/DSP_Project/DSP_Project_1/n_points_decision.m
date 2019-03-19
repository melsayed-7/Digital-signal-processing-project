function n_points = n_points_decision(choice,fn)

% Determining N that should be used to implement the N-DFT

switch choice
    case 1 
        n_points=length(fn); % This is a choice to see if the user wants N to be equal to the number of samples
    case 2
        n_points=128;
    case 3 
        n_points=1024;
    case 4 
        n_points=32768;
    case 5
        n_points=65536;
end
end