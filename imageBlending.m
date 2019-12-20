clear all

%CONTROLS
%Increase visibility to see edges in laplacian images more clearly
%This is only used for display
laplacian_visibility = 10;

%Use 1 for colored images, 0 for non colored images
color_images = 1;

face = imread('face2.png');
hand = imread('hand.png');
mask = imread('mask.png');

if(color_images ~= 1)
    face = rgb2gray(face);
    hand = rgb2gray(hand);
end

subplot(1,3,1)
imshow(face)
title('Input Image 1')


subplot(1,3,2)
imshow(hand)
title('Input Image 2')


subplot(1,3,3)
imshow(mask)
title('Binary Mask')

mask = imbinarize(mask);
mask = uint8(mask(:,:,1));


mask(mask==255)=1;

face2 = reduce(face);
laplacian_face1 = expand(face2, face);
face3 = reduce(face2);
laplacian_face2 = expand(face3, face2);
face4 = reduce(face3);
laplacian_face3 = expand(face4, face3);
laplacian_face4 = face4;

figure
subplot(4,3,1)
imshow(face2)
title('Low Level Gaussian - Image 1')

subplot(4,3,2)
imshow(face3)
title('Medium Level Gaussian - Image 1')

subplot(4,3,3)
imshow(face4)
title('High Level Gaussian - Image 1')

subplot(4,3,4)
imshow(laplacian_face1.*laplacian_visibility)
title('Low Level Laplacian - Image 1')

subplot(4,3,5)
imshow(laplacian_face2.*laplacian_visibility)
title('Medium Level Laplacian - Image 1')

subplot(4,3,6)
imshow(laplacian_face3.*laplacian_visibility)
title('High Level Laplacian - Image 1')


hand2 = reduce(hand);
laplacian_hand1 = expand(hand2, hand);
hand3 = reduce(hand2);
laplacian_hand2 = expand(hand3, hand2);
hand4 = reduce(hand3);
laplacian_hand3 = expand(hand4, hand3);
laplacian_hand4 = hand4;

subplot(4,3,7)
imshow(hand2)
title('Low Level Gaussian - Image 2')

subplot(4,3,8)
imshow(hand3)
title('Medium Level Gaussian - Image 2')

subplot(4,3,9)
imshow(hand4)
title('High Level Gaussian - Image 2')


subplot(4,3,10)
imshow(laplacian_hand1.*laplacian_visibility)
title('Low Level Laplacian - Image 2')

subplot(4,3,11)
imshow(laplacian_hand2.*laplacian_visibility)
title('Medium Level Laplacian - Image 2')

subplot(4,3,12)
imshow(laplacian_hand3.*laplacian_visibility)
title('High Level Laplacian - Image 2')

mask2 = reduce(mask);
mask3 = reduce(mask2);
mask4 = reduce(mask3);

blend1 = blend(laplacian_face1, laplacian_hand1, mask);
blend2 = blend(laplacian_face2, laplacian_hand2, mask2);
blend3 = blend(laplacian_face3, laplacian_hand3, mask3);
blend4 = blend(laplacian_face4, laplacian_hand4, mask4);

comb3 = combine(blend4, blend3);
comb2 = combine(comb3, blend2);
comb1 = combine(comb2, blend1);

figure
imshow(comb1)
title('Blended Image')

