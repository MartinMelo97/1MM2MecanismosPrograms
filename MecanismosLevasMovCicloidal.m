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

y = h*(razon - (1/(2*pi))*sin(2*pi*razon));
subplot(2,3,1)
plot(razon,y)
title('Posición')

yprima = ((h*omegarads)/betarad)*(1-cos(2*pi*razon));
subplot(2,3,2)
plot(razon,yprima)
title('Velocidad')

ydosprima = 2*pi*h*(omegarads/betarad)^2*sin(2*pi*razon);
subplot(2,2,3)
plot(razon,ydosprima)
title('Aceleración')

ytresprima = 4*pi*h^2*(omega/betarad)^3*cos(2*pi*razon);
subplot(2,2,4)
plot(razon,ytresprima)
title('Aceleración choque')

q = yprima/omegarads;

r = Rb + y;

for i=1:length(y)
    phi(i) = atan(q(i)/r(i));
end

subplot(2,3,3)
plot(razon,phi)
title('Ángulo')