import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

plt.close('all')

###############################################################################
####                         Define Parameters                             ####

m = 5                           # Mass [kg]
k = 50                          # Spring Constant [N/m]
UnstrechedSpringLength = 0.5    # [m]

duration = 5
dt = 0.01

x_initial = 0.5     # [m]
xDot_initial = 0   # [m/s]

###############################################################################
####                             Functions                                 ####

def model(G,t):
    x = G[0]
    Q = G[1]
    
    QDot = -k*x/m
    
    return [Q, QDot]

###############################################################################
####                      Solving Differential Equation                    ####

z0 = [x_initial, xDot_initial]

time = np.arange(0,duration,dt)

# Creating vectors to save data
ParticlePosition = np.zeros_like(time)
ParticleVelocity = np.zeros_like(time)

# Saving initial coniditions
ParticlePosition[0] = z0[0] + UnstrechedSpringLength
ParticleVelocity[0] = z0[1]

for ii in range(1,len(time)):
    
    tspan = [time[ii-1], time[ii]]
    z = odeint(model, z0, tspan)
    
    ParticlePosition[ii] = z[1][0] + UnstrechedSpringLength
    ParticleVelocity[ii] = z[1][1]
    
    z0 = z[1]

###############################################################################
####                                Plotting                               ####

plt.figure()
plt.plot(time,ParticlePosition,linewidth=3)
plt.title('Particle Position')
plt.xlabel('time [s]')
plt.ylabel('Displacement [m]')
plt.grid()

print('\nDone...\n')

###############################################################################