% HSI->RGB函数
function [ out ] = myHSI2RGB( in )
    in = double(in);
    H = in(:,:,1);
    S = in(:,:,2);
    I = in(:,:,3);
    R = zeros(size(H));
    G = R;
    B = R;
    % 扩充弧度范围[0,2*pi]
    H = H*2*pi;
    % 色调[0,2*pi/3)范围内对应红->绿
    index = find(0<=H & H<2*pi/3);
    B(index) = I(index).*(1-S(index));
    R(index) = I(index).*(1+(S(index).*cos(H(index)))./cos(pi/3-H(index)));
    G(index) = 3*I(index)-(R(index)+B(index));
    % 色调[2*pi/3,4*pi/3)对应绿->蓝
    index = find(2*pi/3<=H & H<4*pi/3);
    H(index) = H(index)-2*pi/3;
    R(index) = I(index).*(1-S(index));
    G(index) = I(index).*(1+(S(index).*cos(H(index)))./cos(pi/3-H(index)));
    B(index) = 3*I(index)-(R(index)+G(index));
    % 色调[4*pi/3,2*pi]对应蓝->红
    index = find(4*pi/3<=H & H<=2*pi);
    H(index) = H(index)-4*pi/3;
    G(index) = I(index).*(1-S(index));
    B(index) = I(index).*(1+(S(index).*cos(H(index)))./cos(pi/3-H(index)));
    R(index) = 3*I(index)-(B(index)+G(index));
    % 扩充三通道范围为[0,255]
    out = cat(3,R,G,B);
end
