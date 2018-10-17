function d = moveice(t,s)
% Author: Enrique Fernandez Martin
% Differential equation that models the ice system
global Tm Kb J m

d1 = s(3);
d2 = s(4);
d3 = s(1)*s(4)^2;
d4 = (Tm-(Kb+2*m*s(1)*s(3))*s(4))/(m*s(1)^2+J);
d = [d1;d2;d3;d4];
end
