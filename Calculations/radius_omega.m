% Script for determining the radius of the disk and the angular velocity
% Author: Enrique Fernandez Martin

close;clear;clc;

% ------ Constants ------ %
% Disk
rad = 10;                       % Radius of the disk    -       m
h = 2;                          % diameter of the rod   -       m
rho = 2700;                     % Density of disk       -       Kg/m^3
mass = rho*pi*h^2*rad;       	% mass of the disk      -       Kg

% System
w = 4;                          % Initial angular velocity of the disk rad/s    -   rad/s
vtarg = 2333;                   % Target linear velocity of the ice             -   m/s
pos = rad;                      % Auxiliary position                            -   m

% Globals
global Tm Kb m r J
Tm = 10000;                     % Torque applied (input)-       N*m
Kb = 0;                         % Friction coefficient  -       Kg*m^2/(s*rad)
m = 10;                         % Mass of the ice(input)-       Kg
r = 0.5;                        % Position of the ice   -       m
J = 1/3*mass*rad^3;             % Disk Mass inertia     -       Kg* m^2
            
% ------ Equations ------ %
tspan = [0,4];
s10 = [r 0 0 w];
s20 = [0 0];
opts = odeset('MaxStep',0.01);
diff = 1;
sol2 = ode45(@drivedisk,tspan,s20,opts);
while abs(diff) >= 0.1
    rad = pos;
    J = 0.5*mass*rad^2;
sol1 = ode45(@moveice,tspan,s10,opts);
for i=1:length(sol1.y(3,:))
   if  sol1.y(3,i)>=vtarg
       t=i;
       break;
   end
end
pos = sol1.y(1,t);
diff = rad - pos;
end

% ------ Plots ------ %
figure
subplot(2,2,1)
plot(sol1.x, sol1.y(1,:),sol1.x,sol1.y(3,:);
grid on;
hold on;
legend('Position','Velocity')
xlabel('Time [s]')

subplot(2,2,2)
plot(sol1.x,sol1.y(2,:)*180/pi);
grid on;
hold on;
ylabel('theta [deg]');
xlabel('time');

subplot(2,2,3)
plot(sol1.x,sol1.y(3,:));
grid on;
hold on;
ylabel('velocity [m/s]');
xlabel('time');

subplot(2,2,4)
plot(sol1.x,sol1.y(4,:));
grid on;
hold on;
ylabel('omega [rad/s]');
xlabel('time');

figure
plot(sol2.x,sol2.y(2,:))
