function out = mychirp(n_Ts,limit, alpha, numbers)
out = zeros(1,limit+1);
for i = 1:limit+1    
    if(0 <= i-1 && i-1 <= numbers)    
        out(i) = cos(alpha*n_Ts(i)^2);
    else
        out(i) = 0.*(i-1);
    end
end    
end