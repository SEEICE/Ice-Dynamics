function d = drivedisk(t,s)

Tm = 100000;            % Torque applied       -       N*m
Kb = 0;                 % Friction coefficient -       Kg·m^2/(s·rad)
m = 1;                  % Mass of the ice      -       Kg
r = 0.5;                % Position of the ice  -       m
rad = 3;               % Radius of the disk   -       m
h = 0.5;                % height of the disk   -       m
rho = 2700;             % Density of disk      -       Kg/m^3
mass = rho*pi*rad^2*h;  % mass of the disk     -        Kg
J = 0.5*mass*rad^2;     % Disk Mass inertia    -       Kg·m^2


d1 = s(2);
d2 = (Tm-Kb*s(2))/(J+m*r^2);
d = [d1;d2];
end