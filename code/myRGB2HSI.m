% RGB->HSI函数
function [ output_img ] = myRGB2HSI( in )
    in = im2double(in);
    % 输入图片的RGB通道
    R = in(:,:,1);
    G = in(:,:,2);
    B = in(:,:,3);
    % 转换为HSI
    sum_RGB = R+G+B;
    S = 1-(3*min(min(R,G),B))./(sum_RGB+eps);
    H = acos((0.5*(R+R-G-B))./sqrt((R-G).*(R-G)+(R-B).*(G-B)+eps));
    H(B>G) = 2*pi-H(B>G);
    H = H/(2*pi);
    H(S==0) = 0;
    I = sum_RGB/3;
    % 输出结果图
    output_img = cat(3,H,S,I);
end