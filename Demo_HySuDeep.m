%% Name: Demo_HySuDeep
%
%  Generate the denoising results of HySuDeep reported the paper:
%
%   [1] Lina Zhuang, Michael K. Ng, and Xiyou Fu, “Hyperspectral Image Mixed
%   Noise Removal Using Subspace Representation and Deep CNN Image Prior”,
%   Remote Sensing, 2021, DOI: 10.3390/rs13204098.
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IMPORTANT NOTE:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%      This script uses the package BM3D  (v2 (30 January 2014))
%      to implement the denoising algorithm BM3D introduced in
%
%      K. Dabov, A. Foi, V. Katkovnik, and K. Egiazarian, "Image denoising by
%      sparse 3D transform-domain collaborative filtering," IEEE Trans.
%      Image Process., vol. 16, no. 8, pp. 2080-2095, August 2007.
%
%      The BM3D package  is available at the
%      BM3D web page:  http://www.cs.tut.fi/~foi/GCF-BM3D
%
%      Download this package and install it is the folder /BM3D
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author: Xiyou Fu (fuxiyou@qq.com)
%         Nov. 2021
%%


clear;clc;close all;
 

 
    dataset ='Pavia'; %dataset ='DC';
    
    % non i.i.d. Guassian noise + stripes + salt&pepper noise
            k_subspace = 8;
            k = 233;
            stripes = 1;
            impulse = 1;
            stripe_band_num = 30; % the number of band to add stripes. DC -> 60       Pavia -> 30
            impluse_ratio = 0.005;
            noise_simulation_Gaussian;   % use the script to simulate the synthetic noise

    %compute the quantitive assement indexes of the noisy HSI
    num = 1;
    disp('*********************** noisy ************************');
    [MPSNR(num),PSNRV(:,num),MSSIM(num),SSIMV(:,num),MFSIM(num),FSIMV(:,num) ] = QuanAsse_psnr_ssim_fsim(img_clean,img_noisy);

%------------------ run HySuDeep ----------------------------------
    num = 8;
  %  k_subspace = 8;
    sz = size(img_clean);
    iid = 0;
    pa= 3;
    p =5;
    denoiser_single_band = 'BM3D'; % If the neural network FFDNet has not been installed in your system, please use 'BM3D'.
   % denoiser_single_band = 'FFDNet'; %To use a deep CNN image prior
    per_mixed_noise = 0.1;  % the percentage of elements corrupted by impulse noise and stripes (default value is 5%)
    t1=tic;
     
    [EZ_est,S_est, Rw_save]=  HySuDeep(img_noisy,k_subspace,pa,per_mixed_noise,denoiser_single_band);  
    t2=clock;
    runingtime(num) = toc(t1);
    Y_rhyde = EZ_est;
    img_HySuDeep = reshape(EZ_est',sz);
    S_est_img = reshape( sum(S_est.^2), sz(1:2));
    [MPSNR(num),PSNRV(:,num),MSSIM(num),SSIMV(:,num),MFSIM(num),FSIMV(:,num) ] = QuanAsse_psnr_ssim_fsim(img_clean,img_HySuDeep);
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%  show original and reconstructed data   %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
set(gcf,'outerposition',get(0,'screensize'))
idx = 10;
subplot(1,3,1);
tmp = img_clean(:,:,idx);
tmp = sort(tmp(:));
minv = tmp(fix(numel(tmp)*0.02));
maxv =  tmp(fix(numel(tmp)*0.98));
imagesc(img_clean(:,:,idx),[minv,maxv]);
colormap('gray');
title(['Clean ',num2str(idx),'th band']);

subplot(1,3,2);
imagesc(img_noisy(:,:,idx),[minv,maxv]);
colormap('gray');
title(['Noisy band ']);
 
subplot(1,3,3);
imagesc(img_HySuDeep(:,:,idx),[minv,maxv]);
colormap('gray');
title(['Estimated by HySuDeep']);

 




