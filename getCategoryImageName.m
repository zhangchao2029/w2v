cd
%load('labels/image_names.mat');
%load('labels/new_image_names.mat');

picstr=dir('images_category/flykite/*.jpg');

[row,col]=size(picstr);
picgather=cell(row,1);

for i=1:row
    image_names{i}=picstr(i).name;
    str=picstr(i).name;
    flykite_image_names{i}=str(1:length(str)-4);
end
row
%save('labels/image_names.mat','image_names');
save('labels/flykite.mat','flykite_image_names');