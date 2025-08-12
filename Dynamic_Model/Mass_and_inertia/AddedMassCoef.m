function Out = AddedMassCoef(ROV,ENV,index)
    A=zeros(6,6); % Added mass Matrix
    
    %Empirical 3D data(DNV)————————————————
    EMP3D=[1,0.68;2,0.36;3,0.24;4,0.19;5,0.15;6,0.14;7,0.11];
    CA3D=spline(EMP3D(:,1),EMP3D(:,2));
    %....................................
    %Empirical 2D-data (DNV)
    EMP2D=[10,1.14,0.125;5,1.21,0.15;2,1.36,0.15;1,1.51,0.234;...
        0.5,1.7,0.15;0.2,1.98,0.15;0.1,2.23,0.147];
    CA2DT=spline(EMP2D(:,1),EMP2D(:,2));
    CA2DR=spline(EMP2D(:,1),EMP2D(:,3));
    ....................
        %Coefficients
    H3D=(ROV.L.h+ROV.L.l)/2; % Averaged Height( For 3D-est)
    L3D=H3D; % Averaged Width ( For 3D-est)
    CpXY=ROV.A.T/(ROV.L.l*ROV.L.w); % Projected Area Coefficient XY
    CpYZ=ROV.A.F/(ROV.L.h*ROV.L.w); % Projected Area Coefficient YZ
    CpXZ=ROV.A.S/(ROV.L.l*ROV.L.h); % Projected Area Coefficient XZ
    %.........................................................................
    %Sway Direction
    %3D

    B=ROV.L.w/H3D;
    Ca=ppval(CA3D,(B));
    V=ROV.L.w*H3D^2;
    A(2,2)= Ca*V*ENV.rho*(CpXZ)^2*CpYZ*CpXY;
    %2D————————————
    B=(ROV.L.l/2)/(ROV.L.w/2);
    Ca=ppval(CA2DT,B);
    Ar=pi*((ROV.L.l*0.5)^2);
    A2D=ENV.rho*Ca*Ar*(CpXZ)^2*CpYZ*CpXY;
    At=ROV.L.h*A2D;
    lambda=A(2,2)/At;
    A(2,2)=At*lambda;

    %Surge
    B=ROV.L.w/ROV.L.l;
    Ca=ppval(CA2DT,B);
    Ar=pi*(ROV.L.w*0.5)^2;
    A2D=ENV.rho*Ca*Ar*CpYZ^2*CpXY*CpXZ;
    At=A2D*ROV.L.h;
    A(1,1)=At*lambda;
    %Heave
    A2D=ENV.rho*Ca*Ar*CpXY^2*CpXZ*CpYZ;
    At=A2D*ROV.L.w;
    A(3,3)=At*lambda;
    %Roll
    B=ROV.L.h/ROV.L.w;
    Ca=ppval(CA2DR,B);
    if (B<=1)
        A2D=ENV.rho*Ca*pi*(ROV.L.w*0.5)^4*CpYZ*CpXY*CpXZ;
    else
        A2D=ENV.rho*Ca*pi*(ROV.L.h*0.5)^4*CpYZ*CpXY*CpXZ;
    end
    At=ROV.L.l*A2D;
    A(4,4)=At*lambda;
    %Pitch
    B=ROV.L.l/ROV.L.h;
    Ca=ppval(CA2DR,B);
    if(B>=1)
        A2D=ENV.rho*Ca*pi*(ROV.L.l*0.5)^4*CpYZ*CpXY*CpXZ;
    else
        A2D=ENV.rho*Ca*pi*(ROV.L.h*0.5)^4*CpYZ*CpXY*CpXZ;
    end
    At=ROV.L.w*A2D;
    A(5,5)=At*lambda;
    %Yaw
    %III
    %Appendix A Matlab Scripts
    B=ROV.L.w/ROV.L.l;
    Ca=ppval(CA2DR,B);
    if(B>=1)
        A2D=ENV.rho*Ca*pi*(ROV.L.w*0.5)^4*CpYZ*CpXY*CpXZ;
    else
        A2D=ENV.rho*Ca*pi*(ROV.L.l*0.5)^4*CpYZ*CpXY*CpXZ;
    end
    At=A2D*ROV.L.h;
    A(6,6)=At*lambda;

    M_a=diag(A);
    Out = M_a(index);
end