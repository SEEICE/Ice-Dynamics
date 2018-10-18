function d = drivearm(t,x)
% Differential equation that models the acceration of the arm from rest to
% the desired angular velocity
global xml

d1 = x(2);
d2 = (xml.s.syst.torq-xml.s.syst.fric*x(2))/(xml.s.arm.J+xml.s.ice.m*xml.s.ice.r0^2);
d = [d1;d2];
end
