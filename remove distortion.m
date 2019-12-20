z = Get2DPoints('wall3.jpg',4)
X = z(1,:);
Y = z(2,:);
z1 = Get2DPoints('wall3.jpg',4)
img = imread('wall3.jpg');
[r c p] = size(img);

%A = uint8(zeros([rowz colz 3]));
%imwrite(A, 'black.jpg');
%imgBlack = imread('black.jpg');
%B = Get2DPoints('black.jpg',4)
XO = z1(1,:);
YO = z1(2,:);
M=[X(1) Y(1) 1 0 0 0 -XO(1)*X(1) -XO(1)*Y(1) -XO(1);
  X(2) Y(2) 1 0 0 0 -XO(2)*X(2) -XO(2)*Y(2) -XO(2);
  0 0 0 X(2) Y(2) 1 -YO(2)*X(2) -YO(2)*Y(2) -YO(2);
 X(3) Y(3) 1 0 0 0 -XO(3)*X(3) -XO(3)*Y(3) -XO(3);
0 0 0 X(3) Y(3) 1 -YO(3)*X(3) -YO(3)*Y(3) -YO(3);
 X(4) Y(4) 1 0 0 0 -XO(4)*X(4) -XO(4)*Y(4) -XO(4);
 0 0 0 X(4) Y(4) 1 -YO(4)*X(4) -YO(4)*Y(4) -YO(4)];

%M=[0 0 0 -X(1) -Y(1) -1 YO(1)*X(1) YO(1)*Y(1) Y(1);
  %X(1) Y(1) 1 0 0 0 -XO(1)*X(1) -XO(1)*Y(1) -XO(1);
  %0 0 0 -X(2) -Y(2) -1 YO(2)*X(2) YO(2)*Y(2) Y(2);
  %X(2) Y(2) 1 0 0 0 -XO(2)*X(2) -XO(2)*Y(2) -XO(2);
 % 0 0 0 -X(3) -Y(3) -1 YO(3)*X(3) YO(3)*Y(3) Y(3);
  %X(3) Y(3) 1 0 0 0 -XO(3)*X(3) -XO(3)*Y(3) -XO(3);
  %0 0 0 -X(4) -Y(4) -1 YO(4)*X(4) YO(4)*Y(4) Y(4);
  %X(4) Y(4) 1 0 0 0 -XO(4)*X(4) -XO(4)*Y(4) -XO(4);];
[U,S,V] = svd(M);
H=V(:,end);
H= [H(1) H(2) H(3);
    H(4) H(5) H(6);
    H(7) H(8) H(9);];


%HI = inv(H);

newimg = uint8(zeros([r c 3]));
for s=1:r
    for t=1:c
        UNI = H*[s; t; 1];
        Xcord = UNI(1)/UNI(3);
        Ycord = UNI(2)/UNI(3);
        Xcord=round(Xcord);
        Ycord=round(Ycord);
       
        if (Xcord>=1 && Ycord>=1 && Xcord<=size(img,1) &&  Ycord<=size(img,2)) 
              newimg(Xcord,Ycord,:)=img(s,t,:);
             
        end
      
    
    end
end
newimg = imresize(newimg, 0.3, 'bilinear');
imshow(newimg)