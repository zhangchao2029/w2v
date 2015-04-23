cd
%load('labels/image_names.mat');
%load('labels/new_image_names.mat');

picstr=dir('images/*.jpg');
[row,col]=size(picstr);
picgather=cell(row,1);

for i=1:row
    image_names{i}=picstr(i).name;
    str=picstr(i).name;
    new_image_names{i}=str(1:length(str)-4);
    
end

save('labels/image_names.mat','image_names');
save('labels/new_image_names.mat','new_image_names');

