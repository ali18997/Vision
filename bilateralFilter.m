function retImg = bilateralFilter(inputImg,window,sigma_d,sigma_r)

inputImg = double(inputImg)./255;

x = -window:window;
y = -window:window;
domainKernel = zeros(2*window+1, 2*window+1);
for x1 = 1:2*window+1
    for y1 = 1:2*window+1
        domainKernel(x1, y1) = exp(-(x(x1)^2 + y(y1)^2)/(2*sigma_d^2));
    end
end

len = size(inputImg);
retImg = zeros(len);
for r = 1:len(1)
   for c = 1:len(2)
      
         rowMin = r-window;
         if(rowMin < 1)
             rowMin = 1;
         end
         
         rowMax = r+window;
         if(rowMax > len(1))
             rowMax = len(1);
         end
         
         columnMin = c-window;
         if(columnMin < 1)
             columnMin = 1;
         end
         
         columnMax = c+window;
         if(columnMax > len(2))
             columnMax = len(2);
         end
         
         region = inputImg(rowMin:rowMax,columnMin:columnMax,:);
   
         imgPlane1 = region(:,:,1)-inputImg(r,c,1);
         imgPlane2 = region(:,:,2)-inputImg(r,c,2);
         imgPlane3 = region(:,:,3)-inputImg(r,c,3);
         rangeKernel = exp(-(imgPlane1.^2+imgPlane2.^2+imgPlane3.^2)/(2*sigma_r^2));
      
         bilateral_weight_function = rangeKernel.*domainKernel((rowMin:rowMax)-r+window+1,(columnMin:columnMax)-c+window+1);
         
         retImg(r,c,1) = sum(sum(bilateral_weight_function.*region(:,:,1)))/sum(bilateral_weight_function(:));
         retImg(r,c,2) = sum(sum(bilateral_weight_function.*region(:,:,2)))/sum(bilateral_weight_function(:));
         retImg(r,c,3) = sum(sum(bilateral_weight_function.*region(:,:,3)))/sum(bilateral_weight_function(:));
                
   end
   
end

