clc
clear all
close all

h = 1.5;
Rb = 2;
Rf = 1;
beta1 = 0:0.05:45;
beta2 = 45:0.05:195;
beta3 = 195:0.05:285;
beta4 = 285:0.05:360;

y1 = h*((beta1/45)-((1/(2*pi))*sin(2*pi*(beta1/45))));
y2 = h*(beta2/beta2);
y3 = h*(((285-beta3)/90)-((1/(2*pi))*sin(2*pi*((285-beta3)/90))));
y4 = 0*beta4;

figure
plot(beta1,y1), hold on
plot(beta2,y2), hold on
plot(beta3,y3), hold on
plot(beta4,y4)
xlim([0 360])
ylim([-0.01 1.6])

for i = 1:45
    r(i+1) = Rb + y1;
end
