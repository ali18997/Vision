function retImg = combine(lowSize, laplacian)
    [rows,columns,d] = size(lowSize);
    len = size(size(lowSize));
    if(len(2) == 3)
        for r  = 1:rows
            for c = 1:columns
                newImg(r*2-1, c*2-1, :) = lowSize(r,c, :);
                if c ~= columns
                    newImg(r*2-1, c*2, :) = uint8((double(lowSize(r,c, :)) + double(lowSize(r,c+1, :)))/2);
                else
                    newImg(r*2-1, c*2, :) = lowSize(r,c, :);
                end
                
                if r ~= rows
                    newImg(r*2, c*2-1, :) = uint8((double(lowSize(r,c, :)) + double(lowSize(r+1,c, :)))/2);
                else
                    newImg(r*2, c*2-1, :) = lowSize(r,c, :);
                end
                
                if r ~= rows && c ~= columns
                    newImg(r*2, c*2, :) = uint8((double(lowSize(r,c, :)) + double(lowSize(r+1,c+1, :)))/2);
                else
                    newImg(r*2, c*2, :) = lowSize(r,c, :);
                end
            end
        end
        len = size(laplacian);
        retImg = laplacian(1:(len(1)), 1:(len(2)), :) + newImg(1:(len(1)), 1:(len(2)), :);  
    else
        for r  = 1:rows
            for c = 1:columns
                newImg(r*2-1, c*2-1) = lowSize(r,c);
                if c ~= columns
                    newImg(r*2-1, c*2) = uint8((double(lowSize(r,c)) + double(lowSize(r,c+1)))/2);
                else
                    newImg(r*2-1, c*2) = lowSize(r,c);
                end
                
                if r ~= rows
                    newImg(r*2, c*2-1) = uint8((double(lowSize(r,c)) + double(lowSize(r+1,c)))/2);
                else
                    newImg(r*2, c*2-1) = lowSize(r,c);
                end
                
                if r ~= rows && c ~= columns
                    newImg(r*2, c*2) = uint8((double(lowSize(r,c)) + double(lowSize(r+1,c+1)))/2);
                else
                    newImg(r*2, c*2) = lowSize(r,c);
                end
            end
        end
        len = size(laplacian);
        retImg = laplacian(1:(len(1)), 1:(len(2))) + newImg(1:(len(1)), 1:(len(2)));  
    end
end