%% query

TOP_OUTPUT = 5;
query_sum=1;
%load('./data/global/BOW_sift_count.mat');
load('./data/global/ppmi_hid.mat');
load('./labels/new_image_names.mat');
% [words, freq] = explicit_loaddict('data/dict.txt');
words = new_image_names;
hidfeature=PPMI;
%hidfeature=BOW_count;
%cos_value(hidfeature, words,query_sum, TOP_OUTPUT);
%cos_A_B_C(hidfeature,words,TOP_OUTPUT);
%cos_arithmetic(hidfeature, words, TOP_OUTPUT);
cos_arithmetic_multi(hidfeature, words, TOP_OUTPUT);