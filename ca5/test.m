[y fs] = wavread('test.wav');

dist = zeros(1,10);

% PreEmphasis
alpha = -0.96
filtercoeffs = [1 alpha];
y = filter(filtercoeffs, 1, y);
        
% Normalize with Energy
y = y/norm(y);


for k=1:10
    dist(k) = distance(codebook{k}, melcepst(y,Fs,'e0dD'));
end

[min_dist, min_index] = min(dist);

disp('Digit Predicted : ')
disp(int2str(min_index-1))
