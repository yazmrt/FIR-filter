%% Q1
n7 = 0:199;
r = 0.8;
r2 = 0.8;
poles = [r*exp(1i*17*pi/180), r*exp(-1i*17*pi/180), r2*exp(1i*pi/9), r2*exp(-1i*pi/9), r*exp(1i*23*pi/180),...
         r*exp(-1i*23*pi/180), r2*exp(1i*13*pi/90), r2*exp(-1i*13*pi/90), r*exp(1i*29*pi/180),...
         r*exp(-1i*29*pi/180),r2*exp(1i*8*pi/45), r2*exp(-1i*8*pi/45), r*exp(1i*7*pi/36),...
         r*exp(-1i*7*pi/36)];
zero = [1.1,0.9,exp(1i*4.5*pi/18), exp(-1i*4.5*pi/18),exp(1i*1*pi/36), exp(-1i*1*pi/36)];
zero = zero';
[b , a] = zp2tf(zero, poles, 1); 
% [h_n,t] = impz(b,a,200);
uzunluk = 199;
h_n = recursion2(uzunluk, a, b);
figure(1);
stem(h_n);
xlabel("n");
ylabel("h[n]");
title("n vs h[n]");

% impz(b,a);
disp(h_n);

fid3 = fopen('h_niir.txt', 'w');
if fid3 == -1, error('Cannot create file.'); end
fprintf(fid3, '%g\n', h_n);
fclose(fid3);


h_n4 = h_n;
w = -pi:0.0001:pi;
H_ejw = abs(sum(h_n4.'.*exp(n7.'.*(-1j).*w)));
figure(8);
plot(w,H_ejw);
title('w vs |H(e^j^w)|');
xlabel('w(rad)');
ylabel("|H(e^j^w)|");

% syms z h_z
% i = 1;
% h_z = (z - zero(i))*(z-zero(i+1))*(z - zero(i+2))*(z - zero(i+3))*(z - zero(i+4))*...
%     (z - zero(i+5));
% b = sym2poly(h_z);

figure(2);
poles = poles';
zplane(zero,poles);
title("Zeros and Poles of H(z)");

figure(3);
freqz(b,a,-pi:0.0001:pi);
w = -pi:0.0001:pi;

%% Q2
alpha = 50*2*pi;
Ts1 = sqrt(pi/(512*alpha));
number = 1023;
limit = 1200;
n = 0:limit;
n_Ts1 = n.*Ts1;
x1_n = mychirp(n_Ts1,limit,alpha,number); 
figure(4);
plot(n,x1_n);
title('x1[n]');
xlabel('n');

alpha2 = 10^3;
Ts2 = sqrt(pi/(8192*alpha2));
number2 = 8191;
limit2=9000;
n2 = 0:limit2;
n_Ts2 = n2.*Ts2;

x2_n = mychirp(n_Ts2,limit2,alpha2,number2); 
figure(5);
plot(n2,x2_n);
title('x2[n]');
xlabel('n');


%% Q3


rec_length = 1200;
y1_n = recursion(x1_n, rec_length, a, b);
x_n = [zeros(1,15), x1_n, zeros(1, length(y1_n) - length(x1_n))];

figure(6)
plot(0:length(y1_n)-1,y1_n);
title("y1[n]");
xlabel("n");
% 
figure(7)
rec_length2 = 9000;
y2_n = recursion(x2_n, rec_length2, a, b);
plot(0:length(y2_n)-1, y2_n);
title("y2[n]");
xlabel("n");


fid = fopen('x2_n.txt', 'w');
if fid == -1, error('Cannot create file.'); end
fprintf(fid, '%g\n', x2_n);
fclose(fid);

fid1 = fopen('y1_n.txt', 'w');
if fid1 == -1, error('Cannot create file.'); end
fprintf(fid1, '%g\n', y1_n);
fclose(fid1);

fid2 = fopen('y2_n.txt', 'w');
if fid2 == -1, error('Cannot create file.'); end
fprintf(fid2, '%g\n', y2_n);
fclose(fid2);








