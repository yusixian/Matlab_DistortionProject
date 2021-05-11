% 使用伽马变换增加对比度函数
function [ output_img ] = increContrast(input_img)
    % input_img为输入图像，output_img为输出图像,
    % output_img = imadjust(input_img,[0.2 0.8],[0.1 1]);
    I = im2double(input_img);
    I = mat2gray(I); % 归一化
    output_img = 1 * (I .^ 0.9);
    figure;
    subplot(1,2,1),imshow(input_img), title('原图');
    subplot(1,2,2),imshow(output_img), title('提高对比度');
end