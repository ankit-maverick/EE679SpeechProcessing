function distance_codebook_utterance = distance(curr_codebook, utterance)

num_frames = size(utterance, 1);

num_representative_vectors = size(curr_codebook, 1);


distance_codebook_utterance = 0;
for m=1:num_frames
    dist_rep = zeros(1, num_representative_vectors);
    for n=1:num_representative_vectors
        diff = curr_codebook(n,:) - utterance(m, :);
        dist_rep(n) = norm(diff);
    end
    min_val = min(dist_rep);
    distance_codebook_utterance = distance_codebook_utterance + min_val;
end

