function window = window_decision(window_choice,t,window_time)
switch window_choice
    case 1
        window=ones(1,length(t));            
    case 2 
        window=tripuls(t-window_time/2,window_time);
    case 3 
        window=1-cos(2*pi*t/t(end));
    case 4 
        window= 0.54-0.46*cos(2*pi*t/t(end));
    otherwise        
end
end