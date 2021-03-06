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

beta1com = 0:45;
beta2com = 45:195;
beta3com = 195:285;
beta4com = 285:360;

y1la = h*((beta1com/45)-((1/(2*pi))*sin(2*pi*(beta1com/45))));
y2la = h*(beta2com/beta2com);
y3la = h*(((285-beta3com)/90)-((1/(2*pi))*sin(2*pi*((285-beta3com)/90))));
y4la = 0*beta4com;

for i = 0:45
    r(i+1) = Rb + y1la(i+1);
    disp(r+1)
end
for i = 45:195
    r(i+1) = Rb + y2la;
end
for i=195:285
    r(i+1) = Rb + y3la(i+1-195);
end
for i=285:360
    r(i+1) = Rb + y4la(i+1-285);
end
nosealv = 0:360;

figure
plot(beta1,y1), hold on
plot(beta2,y2), hold on
plot(beta3,y3), hold on
plot(beta4,y4)
xlim([0 360])
title('Gr�fica de desplazamiento')
ylim([-0.01 1.6])

figure
for i = 0:360
    plot(r(i+1)*cos(degtorad(i)),r(i+1)*sin(degtorad(i)),'r--'),hold on
end
for i = 0:360
    plot(Rb*cos(degtorad(i)),Rb*sin(degtorad(i)),'b--'),hold on
end
axis([-4 4 -4 4])
title('Perfil de la leva')
grid
