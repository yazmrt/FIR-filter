%% Q5
fid1 = fopen('h_n.txt', 'r');
h_n = fscanf(fid1, '%f',[1,16]);
fclose(fid1);

fid = fopen('xgn.txt', 'r');
x2_n = fscanf(fid, '%f',[1,9002]);
fclose(fid);
length=8192;
alphag = 10^3;
Tsg = sqrt(pi/(8192*alphag));
fs = 1/Tsg;
period = Tsg*length;

% while(1)
% sound(x2_n(65:length),fs)
% pause(period)
% end



%% Q6
fid2 = fopen('y2_n.txt', 'r');
y2_n = fscanf(fid2, '%f',[1,9016]);
fclose(fid2);
length2 = 8192;
period2 = Tsg*length2;

% while(1)
% sound(y2_n(1:length2)/10,fs)
% pause(period2)
% end

%% Q7
% cutoff frequencies are pi/11 and pi/3
% time = 0:Tsg:(length(y2_n))*Tsg;
% plot(time,y2_n);

% Tsg = sqrt(pi/(8192*1000));
% w2 = (-pi/Tsg):0.0001/Tsg:(pi/Tsg);
% H_jw = abs(sum(h_n.'.*exp(n.'.*(-1j).*w)));
% figure(9);
% plot(w2,H_jw);
% title('w vs |H(jw)|');
% xlabel('w');
% ylabel("|H(jw)|");
%% Q8
filename = "behzat.mp3";
[music1,fs1] = audioread(filename);
sample = music1(4*fs1:30*fs1);
output1 = conv2(h_n,music1(4*fs1:15*fs1)/6);
audiowrite("beehzat_conv.wav",output1,44100);
% sound(sample,fs1);
% sound(output1,fs1);
%% Q9
filename = "ses.m4a";
[music2,fs2] = audioread(filename);
sample2 = music2;
output2 = conv(h_n,music2);
audiowrite("konus_conv.wav",output2,fs2);
% sound(music2,fs2);
% sound(output2,fs2);
