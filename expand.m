function retImg = expand(gaussianImg, actualImg)
    [rows,columns,d] = size(gaussianImg);
    len = size(size(gaussianImg));
    if(len(2) == 3)
        for r  = 1:rows
            for c = 1:columns
                newImg(r*2-1, c*2-1, :) = gaussianImg(r,c, :);
                if c ~= columns
                    newImg(r*2-1, c*2, :) = uint8((double(gaussianImg(r,c, :)) + double(gaussianImg(r,c+1, :)))/2);
                else
                    newImg(r*2-1, c*2, :) = gaussianImg(r,c, :);
                end
                
                if r ~= rows
                    newImg(r*2, c*2-1, :) = uint8((double(gaussianImg(r,c, :)) + double(gaussianImg(r+1,c, :)))/2);
                else
                    newImg(r*2, c*2-1, :) = gaussianImg(r,c, :);
                end
                
                if r ~= rows && c ~= columns
                    newImg(r*2, c*2, :) = uint8((double(gaussianImg(r,c, :)) + double(gaussianImg(r+1,c+1, :)))/2);
                else
                    newImg(r*2, c*2, :) = gaussianImg(r,c, :);
                end
            end
        end
        len = size(actualImg);
        retImg = (actualImg(1:(len(1)), 1:(len(2)), :) - newImg(1:(len(1)), 1:(len(2)), :));  
        
    else
        for r  = 1:rows
            for c = 1:columns
                newImg(r*2-1, c*2-1) = gaussianImg(r,c);
                if c ~= columns
                    newImg(r*2-1, c*2) = uint8((double(gaussianImg(r,c)) + double(gaussianImg(r,c+1)))/2);
                else
                    newImg(r*2-1, c*2) = gaussianImg(r,c);
                end
                
                if r ~= rows
                    newImg(r*2, c*2-1) = uint8((double(gaussianImg(r,c)) + double(gaussianImg(r+1,c)))/2);
                else
                    newImg(r*2, c*2-1) = gaussianImg(r,c);
                end
                
                if r ~= rows && c ~= columns
                    newImg(r*2, c*2) = uint8((double(gaussianImg(r,c)) + double(gaussianImg(r+1,c+1)))/2);
                else
                    newImg(r*2, c*2) = gaussianImg(r,c);
                end
                
            end
        end
        len = size(actualImg);
        retImg = actualImg(1:(len(1)), 1:(len(2))) - newImg(1:(len(1)), 1:(len(2)));  
    end
end