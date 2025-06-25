function plot_results_quat(t, q, q_desired)
figure;
labels = {'q_0','q_1','q_2','q_3'};
for i = 1:4
    subplot(4,1,i);
    plot(t, q(:,i)); hold on; yline(q_desired(i), '--r');
    ylabel(labels{i});
    if i==1, title('Quaternion Components'); end
end
xlabel('Time (s)');
end
