function d = drivedisk(t,s)
% Author: Enrique Fernandez Martin
% Differential equation that models the acceration of the disk from rest to
% the desired angular velocity
global Tm Kb m r J

d1 = s(2);
d2 = (Tm-Kb*s(2))/(J+m*r^2);
d = [d1;d2];
end
