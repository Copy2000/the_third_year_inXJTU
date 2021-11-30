%% name
clear;clc;close all
usernum = 5;
numbernum = 5;
repnum = 4;
windowType = "hamming";     %窗口类型 rectangle(boxcar) hanning hamming
datapath = "../data/MFCC_feature/MFCC_processed_name/";
feature_all = cell(usernum*numbernum*repnum, 1);
label_all = [];
ind = 1;
for i = 1:usernum
    i
    for j = 1:numbernum
        for k = 1:repnum
            datafile = datapath+"MFCC_Processed_"+windowType+string(i)+"_"+string(j)+"_"+string(k)+"_1.txt"
            feature = load(datafile);
            feature_all{ind} = feature;
            label_all = [label_all;j];
            ind = ind+1;
        end       
    end
end

dis_mat = zeros(length(feature_all), length(feature_all));
for i = 1:length(feature_all)
    for j = 1:length(feature_all)
        dis_mat(i,j) = dtw(feature_all{i}', feature_all{j}');
    end
end

save distance_name_all_mat.txt -ascii dis_mat
save label_name_all_mat.txt -ascii label_all
%% number
% clear;clc;close all
% usernum = 10;
% numbernum = 10;
% repnum = 2;
% windowType = "hanning";  %窗口类型 rectangle(boxcar) hanning hamming
% datapath = "../data/MFCC_feature/MFCC_num/";
% feature_all = cell(usernum*numbernum*repnum, 1);
% label_all = [];
% ind = 1;
% for i = 1:usernum
%     i
%     for j = 0:numbernum-1
%         for k = 1:repnum
%             datafile = datapath+"MFCC_"+windowType+string(i)+"_"+string(j)+"_"+string(k)+"_0.txt";
%             feature = load(datafile);
%             feature_all{ind} = feature;
%             label_all = [label_all;j];
%             ind = ind+1;
%         end       
%     end
% end
% 
% dis_mat = zeros(length(feature_all), length(feature_all));
% for i = 1:length(feature_all)
%     for j = 1:length(feature_all)
%         dis_mat(i,j) = dtw(feature_all{i}', feature_all{j}');
%     end
% end
% 
% save distance_num_all_mat.txt -ascii dis_mat
% save label_num_all_mat.txt -ascii label_all