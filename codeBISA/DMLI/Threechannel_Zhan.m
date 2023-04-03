function [re] = Threechannel_Zhan(img1)

F1 = [0 0; -1 1];
F2 = F1';

[xs, ys, yz] = size(img1);
x=double(img1);
xr=x(:,:,1);
xg=x(:,:,2);
xb=x(:,:,3);

% red channel
Hr1 = conv2(xr, F1, 'valid');
Hr2 = conv2(xr, F2, 'valid');
gr = sqrt(Hr1.^2+Hr2.^2);
[row col]= size(gr);
B = round(min(row, col)/16);
gr_center  = gr(B+1:end-B, B+1:end-B); %used from LPC_SI

% green channel
Hg1 = conv2(xg, F1, 'valid');
Hg2 = conv2(xg, F2, 'valid');
gg = sqrt(Hg1.^2+Hg2.^2);
gg_center  = gg(B+1:end-B, B+1:end-B); %used from LPC_SI

% blue channel
Hb1 = conv2(xb, F1, 'valid');
Hb2 = conv2(xb, F2, 'valid');
gb = sqrt(Hb1.^2+Hb2.^2);
gb_center  = gb(B+1:end-B, B+1:end-B); %used from LPC_SI

MaxGr = max(max(gr_center));
MaxGg = max(max(gg_center));
MaxGb = max(max(gb_center));
Maxa = [MaxGr,MaxGg,MaxGb];
MaxG = max(Maxa);

MinGr = min(min(gr_center));
MinGg = min(min(gg_center));
MinGb = min(min(gb_center));
Minb = [MinGr,MinGg,MinGb];
MinG = min(Minb);
  
MeanGr = mean(mean(gr_center));
MeanGg = mean(mean(gg_center));
MeanGb = mean(mean(gb_center));
Meanc = [MeanGr,MeanGg,MeanGb];
MeanG = mean(Meanc);

CVG = (MaxG-MinG)./MeanG; 

re = MaxG.^0.61.*CVG.^0.39;

end