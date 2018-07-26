% Run this after running main.m and train.m
% same as training but in test mode. Finds out
clear all;close all;clc;
load traindata.mat
load CX.mat
Q=[];

[fn pn]=uigetfile('*.jpg;*.bmp;','Selct the input Test image');
im=imread([pn fn]);
figure(1),imshow(im),title('Query image')
im=rgb2gray(im);
sigma=4;
        thresh=3000;
        radius=3;
        disp=0;
        [cim, r, c] = harris(im, sigma, thresh, radius, disp);
        sift_radius=6;
        circles=zeros([size(c,1),3]);
        circles(:,1)=c;
        circles(:,2)=r;
        circles(:,3)=sift_radius*ones([size(c,1),1]);
        sift_arr = find_sift(im, circles, 1.5);
        n2 = dist2(CX,sift_arr);
        [H,I]=min(n2);
        mx=1:1:500;
        n=hist(I,mx);
        n=n./sum(n);
        Q=[Q;n];% Same as in training
%     end
% end
IDx=knnsearch(Q,traindata,10)% Find out 4 nearest neighbours

for lp=1:numel(IDx)
    if IDx(lp) <= 200
        str='.\Database\motorbikes_train';
        if(IDx(lp)/10<1)
        f='00'; 
    elseif(IDx(lp)/10<10)
            f='0';
    else
        f=[];
    end
    elseif IDx(lp) >200 && IDx(lp) <= 400
            IDx(lp)=IDx(lp)-200;
            if(IDx(lp)/10<1)
        f='00'; 
    elseif(IDx(lp)/10<10)
            f='0';
    else
        f=[];
    end
            str='.\Database\faces_train';
         elseif IDx(lp) >400 && IDx(lp) <= 600
             IDx(lp)=IDx(lp)-400;
             if(IDx(lp)/10<1)
        f='00'; 
    elseif(IDx(lp)/10<10)
            f='0';
    else
        f=[];
    end
            str='.\Database\cars_train';
        elseif IDx(lp) >600 && IDx(lp) <= 800
            IDx(lp)=IDx(lp)-600;
            if(IDx(lp)/10<1)
        f='00'; 
    elseif(IDx(lp)/10<10)
            f='0';
    else
        f=[];
    end
            str='.\Database\airplanes_train';
        end
        str1=strcat(str,'\','img',f,num2str(IDx(lp)),'.jpg');
        figure(2)
        subplot(5,2,lp);
        imo=imread(str1);
        imshow(imo)
end