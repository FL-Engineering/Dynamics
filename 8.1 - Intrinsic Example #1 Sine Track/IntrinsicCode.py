import matplotlib.pyplot as plt
import numpy as np
import math
from matplotlib.animation import FuncAnimation

plt.close('all')

# This code is from the following YouTube video: https://www.youtube.com/watch?v=18oPdRDd-II&t=47s

###############################################################################
####                         Define Parameters                             ####

duration = 2
dt = 0.01

x_initial = 0
xDot = math.pi

time = np.arange(0,duration,dt)

###############################################################################
####                             Animation Data                            ####

point_x = np.zeros_like(time)

for ii in range(len(time)): 
    point_x[ii] = xDot*time[ii]
    
point_y = np.sin(point_x)

intrinsic_scaling = 1

# Defining tangential vector coordianates
et_x1 = point_x
et_x2 = et_x1 + (1/np.sqrt(1+np.cos(point_x)**2))/intrinsic_scaling
et_y1 = point_y
et_y2 = et_y1 + (np.cos(point_x)/np.sqrt(1+np.cos(point_x)**2))/intrinsic_scaling

gamma = np.sqrt(1+np.cos(point_x)**2)

alphaA = xDot**2*np.sin(point_x)**2*np.cos(point_x)**2/(gamma**6)
alphaB = xDot**2*np.sin(point_x)**2*np.cos(point_x)**4/(gamma**6)
alphaC = -2*xDot**2*np.sin(point_x)**2*np.cos(point_x)**2/(gamma**4)
alphaD = xDot**2*np.sin(point_x)**2/(gamma**2)

alpha = np.sqrt(alphaA + alphaB + alphaC + alphaD)

en_x1 = point_x
en_x2 = en_x1 + (xDot*np.sin(point_x)*np.cos(point_x)/(alpha*gamma**3))/intrinsic_scaling
en_y1 = point_y
en_y2 = en_y1 + (xDot*np.sin(point_x)*np.cos(point_x)**2/(alpha*gamma**3) - xDot*np.sin(point_x)/(alpha*gamma))/intrinsic_scaling

eb_z = -xDot*np.sin(point_x)/(alpha*gamma**2)
eb_z[0] = -1  # I had to do this because the first index returned NaN

###############################################################################
####                               Animation                               ####

plt.figure()

def init(): 
    line.set_data([],[])
    return line

ax1 = plt.subplot(1,1,1)
line, = ax1.plot([],[],'o-', lw=2)

def animate(i): 
    ax1.cla()
    ax1.set_aspect('equal')
    ax1.set(xlim=(0,8),ylim=(-2,2))
    ax1.grid()
    ax1.plot(point_x,point_y,linewidth=3)
    ax1.plot(point_x[i],point_y[i], color='red', marker='o', markeredgecolor='r', markersize=20)
    ax1.plot([et_x1[i],et_x2[i]],[et_y1[i],et_y2[i]],lw=3,color='green')
    ax1.plot([en_x1[i],en_x2[i]],[en_y1[i],en_y2[i]],lw=3,color='green')
    if eb_z[i] > 0:
        ax1.plot(et_x1[i], et_y1[i], color='green', marker='o',markeredgecolor='g',markersize=10)
    else:
        ax1.plot(et_x1[i], et_y1[i], color='green', marker='X',markeredgecolor='g',markersize=10)
      
    ax1.text(et_x2[i], et_y2[i], 'e_t')
    ax1.text(en_x2[i], en_y2[i], 'e_n')
    ax1.text(et_x1[i]-0.1, et_y1[i]+0.08, 'e_b')

ani = FuncAnimation(plt.gcf(), animate, range(0,len(time)), interval=dt*1000, init_func=init)

manager = plt.get_current_fig_manager()
manager.window.showMaximized()

plt.show()

###############################################################################

print('\nDone...\n')