clc
clear all
close all

h = input('Da la altura: ');
beta = input('Da el ángulo de rotación: ');
Rb = input('Da el radio de la base: ');
omega = input('Da la velocidad angular(rpm): ');
betarad = degtorad(beta);

razon1 = 0:0.05:0.5;
razon2 = 0.5:0.05:1;
razon = 0:0.05:1;

omegarads = (omega*2*pi)/60;

y = 2*h*(razon1).^2;
y2 = h*(1 - 2*(1-razon2).^2);

subplot(2,2,1)
plot(razon1,y), hold on
plot(razon2,y2)
title('Posicion')

y1prima = (4*h*omegarads*razon1)/betarad;
y2prima = ((4*h*omegarads)/betarad)*(1-razon2);

subplot(2,2,2)
plot(razon1,y1prima), hold on
plot(razon2,y2prima)
title('Velocidad')

y1primados(1:11) = (4*h*(omegarads)^2)/(betarad)^2;
y2primados(1:11) = -(4*h*(omegarads)^2)/(betarad)^2;
subplot(2,2,3)
plot(razon1,y1primados), hold on
plot(razon2,y2primados)
title('Aceleración')

q1 = y1prima/omegarads;

r1 = Rb + y;

for i=1:length(y)
    phi1(i) = atan(q1(i)/r1(i));
end

q2 = y2prima/omegarads;

r2 = Rb + y2;

for i=1:length(y2)
    phi2(i) = atan(q2(i)/r2(i));
end
subplot(2,2,4)
plot(razon1,phi1), hold on
plot(razon2,phi2)
title('Ángulo')
