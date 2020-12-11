function newpic = encode(EncImg,msg,key)
global msgmat
num2add = 1000-length(msg);
if num2add < 0, error('This message is too long to encode.'), end
newmsg = [msg,repmat(' ',1,num2add)]; 
msgmat = dec2bin(newmsg)-48;
pic1 = EncImg;
B = pic1(:,:,1);   [piclngth pichght] = size(B);  
dim1 = piclngth-2;   dim2 = pichght-3;   keyb = key(end:-1:1);
rows = cumsum(double(key));   
columns = cumsum(double(keyb)); 
A = zeros(dim1,dim2); 
A = crtmtrx(A,rows,columns,dim1,dim2,key);
idx = find(A==1); 
for vv = 1:1000 
    for uu = 1:7
        if msgmat(vv,uu)==1;
           if rem(B(idx(uu+7*(vv-1))),2)==0
              B(idx(uu+7*(vv-1))) = B(idx(uu+7*(vv-1)))+1;
           end
        elseif rem(B(idx(uu+7*(vv-1))),2)==1
              B(idx(uu+7*(vv-1))) = B(idx(uu+7*(vv-1)))-1;
        end
    end
end
newpic = pic1;   newpic(:,:,1) = B;
