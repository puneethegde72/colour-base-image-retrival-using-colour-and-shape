% clc
% clear all
% close all

[query_fname, query_pathname] = uigetfile('*.jpg; *.png; *.bmp', 'Select query image');
%%
query_fullpath = strcat(query_pathname, query_fname);
[pathstr, name, ext] = fileparts(query_fullpath); % fiparts returns char type
queryImage = imread( fullfile( pathstr, strcat(name, ext) ) );

queryImage = imresize(queryImage, [384 256]);
hsvHist = hsvHistogram(queryImage);
queryImageFeature = [ hsvHist str2num(name)];

load dataseflo.mat

L2( 15, queryImageFeature, dataset,2);
