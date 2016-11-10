import math
#import matplotlib
import numpy as np

AB = 3
BC = 8
CD = 6
AD = 7
tetha = int(input("Ingresa el valor del ángulo de la manivela en grados: "))

#Convertimos el ángulo a Radianes
tetharad = math.radians(tetha)
#Calculamos la magnitud de la distancia BD
BD = math.sqrt(math.pow(AB,2) + math.pow(AD,2) - (2*AB*AD*math.cos(tetharad)))

#Ahora calculemos el ángulo de transmisión, que llamaremos delta
deltarad = math.acos((math.pow(BD,2)-math.pow(BC,2) -math.pow(CD,2))/(-2*BC*CD))
#Convertimos el valor a grados
delta = math.degrees(deltarad)

#Para encontrar la posición angular, debemos encontrar 2 ángulos
#El primero, lo llamaremos sigma y será el ángulo entre las rectas AD y BD
sigmarad = math.asin((AB*math.sin(tetharad))/BD)
sigma = math.degrees(sigmarad)

#El segundo, lo llamaremos alfa y es el comprendido entre BD y CD
alfarad = math.asin((BC*math.sin(deltarad))/BD)
alfa = math.degrees(alfarad)

#Para calcular la posición angular(beta) basta con:
beta = 180 - sigma - alfa

#Imprimiendo los valores pedidos
print("Posición angular del eslabón 4: ",round(beta,2))
print("Angulo de transmisión: ",round(delta,2))

#Ahora proseguiremos a calcular RT, deltateta, tavance, tretorno
#Para esto utilizaremos las posiciones extremas del mecanismo
wman = 10
#Convertimos la velocidad angular a rev/set
wmanrev = 10/(2*math.pi)

#Analicemos la primer posición extrema (r+l || AB + BC)
tethaped1rad = math.acos((math.pow(CD,2)-math.pow((AB+BC),2) - math.pow(AD,2))/(-2*(AB+BC)*AD))
tethaped1 = math.degrees(tethaped1rad)
sigmaped1rad = math.asin(((AB+BC)*math.sin(tethaped1rad))/CD)
sigmaped1 = math.degrees(sigmaped1rad)
bethaped1 = 180 - sigmaped1


#Ahora analiemos la otra posicion extrema (r-l || BC - AB)
tethaped2rad = math.acos((math.pow(CD,2)-math.pow((BC-AB),2) - math.pow(AD,2))/(-2*(BC-AB)*AD))
tethaped2 = math.degrees(tethaped2rad)
sigmaped2rad = math.asin(((BC-AB)*math.sin(tethaped2rad))/CD)
sigmaped2 = math.degrees(sigmaped2rad)
bethaped2 = 180 - sigmaped2


#Teniendo estos valores, podemos calcular las diferencias de los angulos tetha y betha
diftetha = tethaped2 - tethaped1
difbetha = bethaped2 - bethaped1
print("Ángulo de oscilación del eslabón 4: ",round(difbetha,2))

diftciclo = 1/wmanrev

#Caculando la razón de tiempo
RT = (180 + diftetha)/(180 - diftetha)
print("Razón de tiempos: ",round(RT,2))

#Despejando en ambas ecuaciones
t1 = diftciclo/(1+RT)
t2 = diftciclo - t1
print("Tiempo de avance: ",round(t1,2))
print("Tiempo de retorno: ",round(t2,2))
