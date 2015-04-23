%load('labels/image_names.mat');
%load('labels/new_image_names.mat');

picstr=dir('images_category/duck/*.jpg');
[row,col]=size(picstr);
picgather=cell(row,1);
row
for i=1:row
    image_names{i}=picstr(i).name;
    str=picstr(i).name;
    copyfile(['images_category/duck/',str],['images_category/duck2/',num2str(i+1808),'.jpg']);
end

