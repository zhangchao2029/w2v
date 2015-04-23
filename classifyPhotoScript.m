rootpath='/home/SA14011105/matlab/w2v_voc2006All_1500/images/';
targetpath='/home/SA14011105/matlab/w2v_voc2006All_1500/images_category/motorbike/';
[x1,label]= textread('/home/SA14011105/matlab/w2v_voc2006All_1500/ImageSets_train/motorbike_trainval.txt','%s%s','delimiter',' ');
j=0;
for i=1:length(x1)
    if (label{i}=='1')
        copyfile([rootpath,x1{i},'.png'],[targetpath,x1{i},'.png']);
    j=j+1;
    end
end
j

