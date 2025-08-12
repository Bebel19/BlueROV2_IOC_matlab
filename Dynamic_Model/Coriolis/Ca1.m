function C = Ca(nu,ROV)
% Coriolis hydrodynamic effects
% The hydrodynamic effects matrix combines moments and forces due to velocities and rotations of the ROV.

u = nu.u;
v = nu.v;
w = nu.w;
p = nu.p;
q = nu.q;
r = nu.r;

m = ROV.m;
Xdu = ROV.AddedMass(1);
Ydv = ROV.AddedMass(2);
Zdw = ROV.AddedMass(3);
Kdp = ROV.AddedMass(4);
Mdq = ROV.AddedMass(5);
Ndr = ROV.AddedMass(6);

C = [
    0 0 0 0 -Zdw*w Ydv*v;
    0 0 0 Zdw*w 0 -Xdu*u;
    0 0 0 -Ydv*v Xdu*u 0;
    0 -Zdw*w Ydv*v 0 -Ndr*r Mdq*q;
    Zdw*w 0 -Xdu*u Ndr*r 0 -Kdp*p;
    -Ydv*v Xdu*u 0 -Mdq*q Kdp*p 0;
    ];

end