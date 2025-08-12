function C = Crb(nu,ROV)
v = [nu.u;nu.v;nu.w;nu.p;nu.q;nu.r];
rb_g = [ROV.x_g;ROV.y_g;ROV.z_g];
C = [
    ROV.m*skewMtrx(v(4:6))                      -ROV.m*skewMtrx(v(4:6))*skewMtrx(rb_g);
    ROV.m*skewMtrx(rb_g)*skewMtrx(v(4:6))   -skewMtrx(ROV.I_c*v(4:6))
];
end