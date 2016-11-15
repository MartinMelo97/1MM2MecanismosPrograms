clc
clear all
close all

%Se declaran las variables a introducir por el usuario
h = input('Da la altura: ');
beta = input('Da el ángulo de rotación: ');
Rb = input('Da el radio de la base: ');
omega = input('Da la velocidad angular(rpm): ');

%Con la función degtorad(), se convierte a radianes el ángulo de rotación
betarad = degtorad(beta);

razon = 0:0.05:1;
%Las siguientes 2 razones, se definen para el movimiento parabólico
razon1 = 0:0.05:0.5;
razon2 = 0.5:0.05:1;

%Se convierte la velocidad angular de rpm a rad/seg
omegarads = (omega*2*pi)/60;

%Declaramos una figura para todas las gráficas
figure

%Cálculos y gráficas de posición
    %Movimiento Cicloidal
    ycicloidal = h*(razon - (1/(2*pi))*sin(2*pi*razon));
    %Movimiento Armónico
    yarmonico = (h/2)*(1-cos(pi*razon));
    %Movimiento Parabólico
    y1parabolico = 2*h*(razon1).^2;
    y2parabolico = h*(1 - 2*(1-razon2).^2);
    %Movimiento velocidad constante
    yvelcte = h*razon;
    
    %Graficando
    
    subplot(2,3,1)
    plot(razon,ycicloidal,'r-'), hold on
    plot(razon,yarmonico,'g-'), hold on
    plot(razon1,y1parabolico,'b-'), hold on
    plot(razon2,y2parabolico,'b-'), hold on
    plot(razon,yvelcte,'k-')
    xlabel('\theta / \beta')
    title('Posición')
    
   
%Cálculos y gráficas de velocidad
    %Movimiento Cicloidal
    yprimacicloidal = ((h*omegarads)/betarad)*(1-cos(2*pi*razon));
    %Movimiento Armónico
    yprimaarmonico = ((pi*h*omegarads)/(2*betarad))*sin(pi*razon);
    %Movimiento Parabólico
    y1primaparabolico = (4*h*omegarads*razon1)/betarad;
    y2primaparabolico = ((4*h*omegarads)/betarad)*(1-razon2);
    %Movimiento velocidad constante
    yprimavelcte(1:length(razon)) = (h*omegarads)/betarad;
    
    %Graficando
    
    subplot(2,3,2)
    plot(razon,yprimacicloidal,'r-'), hold on
    plot(razon,yprimaarmonico,'g-'), hold on
    plot(razon1,y1primaparabolico,'b-'), hold on
    plot(razon2,y2primaparabolico,'b-'), hold on
    plot(razon,yprimavelcte,'k-')
    title('Velocidad')
    xlabel('\theta / \beta')
    
%Cálculos y gráficas de aceleración
    %Movimiento Cicloidal
    ydosprimacicloidal = 2*pi*h*(omegarads/betarad)^2*sin(2*pi*razon);
    %Movimiento Armónico
    ydosprimaarmonico = ((h*pi^2)/2)*(omegarads/betarad)^2*cos(pi*razon);
    %Movimiento Parabólico
    y1dosprimaparabolico(1:round(length(razon)/2)) = (4*h*(omegarads)^2)/(betarad)^2;
    y2dosprimaparabolico(1:round(length(razon)/2)) = -(4*h*(omegarads)^2)/(betarad)^2;
    %Movimiento velocidad constante
    ydosprimavelcte(1:length(razon)) = 0;
    
    %Graficando
    
    subplot(2,2,3)
    plot(razon,ydosprimacicloidal,'r-'), hold on
    plot(razon,ydosprimaarmonico,'g-'), hold on
    plot(razon1,y1dosprimaparabolico,'b-'), hold on
    plot(razon2,y2dosprimaparabolico,'b-'), hold on
    plot(razon,ydosprimavelcte,'k-')
    title('Aceleración')
    xlabel('\theta / \beta')
    
%Cálculos y gráficas de sobreaceleración
    %Movimiento Cicloidal
    ytresprimacicloidal = 4*pi*h^2*(omega/betarad)^3*cos(2*pi*razon);
    %Movimiento Armónico
    ytresprimaarmonico = -((h*pi^3)/2)*(omegarads/betarad)^3*sin(pi*razon);
    
    %Graficando
    
    subplot(2,2,4)
    plot(razon,ytresprimacicloidal,'r-'), hold on
    plot(razon,ytresprimaarmonico,'g-'), hold on
    title('Sobreaceleración')
    xlabel('\theta / \beta')

%Cálculos y gráficas del ángulo
    %Movimiento Cicloidal
    qcicloidal = yprimacicloidal/omegarads;
    rcicloidal = Rb + ycicloidal;
    %Movimiento Armónico
    qarmonico = yprimaarmonico/omegarads;
    rarmonico = Rb + yarmonico;
    %Movimiento Parabólico
    q1parabolico = y1primaparabolico/omegarads;
    q2parabolico = y2primaparabolico/omegarads;
    r1parabolico = Rb + y1parabolico;
    r2parabolico = Rb + y2parabolico;
    for i=(1:length(y1parabolico))
        phi1parabolico(i) = atan(q1parabolico(i)/r1parabolico(i));
    end
    for i=(1:length(y2parabolico))
        phi2parabolico(i) = atan(q2parabolico(i)/r2parabolico(i));
    end
    %Movimiento velocidad constante
    qvelcte = yprimavelcte/omegarads;
    rvelcte = Rb + yvelcte;
    
    %Hacemos un for para los valores de todos los movimientos, excepto el
    %parabólico
    
    for i=1:length(razon)
        phicicloidal(i) = atan(qcicloidal(i)/rcicloidal(i));
        phiarmonico(i) = atan(qarmonico(i)/rarmonico(i));
        phivelcte(i) = atan(qvelcte(i)/rvelcte(i));
    end
    
    %Graficando
    subplot(2,3,3)
    plot(razon,phicicloidal,'r-'), hold on
    plot(razon,phiarmonico,'g-'), hold on
    plot(razon1,phi1parabolico,'b-'), hold on
    plot(razon2,phi2parabolico,'b-'), hold on
    plot(razon,phivelcte,'k-')
    title('Ángulo')
    ylabel('\phi')