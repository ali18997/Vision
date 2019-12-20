function retImg = blend(foreground, background, mask)
    len = size(foreground);
    for r = 1:len(1)
        for c = 1:len(2)
            retImg(r,c, :) = mask(r,c)*foreground(r,c,:) + (1-mask(r,c))*background(r,c,:);
        end
    end
end
