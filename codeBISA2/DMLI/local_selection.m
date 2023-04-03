function [blur] = local_selection(img,Line,Col,N1,N2,step1)
imgpart = img((Line-1)*step1+1:N1+(Line-1)*step1,(Col-1)*step1+1:N2+(Col-1)*step1,:);
blur = Threechannel_Zhan(imgpart);