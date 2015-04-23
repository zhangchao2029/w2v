function [] = multi_cos_arithmetic(CF, words, maxtop_output)
    mat_A='bird_sky';
    mat_B='bird_clear';
    mat_D='flykite_clear';
    mat_allD='flykite';
    
    
    load(['./labels/',mat_A,'.mat']);
    load(['./labels/',mat_B,'.mat']);
    load(['./labels/',mat_D,'.mat']);
    load(['./labels/',mat_allD,'.mat']);
%% output the top
    % <input>
    % CF: context frequency
    % words: dictionary
    % maxtop_output: the max number of display
    eval(['all_third=',mat_allD,'_image_names']);
    eval(['firstA=',mat_A,'_image_names']);
    eval(['secondB=',mat_B,'_image_names']);
    eval(['thirdC=',mat_D,'_image_names']);
    %first=horse_snow_image_names;
   % second=horse_clear_image_names;
    %third=dog_clear_image_names;
    k=1;
 	times=1;
   for firstnum=1:length(firstA)
       for secondnum=1:length(secondB)
        A = cell2mat(firstA(firstnum));
        [A1,A2]=size(A);
        B = cell2mat(secondB(secondnum));
         [B1,B2]=size(B);
         %matrix dimention must be unified
        if A2==B2
        if A==B
            continue;
        end
        end
        for thirdnum=1:length(thirdC)
            display(['num ',num2str(k),' picture is down!']);
            k=k+1;
            D=cell2mat(thirdC(thirdnum));
        %for all data
             iqA = explicit_index(words, A); % A
             iqB  = explicit_index(words, B); % B
             iqD = explicit_index(words, D); % D
             primal_set={A,B,D};
            if(0 == length(iqA) || 0 == length(iqB) || 0 == length(iqD))
                display('certain word is in dictionary!');
             continue;
            end
             iq_query = CF(iqA,:) - CF(iqB,:) + CF(iqD,:);
             cosine = full(CF*(iq_query') ./ (sqrt(sum(CF.*CF,2)) * sqrt(sum(iq_query.*iq_query))));
             [val, ind] = sort(cosine, 'descend');
     
        %show the img
              I=imread(['images/',A,'.jpg']);
               subplot(2,maxtop_output,1);
               imshow(I);
              title(['\fontsize{15}A',A],'Color','r');
              I=imread(['images/',B,'.jpg']);
              subplot(2,maxtop_output,2);
              imshow(I);
             title(['\fontsize{15}B',B],'Color','r');
              I=imread(['images/',D,'.jpg']);
             subplot(2,maxtop_output,3);
             imshow(I);
             title(['\fontsize{15}D',D],'Color','r');
         m=1;
         i=1;
         while i<=maxtop_output
            % display([num2str(i), ':', words{ind(i)}, '(', num2str(val(i)), ')']);
            if  ismember(words{ind(m)},primal_set)
                 m=m+1;
                 continue;
             end
             if ismember(words{ind(m)},all_third)==0
                break;
             end    
             I=imread(['images/',words{ind(m)},'.jpg']);
             subplot(2,maxtop_output,(maxtop_output)+i);
             imshow(I);
             title(['\fontsize{15}D',words{ind(m)}]);
             m=m+1;
             i=i+1;
         end
           if i<6
              continue
           end
                   saveas(gcf,['/home/SA14011105/matlab/w2v_imageNet_1500/result/bird_flykite_sky/',num2str(times),'.jpg']);
                   times=times+1;
                   display(['num ',num2str(times),' picture is good!']);
        end
       end  
    
   end
 end


