function C = Ca(nu,ROV)
v = [nu.u;nu.v;nu.w;nu.p;nu.q;nu.r];
M_a = diag(ROV.AddedMass);
rb_g = [ROV.x_g;ROV.y_g;ROV.z_g];
C = [
    skewMtrx(M_a(1:3,1:3)*v(4:6))                      -skewMtrx(M_a(1:3,1:3)*v(4:6))*skewMtrx(rb_g);
    skewMtrx(rb_g)*skewMtrx(M_a(1:3,1:3)*v(4:6))   -skewMtrx(M_a(4:6,4:6)*v(4:6))
];
end