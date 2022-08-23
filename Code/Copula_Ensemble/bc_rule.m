function [ label ] = bc_rule( c1_B,c1_M,c2_B,c2_M )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

c1=[c1_B c1_M];
c2=[c2_B c2_M];
for i=1:length(c1)
    if c1(i,1)>c1(i,2)
        id1(i,1)=1;
        id1(i,2)=2;
    else
        id1(i,1)=2;
        id1(i,2)=1;
    end
end
    
    for i=1:length(c2)
    if c2(i,1)>c2(i,2)
        id2(i,1)=1;
        id2(i,2)=2;
    else
        id2(i,1)=2;
        id2(i,2)=1;
    end
    end
for j=1:length(id1) 
 i1(j,1)=2-(id1(j,1));  
 i1(j,2)=2-(id1(j,2));
end    

for j=1:length(id2) 
 i2(j,1)=2-id2(j,1);  
 i2(j,2)=2-id2(j,2);
end

for j=1:length(id2)
    cls1(j,1)=(i1(j,1)+i2(j,1));
    cls2(j,1)=(i1(j,2)+i2(j,2));
    
end

for j=1:length(cls1)
    [~,id]=max([cls1(j,1),cls2(j,1)]);
    label(j,1)=id;
end


end

