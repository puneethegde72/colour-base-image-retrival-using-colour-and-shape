clc;
clear all;
close all;

disp('Enter the method of classification')

prompt = {'Enter 1 for shape retreival or 2 for color based retreival:'};
dg_title = 'Enter 1 for shape retreival or 2 for color based retreival';
num_lines= 1;
def = {'1'};

reply  = str2num(cell2mat(inputdlg(prompt,dg_title,num_lines,def)));

switch reply
case 1
    test
case 2
    main
end