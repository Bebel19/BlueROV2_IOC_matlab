function R = Rotb_n(phi,theta,psi)
R = [
    cos(psi)*cos(theta)                                 cos(theta)*sin(psi)                                 -sin(theta);
    cos(psi)*sin(phi)*sin(theta) - cos(phi)*sin(psi)    cos(phi)*cos(psi) + sin(phi)*sin(psi)*sin(theta)    cos(theta)*sin(phi);
    sin(phi)*sin(psi) + cos(phi)*cos(psi)*sin(theta)    cos(phi)*sin(psi)*sin(theta) - cos(psi)*sin(phi)    cos(phi)*cos(theta)
    ];
end