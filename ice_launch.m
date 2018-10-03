clear;clc;

% Time span
tspan = [0,60];
r = 0.5;  % Initial position of the ice   -   m
wobj = 5; % Target angular speed          -   rad/s

% Initial conditions
s10 = [0 0];

% ODE solve
opts = odeset('MaxStep',0.1);
sol1 = ode45(@drivedisk,tspan,s10,opts);
% 
% for i=1:length(sol1.y(1,:))
%     if sol1.y(1,i)>=wobj
%         t0 = sol1.x(1,i);
%         theta = sol1.y(1,i);
%         omega = sol1.y(2,i);
%         t = i;
%         break; % Breaks the for when the velocity is reached
%     end
% end
% 
% % Initial conditions
% s20 = [r theta 0 omega];
% tspan = [0,5];
% % ODE solve
% sol2 = ode45(@moveice,tspan,s20,opts);
% 
% time = zeros(1,1);
% for i=1:length(sol2.x)
%    time(1,i) = sol2.x(1,i)+sol1.x(1,t);
% end
% time = horzcat(sol1.x(1,1:t-1),time);
% thet = horzcat(sol1.y(1,1:t-1),sol2.y(2,:));
% ome = horzcat(sol1.y(2,1:t-1),sol2.y(4,:));
% pos = horzcat(r*ones(1,t-1),sol2.y(1,:));
% vel = horzcat(zeros(1,t-1),sol2.y(3,:));
% 
% 
time = sol1.x;
ome = sol1.y(2,:);
% % Plots
figure
% subplot(2,2,1)
% plot(time,pos);
% grid on;
% hold on;
% ylabel('x [m]');
% xlabel('time');
% 
% subplot(2,2,2)
% plot(time, thet*180/pi);
% grid on;
% hold on;
% ylabel('theta [deg]');
% xlabel('time');
% 
% subplot(2,2,3)
% plot(time, vel*180/pi);
% grid on;
% hold on;
% ylabel('velocity [m/s]');
% xlabel('time');
% 
subplot(2,2,4)
plot(time, ome);
grid on;
hold on;
ylabel('omega [rad/s]');
xlabel('time');
