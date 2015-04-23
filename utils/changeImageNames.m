%load('labels/image_names.mat');
%load('labels/new_image_names.mat');

picstr=dir('images/*.gif');
[row,col]=size(picstr);
picgather=cell(row,1);
for i=1:row
    image_names{i}=picstr(i).name;
    str=picstr(i).name;
    copyfile(['images/',str],['images3/',num2str(i+3738),'.jpg']);
end

