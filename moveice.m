function d = moveice(t,s)

u = 500;                    % Torque applied       -       N*m
Kb = 1000;                  % Friction coefficient -       Kg·m^2/(s·rad)
J = 100;                    % Disk Mass inertia    -       Kg·m^2
m = 1;                      % Mass of the ice      -       Kg
rad = linspace(1, 500, 100; % Radius of the disk   -       m
h = 0.5;                    % height of the disk   -       m
rho = 2700;                 % Density of disk      -       Kg/m^3
mass = rho*pi*rad^2*h;      % mass of the disk     -        Kg
J = 0.5*mass*rad^2;         % Disk Mass inertia    -       Kg·m^2

d1 = s(3);
d2 = s(4);
d3 = s(1)*s(4)^2;
d4 = (u-(Kb+2*m*s(1)*s(3))*s(4))/(m*s(1)^2+J);
d = [d1;d2;d3;d4];
end