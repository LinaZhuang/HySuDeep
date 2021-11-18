function [EZ_est,S_est,Rw] =  HySuDeep(img_noisy,k_subspace,pa,per_mixed_noise,denoiser_single_band)
%Input:
% img_noisy          noisy 3D data of size row*column*band
% pa                 pa is corresponding to regularization parameter lambda_2 in our objective funcion, which need to be tuned carefully.
%  pa=sqrt(chi2inv(0.99,band) ), when noise is Gaussian N(0,1) with std 1.
% per_mixed_noise    the percentage of elements corrupted by impulse noise and stripes (default value is 5%)


% Output:
% EZ_est denoised 3D image
% S_est  3D image with outlier component

% ---------------------------- -------------------------------------------
% See more details in papers:
%   [1] Lina Zhuang, Michael K. Ng, and Xiyou Fu, “Hyperspectral Image Mixed
%   Noise Removal Using Subspace Representation and Deep CNN Image Prior”,
%   Remote Sensing, 2021, DOI: 10.3390/rs13204098.
%
%
%% -------------------------------------------------------------------------
%
% Copyright (Nov. 2021):
%             Xiyou Fu (fuxiyou@qq.com)
%
%
% HySuDeep is distributed under the terms of
% the GNU General Public License 2.0.
%
% Permission to use, copy, modify, and distribute this software for
% any purpose without fee is hereby granted, provided that this entire
% notice is included in all copies of any software which is or includes
% a copy or modification of this software and in all copies of the
% supporting documentation for such software.
% This software is being provided "as is", without any express or
% implied warranty.  In particular, the authors do not make any
% representation or warranty of any kind concerning the merchantability
% of this software or its fitness for any particular purpose."
% ---------------------------------------------------------------------



[EZ_est,S_est,Rw] =  HySuDeep_core(img_noisy,k_subspace,pa,per_mixed_noise,denoiser_single_band);
 
 