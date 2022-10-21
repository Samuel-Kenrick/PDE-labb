%close all
clear all

%4a

%making a function for f to test the calculating speed
f = @(x)x^10

%making a loop for 2^m
for m = 1:11
    N = 2^m;

    %calculating x and y
    for j = 0:N-1
        x(j+1) = 2*pi*j/N;
        y(j+1) = f(x(j+1));

    end

    %saving the run time
    tic
    z = mydft(y);
    timeDFT(m) = toc;
    tic
    z2 = fft(y);
    timeFFT(m) = toc;
end


plot(1:11,timeDFT, 1:11, timeFFT)
axis([1 11 0 3.5])
xlabel('m-value')
ylabel('t')
legend('mydft', 'fft')
%%
%4b

clear all
fid = fopen('filtre.data','r'); % open filtre.data
Y = fscanf(fid,'%f',[1 inf]); % read filtre.data
fclose(fid);
figure(2), plot(Y)
axis([0 255 -1.1 1.1])
xlabel('t')
ylabel('y(t)')
% plot filtre.data
Z=fft(Y) % transform data
wcut=0.4 % cut-off
N=length(Z);

for j=1:N
    if (abs(Z(j)) < wcut) % cut-off low frequencies
        Z(j) = 0;
    end
end
y2 = ifft(Z);
figure(3)
plot(y2)
axis([0 255 -1.1 1.1])
xlabel('t')
ylabel('y(t)')

%%
%4c

clear all
load('train');% load sound, e.g: ’splat’,’gong’,’handel’,’train’
sound(y,Fs); % play sound
Y = fft(y);% fft from Matlab
W=Y;
M=max(abs(Y));
omegaR = 0.4 %  <-  specify the relative threshold value
N = length(y);
for j=1:N
    if (abs(W(j)) < M*omegaR) % <-  compress
        W(j) = 0;
    end
end
% compressed signal and original signal expressed as a sparse array
WS = sparse(W);
YS = sparse(Y);
% compare size before-after
before = whos('YS');
after = whos('WS');
comprRatio = before.bytes/after.bytes
% play back the sound
pause(2);% delay in order to finish playing original sound
disp('Play compressed signal');
w= real(ifft(full(WS)));
sound(w, Fs)