function obj_propagated = angspecprop(complexobj, numpx, wvl, detectorlength, z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%angular spectrum propagate simulator
%created by Tianyi Yang
%date 040517
%%%%%%%%%%%%edit 053117 %%%%%%%%%%%%%%%%
%output = the complex field using angular spectrum (AS) propagation
%numpx = number of pixels
%detectorlength, wvl and z in same unit


angspec_H = angularspecpropagator(numpx, wvl, detectorlength, z); %transferfunction of angular spectrum
%angspec_H = padarray(angspec_H,[n/2,n/2]);
complexobjFT = fftshift(fftn(fftshift(complexobj)));
obj_propagated = ifftshift(ifftn(ifftshift(angspec_H.*complexobjFT)));

end