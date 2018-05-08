close all;
clc;

%% QUESTION 2.1.A.1 %%

wc = 0.3;
ws = 0.5;
Amax = 0.1;
Amin = 60;

% Synthesis of the Butterworth filter
[N1, Wn1] = buttord(wc, ws, Amax, Amin, 's');
[Z1, P1, G1] = buttap(N1);
epsilon1 = sqrt(10^(0.1*Amax)-1);
w0p1 = wc*epsilon1^(-1/N1);
P1 = P1*w0p1;
G1 = G1*w0p1^N1;

% Synthesis of the Chebyshev-I filter
[N2, Wn2] = cheb1ord(wc, ws, Amax, Amin, 's');
[Z2, P2, G2] = cheb1ap(N2, Amax);
P2 = P2*wc;
G2 = G2*wc^N2;

% Synthesis of the Chebyshev-II filter
[N3, Wn3] = cheb2ord(wc, ws, Amax, Amin, 's');
[Z3, P3, G3] = cheb2ap(N3, Amin);
Z3 = Z3*ws;

P3 = P3*ws;
G3 = G3*ws^(length(P3)-length(Z3));

% Synthesis of the Cauer filter
[N4, Wn4] = ellipord(wc, ws, Amax, Amin, 's');
[Z4, P4, G4] = ellipap(N4, Amax, Amin);
Z4 = Z4*wc;
P4 = P4*wc;
G4 = G4*wc^(length(P4)-length(Z4));

%For this first filter, N1 = 18, N2 = 9, N3 = 9 and N4 = 6.

%% QUESTION 2.1.A.2 %%

wc = 0.3;
ws = 0.5;
Amax = 0.01;
Amin = 80;

% Synthesis of the Butterworth filter
[N1, Wn1] = buttord(wc, ws, Amax, Amin, 's');
[Z1, P1, G1] = buttap(N1);
epsilon1 = sqrt(10^(0.1*Amax)-1);
w0p1 = wc*epsilon1^(-1/N1);
P1 = P1*w0p1;
G1 = G1*w0p1^N1;

% Synthesis of the Chebyshev-I filter
[N2, Wn2] = cheb1ord(wc, ws, Amax, Amin, 's');
[Z2, P2, G2] = cheb1ap(N2, Amax);
P2 = P2*wc;
G2 = G2*wc^N2;

% Synthesis of the Chebyshev-II filter
[N3, Wn3] = cheb2ord(wc, ws, Amax, Amin, 's');
[Z3, P3, G3] = cheb2ap(N3, Amin);
Z3 = Z3*ws;

P3 = P3*ws;
G3 = G3*ws^(length(P3)-length(Z3));

% Synthesis of the Cauer filter
[N4, Wn4] = ellipord(wc, ws, Amax, Amin, 's');
[Z4, P4, G4] = ellipap(N4, Amax, Amin);
Z4 = Z4*wc;
P4 = P4*wc;
G4 = G4*wc^(length(P4)-length(Z4));

%For this second filter, N1 = 24, N2 = 12, N3 = 12 and N4 = 8.

%% QUESTION 2.1.A.3 %%

wc = 0.45;
ws = 0.5;
Amax = 0.1;
Amin = 60;

% Synthesis of the Butterworth filter
[N1, Wn1] = buttord(wc, ws, Amax, Amin, 's');
[Z1, P1, G1] = buttap(N1);
epsilon1 = sqrt(10^(0.1*Amax)-1);
w0p1 = wc*epsilon1^(-1/N1);
P1 = P1*w0p1;
G1 = G1*w0p1^N1;

% Synthesis of the Chebyshev-I filter
[N2, Wn2] = cheb1ord(wc, ws, Amax, Amin, 's');
[Z2, P2, G2] = cheb1ap(N2, Amax);
P2 = P2*wc;
G2 = G2*wc^N2;

% Synthesis of the Chebyshev-II filter
[N3, Wn3] = cheb2ord(wc, ws, Amax, Amin, 's');
[Z3, P3, G3] = cheb2ap(N3, Amin);
Z3 = Z3*ws;

P3 = P3*ws;
G3 = G3*ws^(length(P3)-length(Z3));

% Synthesis of the Cauer filter
[N4, Wn4] = ellipord(wc, ws, Amax, Amin, 's');
[Z4, P4, G4] = ellipap(N4, Amax, Amin);
Z4 = Z4*wc;
P4 = P4*wc;
G4 = G4*wc^(length(P4)-length(Z4));

%For this third filter, N1 = 84, N2 = 21, N3 = 21 and N4 = 9.

%% QUESTION 2.1.B %%

wc = 0.3;
ws = 0.5;
Amax = 0.1;
Amin = 60;

% Synthesis of the Butterworth filter
[N1, Wn1] = buttord(wc, ws, Amax, Amin, 's');
[Z1, P1, G1] = buttap(N1);
epsilon1 = sqrt(10^(0.1*Amax)-1);
w0p1 = wc*epsilon1^(-1/N1);
P1 = P1*w0p1;
G1 = G1*w0p1^N1;

[Z1d ,P1d ,G1d] = bilinear(Z1, P1, G1, 1);
wT = linspace(0,pi,5000);
[N1d, D1d] = zp2tf(Z1d, P1d, G1d);
[H1,wT] = freqz(N1d, D1d, wT);
magdB1 = 20*log10(abs(H1));
[gd1,wT] = grpdelay(N1d, D1d, wT);

figure;
freqz(H1,1,1024,fs);
title('Butterworth Filter (Frequency response)');
figure;
plot(wT*180/pi,gd1);
xlabel('\omegaT [degrees]');
ylabel('\tau_g(\omega) [T]');
title('Butterworth Filter (Group Delay)');

% Synthesis of the Chebyshev-I filter
[N2, Wn2] = cheb1ord(wc, ws, Amax, Amin, 's');
[Z2, P2, G2] = cheb1ap(N2, Amax);
P2 = P2*wc;
G2 = G2*wc^N2;

[Z2d ,P2d ,G2d] = bilinear(Z2, P2, G2, 1);
wT = linspace(0,pi,5000);
[N2d, D2d] = zp2tf(Z2d, P2d, G2d);
[H2,wT] = freqz(N2d, D2d, wT);
magdB2 = 20*log10(abs(H2));
[gd2,wT] = grpdelay(N2d, D2d, wT);

figure;
freqz(H2,1,1024,fs);
title('Chebyshev-I Filter (Frequency response)');
figure;
plot(wT*180/pi,gd2);
xlabel('\omegaT [degrees]');
ylabel('\tau_g(\omega) [T]');
title('Chebyshev-I Filter (Group Delay)');

% Synthesis of the Chebyshev-II filter
[N3, Wn3] = cheb2ord(wc, ws, Amax, Amin, 's');
[Z3, P3, G3] = cheb2ap(N3, Amin);
Z3 = Z3*ws;

P3 = P3*ws;
G3 = G3*ws^(length(P3)-length(Z3));

[Z3d ,P3d ,G3d] = bilinear(Z3, P3, G3, 1);
wT = linspace(0,pi,5000);
[N3d, D3d] = zp2tf(Z3d, P3d, G3d);
[H3,wT] = freqz(N3d, D3d, wT);
magdB3 = 20*log10(abs(H3));
[gd3,wT] = grpdelay(N3d, D3d, wT);

figure;
freqz(H3,1,1024,fs);
title('Chebyshev-II Filter (Frequency response)');
figure;
plot(wT*180/pi,gd3);
xlabel('\omegaT [degrees]');
ylabel('\tau_g(\omega) [T]');
title('Chebyshev-II Filter (Group Delay)');

% Synthesis of the Cauer filter
[N4, Wn4] = ellipord(wc, ws, Amax, Amin, 's');
[Z4, P4, G4] = ellipap(N4, Amax, Amin);
Z4 = Z4*wc;
P4 = P4*wc;
G4 = G4*wc^(length(P4)-length(Z4));

[Z4d ,P4d ,G4d] = bilinear(Z4, P4, G4, 1);
wT = linspace(0,pi,5000);
[N4d, D4d] = zp2tf(Z4d, P4d, G4d);
[H4,wT] = freqz(N4d, D4d, wT);
magdB4 = 20*log10(abs(H4));
[gd4,wT] = grpdelay(N4d, D4d, wT);

figure;
freqz(H4,1,1024,fs);
title('Cauer Filter (Frequency response)');
figure;
plot(wT*180/pi,gd4);
xlabel('\omegaT [degrees]');
ylabel('\tau_g(\omega) [T]');
title('Cauer Filter (Group Delay)');

%% QUESTION 1.1.C %%



%% QUESTION 1.1.D %%

%% QUESTION 1.2.A %%

%% QUESTION 1.2.B %%

%% QUESTION 1.2.C %%

%% QUESTION 1.3.A %%

%% QUESTION 1.3.B %%

%% QUESTION 1.3.C %%
