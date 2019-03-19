function F = compute_matrix(L,N) 

w = linspace(0,pi,L);

F=[]; % instantiating a matrix F
for i = 1:L
    F = [F; [1, 2*cos([1:(N-1)/2]*w(i))]]; % assigning each row of the matrix F
end
end