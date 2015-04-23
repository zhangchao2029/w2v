clear;
load('data/global/BOW_sift_count.mat'); % load matrix H, each row of H is a explicit d

H = full(BOW_count);
% H = H(:,1:5000);

[sample_num, context_num] = size(H);
PPMIw = sum(H, 2);
PPMIc = sum(H, 1);

%hfile = fopen('./data/corpuslen.txt', 'r');
%corpus_length = fscanf(hfile, '%d');
% [words, freqs] = explicit_loaddict2('./data/dict.txt');
%fclose(hfile);
corpus_length=80000000;
k = 2;
PPMItemp = H.*corpus_length./(PPMIw*PPMIc);

% PPMItemp = H.*sum(freqs)./(PPMIw*freqs');
PPMI = max(0, log(PPMItemp) - log(k));
% PPMI = log(PPMItemp) - log(k);

%accuracy_all_cos(PPMI);
%accuracy_all_cos(PPMI);
dim = 10;
%changed
[CompressedPPMI Diagonal temp] = svds(PPMI, dim);
CompressedPPMI = CompressedPPMI*sqrt(Diagonal);
save('./data/global/ppmi_hid.mat', 'PPMI', 'CompressedPPMI', '-v7.3');




