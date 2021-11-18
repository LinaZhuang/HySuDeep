%%  The code and data herein distributed reproduce the results published in
%  the paper 
%
%  Lina Zhuang, Michael K. Ng, and Xiyou Fu, “Hyperspectral Image Mixed
%   Noise Removal Using Subspace Representation and Deep CNN Image Prior”,
%   Remote Sensing, 2021, DOI: 10.3390/rs13204098.
% 
%
% 
% 
%% Description:
% 
% Demo_HySuDeep.m                                       ---- main script reproducing the denoising results published in the paper
% HySuDeep.m                                                  ---- denoising algorithm HySuDeep
% img_clean_dc.mat & img_clean_pavia.mat     ---- Simulated clean datasets
% 
% 
% 
%%  Notes:
%
%   1) Package instalation: unzip the files to a directory and run the
%   scripts of "Demo_HySuDeep.m", which reproduces the denoising results
%   reported in the above paper.
%
%
%   2) HySuDeep.m is the core funtion. It is a state-of-the-art denoiser
%       designed for hyperspectral images corrupted with mixed noise.
%      
%  
%   
%% ACKNOWLEDGMENTS
%
% The authors acknowledge the following individuals and organisations:
%
%
%   - Prof. Paolo Gamba from Pavia university, 
%     for making the Pavia University data set available to the community.
%
%   - Prof. David Landgrebe and Larry Biehl from Purdue University, 
%     for making the Washington DC Mall data set available to the community.
%
%   - Authors of BM3D (K. Dabov, A. Foi, V. Katkovnik, and K. Egiazarian) from
%      Sandia National Laboratories, for making the BM3D package available to the community.
%  
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author: Xiyou Fu, Nov. 2021
%
