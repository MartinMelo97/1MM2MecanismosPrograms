clc
clear all
close all

h = input('Da la altura: ');
beta = input('Da el ángulo de rotación: ');
Rb = input('Da el radio de la base: ');
omega = input('Da la velocidad angular(rpm): ');

betarad = degtorad(beta);
razon = 0:0.05:1;

omegarads = (omega*2*pi)/60;

y = h*razon;
subplot(2,2,1)
plot(razon,y)
title('Posición')

yprima(1:21) = (h*omegarads)/betarad;
subplot(2,2,2)
plot(razon,yprima)
title('Velocidad')

ydosprima(1:21) = 0;
subplot(2,2,3)
plot(razon,ydosprima)
title('Aceleración')

q = yprima/omegarads;

r = Rb + y;

for i=1:length(y)
    phi(i) = atan(q(i)/r(i));
end

subplot(2,2,4)
plot(razon,phi)
title('Ángulo')