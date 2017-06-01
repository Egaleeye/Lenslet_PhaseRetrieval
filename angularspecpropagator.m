function angspectranf = angularspecpropagator(numpx, wvl, detectorlength, z)
%==================angular spectrum propagator========
%output = angular spectrum transfer function
%numpx = number of pixels
%detectorlength, wvl and z in same unit
%created by TYG on 032317 


cmosgen =  -numpx/2:fix(numpx/2-1); %cmos generator
[X, Y] = meshgrid(-cmosgen,cmosgen);

kx_dir = (wvl.*X/detectorlength); %directional cosine calculation
ky_dir = (wvl.*Y/detectorlength);
f = 1-(kx_dir).^2-(ky_dir).^2;
f(f<0) = 0;
angspectranf = exp(1i*2*pi/wvl*sqrt(f)*z); %angular spectrum transfer function

end