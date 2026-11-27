% 4-DOF robotic arm: standard DH reference calculation
% Based on the DH table and two published matrices in the original PDFs.
% All angles in radians, distances in metres.
% The fifth row is a fixed tool-frame transform for the second example.
clear; clc;
a = [0 0.249 0.141 0];
alpha = [pi/2 0 0 pi/2];
d = [0 0 0 0];
q = [0 pi/4 -pi/4 pi/3];
T = eye(4);
origins = zeros(3,6);
for i = 1:4
    T = T * dh_standard(q(i),d(i),a(i),alpha(i));
    origins(:,i+1) = T(1:3,4);
end
T04 = T;
T05 = T04 * dh_standard(pi/2,0.098,0,0);
origins(:,6) = T05(1:3,4);

% Rounded reference matrices read from the original MATLAB screenshots.
ref04 = [0.5000 0 0.8660 0.3171; 0 -1 0 0; ...
         0.8660 0 -0.5000 0.1761; 0 0 0 1];
ref05 = [0 -0.5000 0.8660 0.4019; -1 0 0 0; ...
         0 -0.8660 -0.5000 0.1271; 0 0 0 1];
assert(max(abs(T04(:)-ref04(:))) < 5.1e-5,'Frame 4 mismatch');
assert(max(abs(T05(:)-ref05(:))) < 5.1e-5,'Frame 5 mismatch');
for R = {T04(1:3,1:3),T05(1:3,1:3)}
    assert(norm(R{1}'*R{1}-eye(3),'fro')<1e-12);
    assert(abs(det(R{1})-1)<1e-12);
end
assert(abs(norm(T05(1:3,4)-T04(1:3,4))-0.098)<1e-12);
disp('Frame 4 transform:'); disp(T04);
disp('Extended frame 5 transform:'); disp(T05);
fprintf('Frame 4 position (mm): %.3f %.3f %.3f\n',1000*T04(1:3,4));
fprintf('Frame 5 position (mm): %.3f %.3f %.3f\n',1000*T05(1:3,4));
disp('All reference assertions passed.');

figure('Name','DH frame origins (reference model)');
plot3(origins(1,1:5),origins(2,1:5),origins(3,1:5),'o-','LineWidth',2);
hold on;
plot3(origins(1,5:6),origins(2,5:6),origins(3,5:6),'s--','LineWidth',2);
grid on; axis equal; xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
legend('Four-joint model','Fixed tool extension','Location','best');
title('Frame origins from standard DH transformations');
view(3);

function A = dh_standard(theta,d,a,alpha)
    c = cos(theta); s = sin(theta);
    ca = cos(alpha); sa = sin(alpha);
    A = [c -s*ca s*sa a*c; s c*ca -c*sa a*s; ...
         0 sa ca d; 0 0 0 1];
end
