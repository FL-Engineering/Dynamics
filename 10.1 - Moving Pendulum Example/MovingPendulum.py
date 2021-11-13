import matplotlib.pyplot as plt
import numpy as np
import math
from scipy.integrate import odeint
import matplotlib.animation as animation

plt.close('all')

###############################################################################
####                              Parameters                               ####

l = 1                 # [m]
g = 9.81              # [m/s2]

A = 0.5               # Amplitude [m]
freq = 0.25           # [Hz]

theta_initial = 0     # [deg]
thetaDot_initial = 0  # [deg/sec]

duration = 10         # [sec]
dt = 0.01             # [sec]

###############################################################################

def model(G, t, collar_accel):
    """Modeling the differential equation of motion"""
    temp_theta = G[0]
    Q = G[1]             # Q is thetaDot (angular velocity)
    
    QDot = 1/l*(-g*math.sin(temp_theta) - collar_accel*math.cos(temp_theta))  # QDot is thetaDotDot (angular acceleration)
    
    return [Q, QDot]

###############################################################################


time = np.arange(0,duration,dt)           # [sec]
theta = np.zeros_like(time)               # [rad]
thetaDot = np.zeros_like(time)            # [rad/sec]  

freq = freq*2*math.pi       # [rad/s]

z0 = [math.radians(theta_initial), math.radians(thetaDot_initial)]

theta[0] = z0[0]
thetaDot[0] = z0[1]

xDotDot = -A*freq**2*np.sin(freq*time)

for ii in range(1,len(time)):  
    tspan = [time[ii-1], time[ii]]
    z = odeint(model, z0, tspan, args=(xDotDot[ii],))
    
    theta[ii] = z[1][0]
    thetaDot[ii] = z[1][1]            
    
    z0 = z[1]   # Need to reset the initial conditions for the next time step


x = A*np.sin(freq*time)

###############################################################################
####                                Plotting                               ####

theta = theta*180/math.pi

plt.figure()
plt.plot(time,theta)
plt.title('Theta')
plt.xlabel('Time [sec]')
plt.ylabel('Angle [deg]')
plt.grid()

plt.figure()
plt.plot(time,x)
plt.title('Collar Position')
plt.xlabel('Time [sec]')
plt.ylabel('Displacement [m]')
plt.grid()

plt.figure()
plt.plot(time,xDotDot)
plt.title('Collar Acceleration')
plt.xlabel('Time [sec]')
plt.ylabel('Acceleration [m/s2]')
plt.grid()

###############################################################################
####                              Animation                                ####

theta = theta*math.pi/180

Collar_x = x
Collar_y = np.zeros_like(x)

Link_x = Collar_x + l*np.sin(theta)
Link_y = Collar_y - l*np.cos(theta)

fig = plt.figure()
ax1 = fig.add_subplot(1, 1, 1)

lines = []
for ii in range(len(time)):
    ax1.cla()
    ax1.set(xlim=(-(l+A),l+A),ylim=(-(l+A),l+A))
    ax1.grid()
    ax1.set_aspect('equal')

    Collar, = ax1.plot([Collar_x[ii]], [Collar_y[ii]], color='pink', marker='o', markeredgecolor='r')
    Link, = ax1.plot([Collar_x[ii],Link_x[ii]], [Collar_y[ii],Link_y[ii]], linewidth=3)

    time_text = "Time = " + "{:.2f}".format(time[ii]) + "seconds"
    time_label = ax1.text(-(l+A),-(l+A),time_text)

    lines.append([Collar,Link,time_label])

plt.tight_layout()
ani = animation.ArtistAnimation(fig, lines, interval=dt, blit=True)

###############################################################################


print('\nDone...\n')