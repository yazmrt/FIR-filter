%% Q1
n = 0:11;
zero = [0.9, 1.1, exp(1i*4*pi/9), exp(-1i*4*pi/9),exp(1i*5*pi/9), exp(-1i*5*pi/9), exp(1i*2*pi/3),...
exp(-1i*2*pi/3),exp(1i*5*pi/6), exp(-1i*5*pi/6),-1];
syms z h_z
i = 1;
h_z = (z - zero(i))*(z-zero(i+1))*(z - zero(i+2))*(z - zero(i+3))*(z - zero(i+4))*...
    (z - zero(i+5))*(z - zero(i+6))*(z - zero(i+7))*(z - zero(i+8))*(z - zero(i+9))*...
    (z - zero(i+10));
h_n = sym2poly(h_z);

fid1 = fopen('h_n.txt', 'w');
if fid1 == -1, error('Cannot create file.'); end
fprintf(fid1, '%g\n', h_n);
fclose(fid1);

disp(h_n);
figure(1);
stem(n,h_n);
xlabel("n");
ylabel("h[n]");
title("n vs h[n]");

figure(2);
zplane(h_n);
title("Zeros and Poles of H(z)");

w = -pi:0.0001:pi;

H_ejw = abs(sum(h_n.'.*exp(n.'.*(-1j).*w)));
H_ejw_phase = angle(sum(h_n.'.*exp(n.'.*(-1j).*w)));
figure(3);
plot(w,H_ejw);
title('w vs |H(e^j^w)|');
xlabel('w');
ylabel("|H(e^j^w)|");

figure(4);
plot(w, H_ejw_phase);
title('w vs phase(H(e^j^w))');
xlabel('w');
ylabel("phase(H(e^j^w))");



%% Q2
alpha = 50*2*pi;
Ts = sqrt(pi/(512*alpha));
number = 1023;
limit = 1200;
n = 0:limit;
n_Ts = n.*Ts;
xf_n = mychirp(n_Ts,limit,alpha, number); 
figure(5);
plot(n,xf_n);
title('xf[n]');
xlabel('n');
%% Q3
alphag = 10^3;
Tsg = sqrt(pi/(8192*alphag));
numbersg = 8191;
limitg=9000;
ng = 0:limitg;
n_Tsg = ng.*Tsg;

xg_n = mychirp(n_Tsg,limitg,alphag, numbersg); 
figure(6);
plot(ng,xg_n);
title('xg[n]');
xlabel('n');

fid = fopen('xgn.txt', 'w');
if fid == -1, error('Cannot create file.'); end
fprintf(fid, '%g\n', xg_n);
fclose(fid);
%% Q4
figure(7)
y1_n = conv( xf_n, h_n);
plot(0:length(y1_n)-1,y1_n);
title("y1[n]");
xlabel("n");

figure(8)
y2_n = conv(xg_n, h_n);
plot(0:length(y2_n)-1, y2_n);
title("y2[n]");
xlabel("n");

fid2 = fopen('y2_n.txt', 'w');
if fid2 == -1, error('Cannot create file.'); end
fprintf(fid2, '%g\n', y2_n);
fclose(fid2);



