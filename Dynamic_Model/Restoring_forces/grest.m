function Gn = grest(eta,ROV,ENV)

rb_g = [ROV.x_g;ROV.y_g;ROV.z_g];
rb_b = [ROV.x_b;ROV.y_b;ROV.z_b];

% Weight
W=ROV.m*ENV.g;
% Buoyancy
B=ENV.rho*ENV.g*ROV.Volume;
 % Vector i worldframe der beskriver retningen på tyngdekraften og
 % opdriften
 Fg_w=[0;0;W];
 Fb_w=-[0;0;B];
%Beskriver Tyngdekraften og Opdriften i bodyframe
Gn=-[Rotb_n(eta.phi,eta.theta,eta.psi)*Fg_w+Rotb_n(eta.phi,eta.theta,eta.psi)*Fb_w;
  cross(rb_g,Rotb_n(eta.phi,eta.theta,eta.psi)*Fg_w)+cross(rb_b,Rotb_n(eta.phi,eta.theta,eta.psi)*Fb_w)];
end