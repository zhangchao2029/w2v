function [] = cos_A_B_C(CF, words, maxtop_output)
    %% output the top
    % <input>
    % CF: context frequency
    % words: dictionary
    % maxtop_output: the max number of display
    while 1
        w = input('please input three words(A - B): ', 's');
        temp = regexp(w, ' ', 'split');
        A = temp(1);
        B = temp(2);
        iqA = explicit_index(words, A); % A
        iqB  = explicit_index(words, B); % B
        if(0 == length(iqA) || 0 == length(iqB))
            display('certain word is in dictionary!');
            continue;
        end
        iq_query = CF(iqA,:) - CF(iqB,:) ;
        cosine = full(CF*(iq_query') ./ (sqrt(sum(CF.*CF,2)) * sqrt(sum(iq_query.*iq_query))));
        [val, ind] = sort(cosine, 'descend');
        %transform cell to string type
        A=A{1};
        B=B{1};
        %show the img
                    I=imread(['images/',A,'.png']);
                    subplot(2,maxtop_output,1);
                    imshow(I);
                    title('\fontsize{15}A','Color','r');
                    I=imread(['images/',B,'.png']);
                    subplot(2,maxtop_output,2);
                    imshow(I);
                    title('\fontsize{15}B','Color','r');
 
         margin=0;
         k=1;
        if ismember(iqA,ind)
            margin=1+margin;
        end
        if ismember(iqB,ind)
            margin=1+margin;
        end
 
        for i=1+margin:(maxtop_output+margin)
             display([num2str(i), ':', words{ind(i)}, '(', num2str(val(i)), ')']);
             I=imread(['images/',words{ind(i)},'.png']);
             subplot(2,maxtop_output,(maxtop_output)+k);
             imshow(I);
             k=k+1;
        end
                   
        
    end
end

