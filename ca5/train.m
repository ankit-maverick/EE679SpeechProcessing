%% Assignment 5 - Digit Recognition

% Ankit Agrawal
% 10D070027


%% Read and Segment the Data
% We have 16 utterances of all the digits 0-9 from 8 users.
% The `data` variable stores all the utterances into 10x16 cell.
% detectVoiced function was used after some tuning of its window
% length parameter to obtain all the proper segments.
clear all
close all
clc

[segments1, fs] = detectVoiced('zero_to_nine_Hitesh1_8k.wav');
[segments2, fs] = detectVoiced('zero_to_nine_Hitesh2_8k.wav');
[segments3, fs] = detectVoiced('zero_to_nine_Mayur1_8k.wav');
[segments4, fs] = detectVoiced('zero_to_nine_Mayur2_8k.wav');
[segments5, fs] = detectVoiced('zero_to_nine_Shrikant1_8k.wav');
[segments6, fs] = detectVoiced('zero_to_nine_Shrikant2_8k.wav');
[segments7, fs] = detectVoiced('zero_to_nine_Vedhas1_8k.wav');
[segments8, fs] = detectVoiced('zero_to_nine_Vedhas2_8k.wav');

data = cell(10, 16);

for i=1:10

   data{i, 1} = segments1{2*(i-1)+1};
   data{i, 2} = segments1{2*(i-1)+2};
   data{i, 3} = segments2{2*(i-1)+1};
   data{i, 4} = segments2{2*(i-1)+2};
   data{i, 5} = segments3{2*(i-1)+1};
   data{i, 6} = segments3{2*(i-1)+2};
   data{i, 7} = segments4{2*(i-1)+1};
   data{i, 8} = segments4{2*(i-1)+2};
   data{i, 9} = segments5{2*(i-1)+1};
   data{i, 10} = segments5{2*(i-1)+2};
   data{i, 11} = segments6{2*(i-1)+1};
   data{i, 12} = segments6{2*(i-1)+2};
   data{i, 13} = segments7{2*(i-1)+1};
   data{i, 14} = segments7{2*(i-1)+2};
   data{i, 15} = segments8{2*(i-1)+1};
   data{i, 16} = segments8{2*(i-1)+2};

end


%% Training : CodeBook Generation using K-means Clustering
% While training, a codebook has to be generated for each digit which will
% contain its representative vectors. The number of clusters initially
% chosen for each digit was equal to the number of phonemes for that digit, but after some
% testing, 3 times the number of phonemes was chosen to take into account
% the beginning, the middle and the end of the phoneme.

% To generate a codebook for a digit, all its utterances are first
% normalized by its intensity and then pre-emphasized.
% We then group the feature vectors(39 MFCCs) for all the frames
% of all the utterances of that digit. The feature vectors are clustered
% using the K-means algorithm in the 39 dimensional feature space with the
% no. of clusters being equal to 3 times the number of phonemes in the
% digit as explained above.


num_phonemes = [4, 3, 2, 3, 3, 4, 3, 4, 3, 3];
num_phonemes = 3*num_phonemes;
fs = 8000;

% Controls the no. of utterances of each digit to be used in training.
train_length = 15;

% Codebook : Note that index of digit i is i+1
codebook = cell(1,10);

for i=1:10
    frame_features=[];
    
    for j=1:train_length
        x = data{i, j};
                
        % Normalize with Energy so as to remove variabitlity in intensity
        x = x/norm(x);
 
        % PreEmphasis
        alpha = -0.96;
        filtercoeffs = [1 alpha];
        x = filter(filtercoeffs, 1, x);

        %wlen = fs*0.03;
        %slide = fs*0.015;
        %sig_len = length(x);
        %num_frames = floor(sig_len/slide) - 1;
        
        frame_features_new = melcepst(x,fs,'e0dD'); 
        
        %for p=1:num_frames
            % PreEmphasis
           % wind_sig = x((num_frames-1)*slide + 1:(num_frames-1)*slide + wlen);
           % alpha = -0.96;
           % filtercoeffs = [1 alpha];
           % wind_sig = filter(filtercoeffs, 1, wind_sig);

            %frame_features = [frame_features; melcepst(wind_sig,fs,'e0dD')];
        %end
        frame_features = [frame_features; frame_features_new];
    end
    
    C = kmeans(frame_features, num_phonemes(i));
    codebook{i} = C;
end


%% Test : Random Insample Utterance
% On random insample utterance, the digit classifier gives 100% accuracy.
for q=1:10
    
    y = data{q, 16};
    %soundsc(y, 8000);
    dist = zeros(1,10);

    % Normalize with Energy
    y = y/norm(y);
    
    % PreEmphasis
    alpha = -0.96;
    filtercoeffs = [1 alpha];
    y = filter(filtercoeffs, 1, y);

    
    test_frames = melcepst(y, fs,'e0dD');

    
    for k=1:10
        % Calls to the distance function I wrote in distance.m to 
        % calculate the distance between a codebook containing
        % representative vectors of a digit and a frame from the test
        % utterance.
        dist_k = distance(codebook{k}, test_frames);
        dist(k) = dist_k;

    end
    
    [min_dist, min_index] = min(dist);
    
    %disp(dist);
    disp('Actual digit : ')
    disp(int2str(q-1))
    disp('Digit Predicted : ');
    disp(int2str(min_index-1));

end

%% Test : Unseen test utterance
% The results on the unseen test utterances of all the digits recorded by
% me give only 20% accuracy, mostly because of my deep and coarse voice. A
% large training data here should come to the rescue to aggregate the
% voices of unknown speakers.
[test_unseen fs] = detectVoiced('Ankit_zero_nine_8k.wav');
disp('Testing Unseen utterance');
for q=1:10
    y = test_unseen{q};
    dist = zeros(1,10);

    % Normalize with Energy
    y = y/norm(y);
    
    % PreEmphasis
    alpha = -0.96;
    filtercoeffs = [1 alpha];
    y = filter(filtercoeffs, 1, y);

    
    test_frames = melcepst(y, fs,'e0dD');

    
    for k=1:10
        % Calls to the distance function I wrote in distance.m to 
        % calculate the distance between a codebook containing
        % representative vectors of a digit and a frame from the test
        % utterance.
        dist_k = distance(codebook{k}, test_frames);
        dist(k) = dist_k;

    end
    
    [min_dist, min_index] = min(dist);
    

    disp('Actual digit : ')
    disp(int2str(q-1))
    disp('Digit Predicted : ');
    disp(int2str(min_index-1));

end