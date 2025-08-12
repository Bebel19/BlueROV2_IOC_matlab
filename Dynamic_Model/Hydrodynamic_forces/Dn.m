function D = Dn(nu,ROV)
% Nonlinear damping
%
v = [nu.u;nu.v;nu.w;nu.p;nu.q;nu.r];
    D = diag(ROV.NonLinDrag)*diag(abs(v));
end