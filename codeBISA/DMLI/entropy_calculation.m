function  [LineF,ColF] = entropy_calculation(LineNum, ColNum, img, N1, N2, step1)
E1 = 0;E = 0;EV = 0;LineF=0;ColF=0;
F1 = [0 0; -1 1];F2 = F1';
img1=double(img);
MaxG = zeros(LineNum, ColNum);
for i = 1 : LineNum
    for j = 1 : ColNum
        imgpart = img1((i-1)*step1+1:N1+(i-1)*step1,(j-1)*step1+1:N2+(j-1)*step1);
        H1 = conv2(imgpart, F1, 'valid');
        H2 = conv2(imgpart, F2, 'valid');
        g = sqrt(H1.^2+H2.^2);  
        [row, col]= size(g);
        B = round(min(row, col)/16);
        g_center  = g(B+1:end-B, B+1:end-B); %used from LPC_SI;
        MaxG(i,j) = max(max(g_center));
    end
end
E1 = max(max(MaxG));
[Line,Col] = find(MaxG == E1);
[LM,LN] = size(Line);
[CM,CN] = size(Col);
for i = 1:LM
    LineK = Line(i);ColK = Col(i);
    imgpart1 = img((LineK-1)*step1+1:N1+(LineK-1)*step1,(ColK-1)*step1+1:N2+(ColK-1)*step1);
    pE = imhist(imgpart1);
    pE(pE==0) = [];
    pE = pE./ numel(imgpart1);
    E(i) = -sum(pE.*log2(pE)); 
    if E(i) > EV
        EV = E(i);
        LineF = Line(i);
        ColF = Col(i);
    end
end
end