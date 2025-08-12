function C = Crb(nu,ROV)
%Coriolis rigid body
%The rigid-body matrix is a combination of the mass in different body velocities and the inertia in directions due to the rotations of the ROV.

u = nu.u;
v = nu.v;
w = nu.w;
p = nu.p;
q = nu.q;
r = nu.r;

m = ROV.m;
Ix = ROV.MOI(1);
Iy = ROV.MOI(2);
Iz = ROV.MOI(3);

C = [
    0 0 0 0 m*w -m*v;
    0 0 0 -m*w 0 m*u;
    0 0 0 m*v -m*u 0;
    0 m*w -m*v 0 -Iz*r -Iy*q;
    -m*w 0 m*u Iz*r 0 Ix*p;
    m*v -m*u 0 Iy*q -Ix*p 0;
    ];
end