import matplotlib.pyplot as plt
import numpy as np
import math
from scipy.integrate import odeint
import matplotlib.animation as animation

plt.close('all')

###############################################################################
####                           Pendulum Class                              ####

class Pendulum():
    def __init__(self, gravity, mass, length, theta_initial, thetaDot_initial, timeDuration, dt):
        self.g = gravity                                    # [m/s]
        self.m = mass                                       # [kg]
        self.l = length                                     # [m]
        self.theta_initial = theta_initial                  # [rad]
        self.thetaDot_initial = thetaDot_initial            # [rad/s]
        self.duration = timeDuration                        # [s]
        self.dt = dt                                        # [s]
        self.time = np.arange(0,self.duration,self.dt)      # [s]
        self.theta = np.zeros_like(self.time)               # [rad]
        self.thetaDot = np.zeros_like(self.time)            # [rad/s]
        self.thetaDotDot = np.array([])                     # [rad/s2]
        self.F_r = np.array([])                             # [N]
        self.F_theta = np.array([])                         # [N]
        self.F_z = np.array([])                             # [N] 
        
    def model(self, G, t):
        """Modeling the differential equation of motion"""
        temp_theta = G[0]
        Q = G[1]             # Q is thetaDot (angular velocity)
        
        QDot = -self.g/self.l*math.sin(temp_theta)   # QDot is thetaDotDot (angular acceleration)
        
        return [Q, QDot]
    
    def solve(self):   
        """Solving the differential equation of motion"""
        
        z0 = [self.theta_initial, self.thetaDot_initial]
        
        self.theta[0] = z0[0]
        self.thetaDot[0] = z0[1]
        
        for ii in range(1,len(self.time)):  
            tspan = [self.time[ii-1], self.time[ii]]
            z = odeint(self.model, z0, tspan)
            
            self.theta[ii] = z[1][0]
            self.thetaDot[ii] = z[1][1]            
            
            z0 = z[1]   # Need to reset the initial conditions for the next time step
    
    def PlotForces(self): 
        
        self.thetaDotDot = -self.g/self.l*np.sin(self.theta)
        self.F_r = self.m*self.g*np.cos(self.theta)+self.m*self.l*self.thetaDot**2
        self.F_theta = self.m*self.l*self.thetaDotDot + self.m*self.g*np.sin(self.theta)
        self.F_z = np.zeros_like(self.F_r)
        
        plt.figure()
        plt.plot(self.time, self.F_r, label="F_r", linewidth=4)
        plt.plot(self.time, self.F_theta, label="F_theta", linewidth=4)
        plt.plot(self.time, self.F_z, label="F_z", linewidth=4, linestyle='--')
        plt.grid()
        plt.xlabel('Time [sec]')
        plt.ylabel('Force')
        plt.legend()
            
###############################################################################
####                Add as many pendulums as you want here                 ####     

duration = 10
dt = 0.01

Pendulum_1 = Pendulum(gravity = 9.81, mass = 2, length = 0.5, theta_initial = math.radians(45),\
                      thetaDot_initial = math.radians(0), timeDuration = duration, dt = dt)
Pendulum_1.solve()

# Pendulum_2 = Pendulum(gravity = 9.81, mass = 2, length = 1, theta_initial = math.radians(45),\
#                       thetaDot_initial = math.radians(0), timeDuration = duration, dt = dt)
# Pendulum_2.solve()

# Pendulum_3 = Pendulum(gravity = 9.81, mass = 2, length = 1.5, theta_initial = math.radians(45),\
#                       thetaDot_initial = math.radians(0), timeDuration = duration, dt = dt)
# Pendulum_3.solve()

# Pendulum_4 = Pendulum(gravity = 9.81, mass = 2, length = 2, theta_initial = math.radians(45),\
#                       thetaDot_initial = math.radians(0), timeDuration = duration, dt = dt)
# Pendulum_4.solve()

# Pendulum_5 = Pendulum(gravity = 9.81, mass = 2, length = 2.5, theta_initial = math.radians(45),\
#                       thetaDot_initial = math.radians(0), timeDuration = duration, dt = dt)
# Pendulum_5.solve()

# Pendulums = [Pendulum_1, Pendulum_2, Pendulum_3, Pendulum_4, Pendulum_5]


Pendulums = [Pendulum_1]

###############################################################################
####                                Plotting                               ####

plt.figure()
for ii in range(len(Pendulums)):
    plt.plot(Pendulums[ii].time, Pendulums[ii].theta*180/math.pi,linewidth=3, label="Pendulum "+str(ii+1))
    
plt.title('Angle')
plt.xlabel('time [s]')
plt.ylabel('angle [deg]')
plt.grid()
plt.legend()

###############################################################################
####                              Animation                                ####

Origin_x = Origin_y = Origin_z = np.zeros_like(Pendulums[0].time)

Linewidth = 3

fig = plt.figure()
ax1 = fig.add_subplot(1, 1, 1)

PendulumLengths = [Pendulums[ii].l for ii in range(len(Pendulums))]

lines = []
temp = []
for ii in range(len(Pendulums[0].time)):
    ax1.cla()
    ax1.set_aspect('equal')
    ax1.set(xlim=(-max(PendulumLengths),max(PendulumLengths)),ylim=(-max(PendulumLengths),1))
    ax1.grid()
    
    for jj in range(len(Pendulums)): 
        
        PendulumEnd_x = Pendulums[jj].l*np.sin(Pendulums[jj].theta[ii])
        PendulumEnd_y = -Pendulums[jj].l*np.cos(Pendulums[jj].theta[ii])
        
        Line, = ax1.plot([Origin_x[ii], PendulumEnd_x], [Origin_y[ii],PendulumEnd_y], linewidth=Linewidth)
            
        Point, = ax1.plot(PendulumEnd_x, PendulumEnd_y, color='pink', marker='o', markeredgecolor='r', markersize=5*Pendulums[jj].m)

        temp.append(Line)
        temp.append(Point)
    
    time_text = "Time = " + "{:.2f}".format(Pendulums[0].time[ii]) + "seconds"
    time_label = ax1.text(-0.5,0.5,time_text)
    temp.append(time_label)

    temp = tuple(temp)
    lines.append(temp)
    temp = list(temp)
    temp.clear()
    
plt.tight_layout()
ani = animation.ArtistAnimation(fig, lines, interval=dt, blit=True)

###############################################################################
####                      Plotting the Forces                              ####

for ii in range(len(Pendulums)): 
    Pendulums[ii].PlotForces()

###############################################################################

print('\nDone...\n')