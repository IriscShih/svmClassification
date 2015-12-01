clear all;
clc;
load('rawData.mat');
data = [];

%Take one person's acceleration data
for i=1:length(RawData)
    if (RawData(i,1)==33)
        data = [data; RawData(i,: )];
    end
end

sample_tr_set=data(1:end/2,4:6);
sample_tr_label=data(1:end/2,2);
sample_tt_set=data(end/2 + 1:end,4:6);
sample_tt_label=data(end/2 + 1:end,2);

model = svmtrain(sample_tr_set,sample_tr_label,'kernel_function','rbf');
calcu = svmclassify(model,sample_tt_set);

missclassifications = sum(abs(calcu-sample_tt_label))/length(sample_tt_label)





