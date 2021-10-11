import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

plt.close('all')

# This code is from the following YouTube video: https://www.youtube.com/watch?v=KWl5AbSyJNg

###############################################################################

# I didn't write this function. Stack overflow guy did it.
# https://stackoverflow.com/questions/13685386/matplotlib-equal-unit-length-with-equal-aspect-ratio-z-axis-is-not-equal-to
def set_axes_equal(ax):
    '''Make axes of 3D plot have equal scale so that spheres appear as spheres,
    cubes as cubes, etc..  This is one possible solution to Matplotlib's
    ax.set_aspect('equal') and ax.axis('equal') not working for 3D.

    Input
      ax: a matplotlib axis, e.g., as output from plt.gca().
    '''

    x_limits = ax.get_xlim3d()
    y_limits = ax.get_ylim3d()
    z_limits = ax.get_zlim3d()

    x_range = abs(x_limits[1] - x_limits[0])
    x_middle = np.mean(x_limits)
    y_range = abs(y_limits[1] - y_limits[0])
    y_middle = np.mean(y_limits)
    z_range = abs(z_limits[1] - z_limits[0])
    z_middle = np.mean(z_limits)

    # The plot bounding box is a sphere in the sense of the infinity
    # norm, hence I call half the max range the plot radius.
    plot_radius = 0.5*max([x_range, y_range, z_range])

    ax.set_xlim3d([x_middle - plot_radius, x_middle + plot_radius])
    ax.set_ylim3d([y_middle - plot_radius, y_middle + plot_radius])
    ax.set_zlim3d([z_middle - plot_radius, z_middle + plot_radius])


###############################################################################
####                              Parameters                               ####

a = 2
b = 2
c = 1

duration = 10
dt = 0.025

###############################################################################
####                           Intrinsic Data                              ####

time = np.arange(0,duration,dt)

x_coor = a*np.cos(time)
y_coor = b*np.sin(time)
z_coor = c*time

speed = np.sqrt((-a*np.sin(time))**2 + (b*np.cos(time))**2 + c**2)

et_x = x_coor + (-a*np.sin(time))/speed
et_y = y_coor + (b*np.cos(time))/speed
et_z = z_coor + c/speed

alpha = 1/speed

gamma = (b**2*np.sin(time)*np.cos(time)-a**2*np.sin(time)*np.cos(time))/((a**2*np.sin(time)**2+b**2*np.cos(time)**2+c**2)**(3/2))

beta = np.sqrt((-a*np.cos(time)*alpha - a*np.sin(time)*gamma)**2 + (-b*np.sin(time)*alpha+b*np.cos(time)*gamma)**2 + (c*gamma)**2)

en_x = x_coor + (-a*np.cos(time)*alpha - a*np.sin(time)*gamma)/beta
en_y = y_coor + (-b*np.sin(time)*alpha + b*np.cos(time)*gamma)/beta
en_z = z_coor + c*gamma/beta

eb_x = x_coor + (b*np.cos(time)*alpha*c*gamma/beta) - c*alpha*(-b*np.sin(time)*alpha + b*np.cos(time)*gamma)/beta
eb_y = y_coor + (c*alpha*(-a*np.cos(time)*alpha-a*np.sin(time)*gamma))/beta - (-a*np.sin(time)*alpha)*c*gamma/beta
eb_z = z_coor + (-a*np.sin(time)*alpha)*(-b*np.sin(time)*alpha+b*np.cos(time)*gamma)/beta - (b*np.cos(time)*alpha)*(-a*np.cos(time)*alpha-a*np.sin(time)*gamma)/beta

# Check e_t magnitude. Making sure it has a magnitude of 1 (becuase it's a unit vector!)
TT = np.sqrt((et_x-x_coor)**2 + (et_y-y_coor)**2 + (et_z-z_coor)**2)

# Check en magnitude. Making sure it has a magnitude of 1 (becuase it's a unit vector!)
NN = np.sqrt((en_x-x_coor)**2 + (en_y-y_coor)**2 + (en_z-z_coor)**2)

###############################################################################
####                              Animation                                ####

Linewidth = 3

fig = plt.figure()
ax1 = fig.add_subplot(1, 1, 1,projection="3d")

lines = []
for ii in range(len(time)):
    ax1.cla()

    Helix_main,  = ax1.plot(x_coor, y_coor, z_coor, color='black', linewidth=Linewidth)
    Helix_trace,  = ax1.plot(x_coor[:ii], y_coor[:ii], z_coor[:ii], color='magenta', linewidth=Linewidth)
    Point, = ax1.plot([x_coor[ii]], [y_coor[ii]], [z_coor[ii]], color='pink', marker='o', markeredgecolor='r')
  
    et_line, = ax1.plot([x_coor[ii],et_x[ii]], [y_coor[ii],et_y[ii]], [z_coor[ii],et_z[ii]], linewidth=Linewidth)
    en_line, = ax1.plot([x_coor[ii],en_x[ii]], [y_coor[ii],en_y[ii]], [z_coor[ii],en_z[ii]], linewidth=Linewidth)
    eb_line, = ax1.plot([x_coor[ii],eb_x[ii]], [y_coor[ii],eb_y[ii]], [z_coor[ii],eb_z[ii]], linewidth=Linewidth)
    
    set_axes_equal(ax1)
    
    et_label = ax1.text(et_x[ii],et_y[ii],et_z[ii],"et")
    en_label = ax1.text(en_x[ii],en_y[ii],en_z[ii],"en")
    eb_label = ax1.text(eb_x[ii],eb_y[ii],eb_z[ii],"eb")
    
    ax1.set_xlabel('x')
    ax1.set_ylabel('y')
    ax1.set_zlabel('z')

    lines.append([Helix_main, Helix_trace, Point, et_line, en_line, eb_line, et_label, en_label, eb_label])

plt.tight_layout()
ani = animation.ArtistAnimation(fig, lines, interval=dt, blit=True)

###############################################################################

print("\nDone...\n")

