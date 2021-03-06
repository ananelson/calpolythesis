%% Converts Impedance Analyzer data to Matlab Plots
clc; clear all; close all;

filename = ['test20'];
data1 = importdata(filename(1,:));
data1(1:1,:)=[];
n1=length(data1);
m = n1;

data = zeros(m,5);
data(1:n1,:) = data1;

magn = data(:,1);
freq = data(:,2);
% imag = (-1).*data(:,3);
% real = data(:,4);
angl = data(:,5);
%%
A = .005^2;
eps0 = 8.854187e-12;
d = 10e-6;
omega = 2*pi*freq;


    G = cos(angl)./(magn);
    C = -sin(angl)./(magn);

C0 = (A*eps0)./(d);
e2 = G./(omega.*C0);
e1 = C./(omega.*C0);


%% Frequency Sweep Data

figure(1)
%subplot(2,2,1)
semilogx(freq,e1,'.');
title('Storage Dielectic Permittivity vs. Frequency')
xlabel('f (Hz)')
ylabel('\epsilon`')
grid on
hold on

figure(2)
%subplot(2,2,3)
semilogx(freq,e2,'k.');
title('Permittivity Loss vs. Frequency')
xlabel('f (Hz)')
ylabel('\epsilon"')
grid on
hold on

figure(3)
%subplot(2,2,4)
plot(e1,e2,'.');
title('Imaginery vs. Real Dielctric Permittivity')
xlabel('\epsilon`')
ylabel('\epsilon"')
axis equal
%axis ([0 15 0 15])
grid on
hold on

% %% Fitting the Theory over the data
% close all
% 
% figure(1)
% %subplot(2,2,1)
% semilogx(freq,e1,'.');
% title('Storage Dielectic Permittivity vs. Frequency')
% xlabel('f (Hz)')
% ylabel('\epsilon`')
% grid on
% hold on
% 
% x = freq;
% y = e1;
% 
% grid on
% title('Debye Dispersion Theory')
% xlabel('Frequency (kHz)')
% ylabel('\epsilon')
% 
% fun = @(Einf,delE,relaxFreq,beta,g,x) real(Einf + (delE./(1 + (1i.*(x./relaxFreq)).^(beta))) + g);
% realmodel = fit(x,y,fun,'StartPoint',[0 3 10^(4) 0 0]);
% plot(realmodel,'g')
% disp(realmodel)
% %%
% 
% figure(2)
% %subplot(2,2,3)
% semilogx(freq,e2,'.');
% title('Permittivity Loss vs. Frequency')
% xlabel('f (Hz)')
% ylabel('\epsilon"')
% grid on
% hold on
% 
% x = freq;
% y = e2;
% 
% grid on
% title('Debye Dispersion Theory')
% xlabel('Frequency (kHz)')
% ylabel('\epsilon')
% 
% fun = @(Einf,delE,relaxFreq,beta,g,x) imag(Einf + (delE./(1 + (1i.*(x./relaxFreq)).^(beta))) + g);
% imaginarymodel = fit(x,y,fun,'StartPoint',[0 10 10^(3.3) 0 0]);
% plot(imaginarymodel,'r')
% disp(imaginarymodel)


