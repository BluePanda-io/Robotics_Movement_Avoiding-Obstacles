function [ Ground ] = DrawPoints( Ground,X,Y,size,Color )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    X=round(X);
    Y=round(Y);

    for i=-size:size
        for j=-size:size
            Ground(Y+size,X+size)=Color;
        end
    end


end

