ii = 10000;

figure;
plot(t(1:ii),v(1:ii));
xlabel("Time (s)");
ylabel("Amplitude (V)");
title("Voltage vs Time signal");
xlim([0 T]);
ylim([-1 5]);

% max(x)

% figure;
% plot(t,v);
% xlabel("Time (s)");
% ylabel("Amplitude (V)");
% title("Voltage vs Time signal");
% xlim([0 t_end]);
% %ylim([-1 5]);