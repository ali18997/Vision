function retImg = reduce(img)
    len = size(size(img));
    img2 = double(imgaussfilt(img));
    if(len(2) == 3)
        retImg = uint8((img2(1:2:end, 1:2:end, :) + img2(1:2:end, 2:2:end, :) + img2(2:2:end, 1:2:end, :) + img2(2:2:end, 2:2:end, :))./4);
    else
        retImg = uint8((img2(1:2:end, 1:2:end) + img2(1:2:end, 2:2:end) + img2(2:2:end, 1:2:end) + img2(2:2:end, 2:2:end))./4);
    end
end