function animate_3D_attitude_gif(t, Q)
figure;
axis equal;
axis([-1 1 -1 1 -1 1]*1.5);
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;
view(3);

v = 0.5 * [-1 -1 -1; 1 -1 -1; 1 1 -1; -1 1 -1;
           -1 -1  1; 1 -1  1; 1 1  1; -1 1  1]';
faces = [1 2 3 4; 5 6 7 8; 1 2 6 5;
         2 3 7 6; 3 4 8 7; 4 1 5 8];

filename = 'CubeSat.gif';
for i = 1:20:length(t)
    q = Q(i,:)';
    R = quat2dcm(q');
    v_rot = R * v;
    cla;
    patch('Vertices', v_rot', 'Faces', faces, ...
          'FaceColor', [0.3 0.6 1], 'FaceAlpha', 0.8);
    title(sprintf('Time: %.1f sec', t(i)));
    drawnow;

    frame = getframe(gcf);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);
    if i == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.05);
    end
end
end
