function [points] = HarmonographV2func(p)

% Parameter Extraction
amplitudes = p.amplitudes;
frequencies = p.frequencies;
phases = p.phases;
decays = p.decays;
time_limit = p.time_limit;


% Time vector
t = linspace(0, time_limit, time_limit*1000); % Adjust the range and number of points as needed

% Calculate Pendulum Motion with Exponential Decay
x = zeros(size(t));
y = zeros(size(t));

num_pendulums = size(amplitudes, 1);

for i = 1:num_pendulums
    for j = 1:size(amplitudes, 2)
        amp = amplitudes(i, j) * exp(-decays(i, j) * t);
        x = x + amp .* cos(2*pi*frequencies(i, j)*t + phases(i, j));
        y = y + amp .* cos(2*pi*frequencies(i, j)*t + phases(i, j) + pi/2);
    end
end

points(1,:) = x;
points(2,:) = y;

end

