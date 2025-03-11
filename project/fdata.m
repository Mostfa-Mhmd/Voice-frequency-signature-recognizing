function y = fdata(x)

persistent Hd;

if isempty(Hd)   
Fs = 44100;
 Fstop1 = 300;
 Fpass1 = 500;
 Fpass2 = 1000;
 Fstop2 = 1200;
   Dstop1 = 0.001;           % First Stopband Attenuation
     Dpass  = 0.057501127785;  % Passband Ripple
   Dstop2 = 0.0001;          % Second Stopband Attenuation
   dens   = 20;              % Density Factor
  
   % Calculate the order from the parameters using FIRPMORD.
 [N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                             0], [Dstop1 Dpass Dstop2]);
   
   % Calculate the coefficients
     b  = firpm(N, Fo, Ao, W, {dens});
      Hd = dsp.FIRFilter( ...
        'Numerator',b);
     % fvtool(b, 1);
      end

y = step(Hd,double(x));