clc
clear all
close all
h = input('Da la altura');
beta = input('Da el angulo de rotacion');
Rb = input('Da el radio de la base');
omega = input('Da la velocidad angular');

betarad = degtorad(beta);

razon = 0:0.05:1;

omegarads = (omega*2*pi)/60;

y = h*(razon - (1/(2*pi))*sin(2*pi*razon));
subplot(2,2,1)
plot(razon,y)

yprima = ((h*omega)/betarad)*(1-cos(2*pi*razon));
subplot(2,2,2)
plot(razon,yprima)

ydosprima = 2*pi*h*(omega/betarad)^2*sin(2*pi*razon);
subplot(2,2,3)
plot(razon,ydosprima)

ytresprima = 4*pi*h^2*(omega/betarad)^3*cos(2*pi*razon);
subplot(2,2,4)
plot(razon,ytresprima)

q = yprima/omega;

r = Rb + y;

phi = atan(q/r);
plot(razon,phi), hold on