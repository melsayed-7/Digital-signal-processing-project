function fn=function_decision(fn_choice,w,t)

switch fn_choice
    case 1
        fn = sin(w*t);
    case 2 
        fn = sinc(w*t);
    case 3 
        fn = ones(1,length(t));
    otherwise        
end

end