
function h_n = compute_cof(F,Hd) % in case of weighted ls compute_cof(F,weights,Hd

%h_n = pinv(F'*weights*F)*(F'*weights)*Hd';    % computing only ((N-1)/2)+1 co_offecients  
h_n = F\Hd';
h_n=h_n';       % making it a row vector
h_flipped =fliplr(h_n); % getting a flipped h(n) to make the complete filter
h_n = [ h_flipped(1:length(h_flipped)-1) , h_n]; % concatinating coofficients to get the complete filter
