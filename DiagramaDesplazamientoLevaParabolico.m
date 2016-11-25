clc
clear all
close all

h = input('Da la altura: ');
%beta = input('Da el ángulo de rotación: ');
Db = input('Da el diametro de la base: ');
%omega = input('Da la velocidad angular(rpm): ');
%betarad = degtorad(beta);
%Df = input('Da el diametro de la flecha');
%Dc = input('Da el diametro del cubo');
Rb = Db/2;

phi1 = 0:0.01:120;
phi2 = 120:0.01:150;
phi3 = 150:0.01:180;
phi4 = 180:0.01:210;
phi5 = 210:0.01:285;
phi6 = 285:0.01:360;

phirad1 = degtorad(phi1);
phirad2 = degtorad(phi2);
phirad3 = degtorad(phi3);
phirad4 = degtorad(phi4);
phirad5 = degtorad(phi5);
phirad6 = degtorad(phi6);


y1 = 0*phi1;
y2 = 2*h*((phi2-120)/60).^2;
y3 = h*(1-(2*(1-((phi3-120)/60)).^2));
y4 = h*(phi4/phi4);
y5 = h*(1-2*((phi5-210)/150).^2);
y6 = 2*h*(1-((phi6-210)/150)).^2;

plot(phi1,y1),hold on
plot(phi2,y2),hold on
plot(phi3,y3),hold on
plot(phi4,y4),hold on
plot(phi5,y5),hold on
plot(phi6,y6),hold on
xlim([0 360])
ylim([-0.01 0.9])

r1 = Rb + y1;
r2 = Rb + y2;
r3 = Rb + y3;
r4 = Rb + y4;
r5 = Rb + y5;
r6 = Rb + y6;

for i = 1:361
    aux(i) = 4;
end
nose = 0:1:360;
figure
polar(nose,aux), hold on
polar(phi1,r1)