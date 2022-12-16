function out = recursion2(length1, a, b)
out = zeros(1,length1+1);
y_n = zeros(1,length1+1);
% x_n = [x_n, zeros(1, length(y_n) - length(x_n))];
b = b(9:15);
b = [b, 0 0 0 0 0 0 0 0 0];
for i = -14:(length1+1-50)
    if i>0 
        for j = 1:15 
           y_n(i+15) = y_n(i+15)+ b(j)*impulse(i+15-j);
        end
        for k = 2:15
            y_n(i+15) = y_n(i+15) - a(k)*y_n(i+16-k);
        end
    else
        y_n(i+15) = 0;
    end
    out = y_n;
end