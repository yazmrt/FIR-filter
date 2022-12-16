%% Q4

fid = fopen('x2_n.txt', 'r');
x2_n = fscanf(fid, '%f',[1,9002]);
fclose(fid);
length=8192;
Tsr = sqrt(pi/(8192*alpha2));
fs = 1/Tsr;
period = Tsr*length;
% 
% while(1)
% sound(0.2*x2_n(1:length),fs)
% pause(period)
% end

%% Q5
fid2 = fopen('y2_n.txt', 'r');
y2_n = fscanf(fid2, '%f',[9000]);
fclose(fid2);
length2 = 8192;
period2 = Tsr*length2;

% while(1)
% sound(y2_n(1:length2)/10,fs)
% pause(period2)
% end

%% Q7
h_n5 = h_n';
w2 = (-pi/Tsr):0.0001/Tsr:(pi/Tsr);
H_jw = abs(sum(h_n5'.'.*exp(n7.'.*(-1j).*w)));
figure(9);
plot(w2,H_jw);
title('w vs |H(jw)|');
xlabel('w(rad/s)');
ylabel("|H(jw)|");

%% Q8
fid5 = fopen('h_niir.txt', 'r');
h_n1 = fscanf(fid5, '%f',[1,100]);
fclose(fid5);

filename = "behzat.mp3";
[music1,fs1] = audioread(filename);
sample = music1(4*fs1:30*fs1);
output1 = 10^-3.*conv2(h_n1,music1(4*fs1:15*fs1)/6);
audiowrite("behzat_iir.wav",output1,44100);
% sound(sample,fs1);
% sound(output1,fs1);
%% Q9
filename = "ses.m4a";
[music2,fs2] = audioread(filename);
sample2 = music2;
output2 = 10^-2.*conv(h_n1,music2);
audiowrite("konus_iir.wav",output2,fs2);
% sound(music2,fs2);
% sound(output2,fs2);
