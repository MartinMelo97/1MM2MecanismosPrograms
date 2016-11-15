clc
clear all
close all

h = input('Da la altura: ');
beta = input('Da el �ngulo de rotaci�n: ');
Rb = input('Da el radio de la base: ');
omega = input('Da la velocidad angular(rpm): ');

betarad = degtorad(beta);
razon = 0:0.05:1;

omegarads = (omega*2*pi)/60;

y = (h/2)*(1-cos(pi*razon));
subplot(2,3,1)
plot(razon,y)
title('Posici�n')

yprima = ((pi*h*omegarads)/(2*betarad))*sin(pi*razon);
subplot(2,3,2)
plot(razon,yprima)
title('Velocidad')

ydosprima = ((h*pi^2)/2)*(omegarads/betarad)^2*cos(pi*razon);
subplot(2,2,3)
plot(razon,ydosprima)
title('Aceleraci�n')

ytresprima = -((h*pi^3)/2)*(omegarads/betarad)^3*sin(pi*razon);
subplot(2,2,4)
plot(razon,ytresprima)
title('Aceleraci�n choque')

q = yprima/omegarads;

r = Rb + y;

for i=1:length(y)
    phi(i) = atan(q(i)/r(i));
end

subplot(2,3,3)
plot(razon,phi)
title('�ngulo')