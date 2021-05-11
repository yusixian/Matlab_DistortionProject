% 增加饱和度函数
function [ output_img ] = increSatura(input_img)
    % input_img为输入图像，output_img为输出图像,
    % 提取RGB三个颜色分量，并将RGB空间变换为HSI空间
    R = input_img(:,:,1);
    G = input_img(:,:,2);
    B = input_img(:,:,3);
    HSI_img = myRGB2HSI(input_img);
    % 提取H、S、I三个分量，分别代表色调H（Hue）、饱和度S（Saturation）、亮度I（Intensity）
    H = HSI_img(:,:,1);
    S = HSI_img(:,:,2);
    I = HSI_img(:,:,3);
    % 提高亮度I
    % I = I*1.2;
    % 增加饱和度S
    S = S*1.7;
    HSI_img = cat(3,H,S,I);
    output_img = myHSI2RGB(HSI_img);
    figure;
    subplot(1,2,1),imshow(input_img), title('原图');
    subplot(1,2,2),imshow(output_img), title('增加饱和度后图片');
end