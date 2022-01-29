import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

plt.close('all')

###############################################################################
####                         Define Parameters                             ####

m = 5                           # Mass [kg]
k = 50                          # Spring Constant [N/m]
UnstrechedSpringLength = 0.5    # [m]

duration = 5        # How long the simulation will run for [sec]
dt = 0.01           # Time step of the simulation [sec]

x_initial = 0.5     # Initial displacement of the spring [m]
xDot_initial = 0    # Initial velocity of the mass [m/s]    

###############################################################################
####                             Functions                                 ####

def model(G,t):
    x = G[0] # Displacement of mass for this time step [m]
    Q = G[1] # Velocity of the mass for this time step [m/s]
    
    QDot = -k*x/m   # Differential Equation of Motion
    
    return [Q, QDot]

###############################################################################
####                      Solving Differential Equation                    ####

z0 = [x_initial, xDot_initial]          # Initial conditions

time = np.arange(0,duration,dt)         # Time array

# Creating vectors to save data
ParticlePosition = np.zeros_like(time)    
ParticleVelocity = np.zeros_like(time)

# Saving first iteration of initial coniditions
ParticlePosition[0] = z0[0] + UnstrechedSpringLength    # Actual position of mass is the unstretched spring length added to the displacement, x
ParticleVelocity[0] = z0[1]

for ii in range(1,len(time)):
    
    tspan = [time[ii-1], time[ii]]
    z = odeint(model, z0, tspan)
    
    # Saving solution at each time step
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