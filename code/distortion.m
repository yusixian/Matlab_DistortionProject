% 人脸扭曲函数
function [ output_img ] = distortion(input_img)
    % input_img为输入图像，output_img为输出图像,angle为顺时针旋转角度
    [I,map] = imread(input_img);
    input_img = imread(input_img);
    % 获取原图像的长宽
    [width,height,dimension] = size(I);
    for i = 1:width
        for j = 1:height
            % 中心归一化坐标
            tempx = (i-0.5*width) / (0.5*width);
            tempy = (j-0.5*height) / (0.5*height);
            % 获取r和angle
            r  = sqrt(tempx^2 + tempy^2);
            angle = (1-r)^2;
            if r >= 1
                x = tempx;
                y = tempy;
            else
                x = cos(angle)*tempx - sin(angle)*tempy;
                y = sin(angle)*tempx + cos(angle)*tempy;
            end
            % 必须使用(uint16()函数进行处理坐标，将其转化成无符号16位的int类型，否则坐标索引会出错
            old_x = uint16((x + 1)*0.5*width);
            old_y = uint16((y + 1)*0.5*height);
            % 输出图像
            output_img(i,j,:) = input_img(old_x,old_y,:);
        end
    end
end

