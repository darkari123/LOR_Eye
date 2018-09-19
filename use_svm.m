% Load variables
% if ~exist('aca', 'var') || ~exist('Y', 'var')
%     clear
%     load XeyeDouble
%     load Y
% end

% Use an SVM
% load test_train
% tic
% % svm_model = fitcsvm(aca, Y);
% svm_model = fitcsvm(reduced_train_set, train_truth);
% toc
% tic
% [label, score] = predict(svm_model, reduced_test_set);
% toc

% Use liblinear
% test_idx = randsample(length(Y), 3250); % Testing / cross-validation indices
% test_set = aca(test_idx, :);
% aca(test_idx, :) = [];
% train_set = aca;
reduced_train_set = sparse(reduced_train_set);
tic
model = train(train_truth, reduced_train_set);
toc
reduced_test_set = sparse(reduced_test_set);
tic
label = predict(test_truth, reduced_test_set, model);
toc
match = (label == test_truth);
accuracy = 100 * sum(match) / length(match)

% test_truth = Y(test_idx, :);
% Y(test_idx, :) = [];
% train_truth = Y;

% save('test_train.mat', 'test_idx', 'test_set', 'test_truth', 'train_set', 'train_truth', '-v7.3');