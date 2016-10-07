'''Programa para encontrar posiciones, velocidades y aceleraciones de una mecanismo
manivela,biela,corredera'''

import math

manivela = float(input("Da la longitud de la manivela: "))
balancin = float(input("Da la longitud del balancín o biela: "))
'''tetha = float(input("Da el angulo de la manivela con respecto al marco de referencia"))'''
corredera = float(input("Da la longitud de la corredera en esta fase: "))
manVelAng = float(input("Da la velocidad angular de la manivela: "))
manAceAng = float(input("Da la aceleración angular de la manivela: "))

print()
print('Resultados')
print()
'''Calculando tetha'''
tetha = math.acos((math.pow(balancin,2) - math.pow(manivela,2) - math.pow(corredera,2))/(-2*manivela*corredera))
tethadeg = math.degrees(tetha)
print('Angulo tetha: ',tethadeg)

'''Ecuaciones de posicion'''

betha = math.asin((-manivela*math.sin(tetha))/balancin)
bethadeg = math.degrees(betha)
print('Angulo betha: ',bethadeg)

'''Ecuaciones de velocidad'''

bethaVelAng = (-manivela*math.cos(tetha)*manVelAng*-1)/(balancin*math.cos(betha))
correderaVel = -(manivela*math.sin(tetha)*manVelAng*-1)-(balancin*math.sin(betha)*bethaVelAng)

print('Velocidad angular del eslabon BC: ',bethaVelAng)
print('Velocidad de la corredera: ',correderaVel)

'''Ecuaciones de aceleracion'''

bethaAceAng = ((-manivela*math.cos(tetha)*manAceAng*-1) + (manivela*math.sin(tetha)*math.pow(manVelAng,2)) + (balancin*math.sin(betha)*math.pow(bethaVelAng,2)))/(balancin*math.cos(betha))
correderaAce = -(manivela*math.sin(tetha)*manAceAng*-1) - (manivela*math.cos(tetha)*math.pow(manVelAng,2)) - (balancin*math.sin(betha)*bethaAceAng) - (balancin*math.cos(betha)*math.pow(bethaVelAng,2))
print('Aceleración angular del eslabón BC: ',bethaAceAng)
print('Aceleracion de la corredera: ',correderaAce)
