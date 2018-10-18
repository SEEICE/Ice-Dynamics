function d = moveice(t,x)
% Differential equation that models the ice system
global xml

d1 = x(3);
d2 = x(4);
d3 = x(1)*x(4)^2;
d4 = (xml.s.syst.torq-(xml.s.syst.fric+2*xml.s.ice.m*x(1)*x(3))*x(4))/(xml.s.ice.m*x(1)^2+xml.s.arm.J);
d = [d1;d2;d3;d4];
end
