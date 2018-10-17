% Script for determining the radius of the disk and the angular velocity
clear;clc;
% Constants
w = 5;              % Initial angular velocity of the disk rad/s    -   rad/s
radius = 100;       % Initial radius of the disk                    -   m
vtarg = 2333;       % Target linear velocity of the ice             -   m/s
pos = radius;       % Auxiliary position                            -   m
            


%% Equations
tspan = [0,20];
s10 = [r 0 0 w];
opts = odeset('MaxStep',0.1);
diff = 1;
while abs(diff) >= 0.01
    radius = pos;
function d = drivedisk(t,s)
    Tm = 100000;            % Torque applied                -       N*m
    Kb = 0;                 % Friction coefficient          -       Kg·m^2/(s·rad)
    m = 1;                  % Mass of the ice               -       Kg
    r = 0.5;                % Initial position of the ice   -       m
    rad = radius;           % Radius of the disk            -       m
    h = 0.5;                % height of the disk            -       m
    rho = 2700;             % Density of disk               -       Kg/m^3
    mass = rho*pi*rad^2*h;  % mass of the disk              -       Kg
    J = 0.5*mass*rad^2;     % Disk Mass inertia             -       Kg·m^2

    d1 = s(2);
    d2 = (Tm-Kb*s(2))/(J+m*r^2);
    d = [d1;d2];
end
sol1 = ode45(@drivedisk,tspan,s10,opts);
for i=1:length(sol1.y(3,:))
   if  sol1.y(3,:)>=vtarg
       t=i;
       break;
   end
end
pos = sol1.y(1,t);
diff = radius - pos;
end
