clc;
clear;
// ############  Coded in SciLab  ##############

// ############  Problem 1 and 2  ##############
f1=1000;
fs=16000;
bw=200;
theta=(2*%pi*f1)/fs;
r=exp(-(%pi*bw)/fs);
w = 0:0.005:%pi;
z = exp(%i * w);
h = 1 ./ (1 - 2*r*cos(theta)*z^(-1) + r^2*z^(-2));

// Magnitude Response of H(z)
H=abs(h);
scf(0);
subplot(221);
plot(w,H)
xgrid(1);
title('Magnitude response of H(z)');
xlabel('Frequency');
ylabel('Magnitude');

// Impulse response of H(z)
n = 0:1:255;
hn =(r^n.*sin((n+1)*theta)/sin(theta));
subplot(222);
plot(n,hn)
xgrid(1);
title('Impulse response of H(z)');
xlabel('n');
ylabel('Magnitude');

// Impulse train
f0 = 150;
zr = floor(fs/f0)
xn=[ ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr)];
subplot(223);
plot(xn)
xgrid(1);
title('Impulse train');
xlabel('n');
ylabel('Amplitude');

// Time domain response of filter
k=0:1:(254 + 75*(1+zr));
yn=convol(xn,hn);
subplot(224);
plot(k(1:800),yn(1:800));
xgrid(1);
title('Time domain response of filter');
xlabel('n');
ylabel('Amplitude');
wavwrite(yn, fs, 16, 'prob2');
soundsec(0.5,[16000]);


// ############### Problem 3 ##############
f1_array = [300 1200];
bw_array = [100 200];
f0_array = [120 180];
fs = 16000

for i=1:2
	f1 = f1_array(i);
	bw = bw_array(i);
	f0 = f0_array(i);
	theta=(2*%pi*f1)/fs;
	r=exp(-(%pi*bw)/fs);
	w = 0:0.005:%pi;
	z = exp(%i * w);
	h = 1 ./ (1 - 2*r*cos(theta)*z^(-1) + r^2*z^(-2));

	H=abs(h);
	scf(i);
	subplot(221);
	plot(w,H)
	xgrid(1);
	title('Magnitude response of H(z)');
	xlabel('Frequency');
	ylabel('Magnitude');

	n = 0:1:255;
	hn =(r^n.*sin((n+1)*theta)/sin(theta));
	subplot(222);
	plot(n,hn)
	xgrid(1);
	title('Impulse response of H(z)');
	xlabel('n');
	ylabel('Magnitude');

	f0 = f0_array(i);
	zr = floor(fs/f0)
	xn=[ ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr)];
	subplot(223);
	plot(xn)
	xgrid(1);
	title('Impulse train');
	xlabel('n');
	ylabel('Amplitude');

	k=0:1:(254 + 75*(1+zr));
	yn=convol(xn,hn);
	subplot(224);
	plot(k(1:800),yn(1:800));
	xgrid(1);
	title('Time domain response of filter');
	xlabel('n');
	ylabel('Amplitude');
	wavwrite(yn, fs, 16, 'prob3' + '_' + string(i));
	soundsec(0.5,[16000]);
end


// ############### Problem 4 ################
vowel = ['aa', 'iy', 'oo']
formants = [730, 1090, 2440 ; 270, 2290, 3010 ; 300, 870, 2240] ; 
bw = 100;
f0_array = [120 220];
fs = 16000;
h = 1;

for m = 1:2
	for a = 1:3
    	formant = formants(a,:);

		for i = 1:3
   			r = exp(-%pi*bw/fs);
    		theta = 2*%pi*formant(i)/fs;

    		w = 0: 0.005 :%pi;
   			// sfpp = single formant pole pair
    		sfpp = 1 - 2*r*cos(theta)*exp(-%i*w) + r^2*exp(-2*%i*w);
    		h = h./sfpp;
		end

		H=abs(h);
		scf(400 + 10*m + a);
		subplot(221);
		plot(w,H)
		xgrid(1);
		title('Magnitude response of H(z)');
		xlabel('Frequency');
		ylabel('Magnitude');

		n = 0:1:255;
		r = exp(-%pi*bw/fs)
		theta1 = 2*%pi*formant(1)/fs;
		theta2 = 2*%pi*formant(2)/fs;
		theta3 = 2*%pi*formant(3)/fs;
		hn1 = (r^n.*sin((n+1)*theta1)/sin(theta1));
		hn2 = (r^n.*sin((n+1)*theta2)/sin(theta2));
		hn3 = (r^n.*sin((n+1)*theta3)/sin(theta3));
		hn_temp = convol(hn1, hn2)
		hn = convol(hn_temp, hn3)
		nn = 0:1:765
		subplot(222);
		plot(nn,hn)
		xgrid(1);
		title('Impulse response of H(z)');
		xlabel('n');
		ylabel('Magnitude');

		f0 = 100;
		zr = floor(fs/f0)
		// Dirty quick hack :/
		xn=[ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr) ones(1,1) zeros(1,zr)];
		subplot(223);
		plot(xn(1:1600))
		xgrid(1);
		title('Impulse train');
		xlabel('n');
		ylabel('Amplitude');

		k=0:1:(764 + 75*(1+zr));
		yn=convol(xn,hn);
		subplot(224);
		plot(k(1:1600),yn(1:1600));
		xgrid(1);
		title('Time domain response of filter');
		xlabel('n');
		ylabel('Amplitude');
		wavwrite(yn, fs, 16, vowel(a) + '_' + string(f0_array(m)));
		soundsec(0.5,[16000]);
	end
end

// ################# Problem 5 ###################
windowLength = [ 0.01 0.04 0.1 ].*fs;

for m=1:2
	if m == 1
		file = 'aa_220';
	else
		file = 'oo_220';
	end

	[y,Fs,bits]=wavread(file)

	for p = 1:3
		X = y(1:windowLength(p));
		rwin = window('re', windowLength(p))
		hwin = window('hm', windowLength(p))
		freq = (-windowLength(p)/2:windowLength(p)/2 - 1)*fs/windowLength(p);
		Y1 = X.*rwin;
		rfft = fftshift(abs(fft(Y1, -1)));
		scf(500 + 10*m + 2*p -1);
		plot(freq(windowLength(p)/2 + 1:3*windowLength(p)/4), 10*log10(rfft(windowLength(p)/2 + 1:3*windowLength(p)/4)));
		xgrid(1);
		title(file + ' : Rectangular window length = ' + string(windowLength(p)/16) + 'ms')
		xlabel('Frequence (Hz)')
		ylabel('Frequency response on Log scale')
		Y2 = X.*hwin;
		hfft = fftshift(abs(fft(Y2, -1)));
		scf(500 + 10*m + 2*p);
		plot(freq(windowLength(p)/2 + 1:3*windowLength(p)/4), 10*log10(hfft(windowLength(p)/2 + 1:3*windowLength(p)/4)));
		xgrid(1);
		title(file + ' : Hamming window length = ' + string(windowLength(p)/16) + 'ms')
		xlabel('Frequence (Hz)')
		ylabel('Frequency response on Log scale')

	end
end
