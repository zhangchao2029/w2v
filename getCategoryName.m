label_name='flykite_clear';
[x1]= textread(['/home/SA14011105/matlab/w2v_imageNet_1500/labels_category/',label_name,'.txt'],'%s','delimiter',' ');
x1=x1'
eval([label_name,'_image_names=x1;']);
save(['labels/',label_name,'.mat'],[label_name,'_image_names']);