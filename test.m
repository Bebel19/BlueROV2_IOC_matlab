function path = generate_curved_path(Vr, R, x0, y0, z0, total_time, dt)
% Génère une trajectoire circulaire de rayon R

N = floor(total_time/dt);
path = zeros(N,4);
z=z0;
for k = 1:N
    t = (k-1)*dt;
    angle = (Vr/R)*t;
    x = x0 + R * sin(angle);
    y = y0 + R * (1 - cos(angle));
    z = z+dt;
    theta = angle;
    path(k,:) = [x, y, z, theta];
end
end

x0 = 0;
y0 = 0;
z0 = 0;
Vr = 0.72;
R = 0.5;
total_time = 60;
dt = 0.1;

path = generate_curved_path(Vr, R, x0, y0, z0, total_time, dt);

figure;
plot3(path(:,1), path(:,2), path(:,3));
grid on;
axis equal;
xlabel('x (m)');
ylabel('y (m)');
zlabel('z (m)');
title('Trajectoire circulaire en 3D');

