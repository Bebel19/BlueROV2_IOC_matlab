function M = Mrb(ROV)
% Ridgid body mass
%

m = ROV.m;

M = [
    m*eye(3,3)  zeros(3,3);
    zeros(3,3)  ROV.I_c
    ];

% rb_g = [ROV.x_g;ROV.y_g;ROV.z_g];
% 
% M = [
%     ROV.m*eye(3,3)          -ROV.m*skewMtrx(rb_g);
%     -ROV.m*skewMtrx(rb_g)   ROV.I_c
% ];
end