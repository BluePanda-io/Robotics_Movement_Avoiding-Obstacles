function [ R ] = RotationMatrix( th )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    R(1,1)=cosd(th);
    R(1,2)=sind(th);
    R(1,3)=-sind(th);
    R(1,4)=R(1,1);


end

