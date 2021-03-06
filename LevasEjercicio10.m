clc
clear all
close all

h = 2.5;
Rb = 2;
Rf = 1;

tetha1 = 0:0.05:60;
tetha2 = 60:0.05:180;
tetha3 = 180:0.05:210;
tetha4 = 210:0.05:360;

y1 =(h/2)*(1-cos(pi*(tetha1/60)));
y2 = h*(tetha2/tetha2);
y3 = (h/2)*(1+cos(pi*(tetha3/30)));
y4 = 0*tetha4;

plot(tetha1,y1),hold on
plot(tetha2,y2),hold on
plot(tetha3,y3), hold on
plot(tetha4,y4),hold on
xlim([0 360])
ylim([-0.1 2.6])
title('Desplazamiento')

tetha1ja = 0:60;
tetha2ja = 60:180;
tetha3ja = 180:210;
tetha4ja = 210:360;

y1ja =(h/2)*(1-cos(pi*(tetha1ja/60)));
y2ja = h*(tetha2ja/tetha2ja);
y3ja = (h/2)*(1+cos(pi*(tetha3ja/30)));
y4ja = 0*tetha4ja;

for i = 0:60
    r(i+1) = Rb + y1ja(i+1);
end
for i = 60:180
    r(i+1) = Rb + y2ja;
end
for i = 180:210
    r(i+1) = Rb + y3ja(i-180+1);
end

for i = 210:360
    r(i+1) = Rb + y4ja(i-210+1);
end

nosealv = 0:360;

figure
for i = 0:360
    plot(r(i+1)*cos(degtorad(i)),r(i+1)*sin(degtorad(i)),'r--'), hold on
end
for i = 0:360
    plot(Rb*cos(degtorad(i)),Rb*sin(degtorad(i)),'b--'), hold on
end
grid
axis([-5 5 -5 5])
title('Contorno')