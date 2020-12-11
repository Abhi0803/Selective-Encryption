function msg = decode(im,key)
pic2 = im;
B = pic2(:,:,1);   [piclngth pichght] = size(B); 
dim1 = piclngth-2;   dim2 = pichght-3;   
keyb = key(end:-1:1);
rows = cumsum(double(key));  
columns = cumsum(double(keyb));
A = zeros(dim1,dim2); 
A = crtmtrx(A,rows,columns,dim1,dim2,key);
idx = find(A==1);   msgmat = zeros(1000,6);
for vv = 1:1000  
    for uu = 1:7
        if rem(B(idx(uu+7*(vv-1))),2)==1 
           msgmat(vv,uu) = 1;
        end
    end
end
msg = char(bin2dec(num2str(msgmat)))'; 
