function [] = cos_value(CF, words,query_sum, maxtop_output)
    %% query for word2vec in context frequency
    %   <input>
    %   CF: context frequency matrix
    %   words: dictionary
    %   query_sum:number of query before showing the result
    %   
    k=1;
    cosine={};
    ind={};
    val={};
    iq=[];
    while 1
        w = input('please input a word: ', 's');
        iq(k) = explicit_index(words, w); % query index
        if(0 == length(iq(k)))
            display('word is not in dictionary!');
            continue;
        end
        if(length(iq(k))>1)
            continue;
        end
        %cosine = full(CF*(CF(iq,:)') ./ (sqrt(sum(CF.*CF,2)) * sqrt(sum(CF(iq,:).*CF(iq,:)))))
        %[val, ind] = sort(cosine, 'descend');
        cosine{k}=full(CF*(CF(iq(k),:)') ./ (sqrt(sum(CF.*CF,2)) * sqrt(sum(CF(iq(k),:).*CF(iq(k),:)))));
        [val{k},ind{k}] = sort(cosine{k}, 'descend');
        if(k==query_sum)
            for m=1:k
                    I=imread(['images/',words{iq(m)},'.png']);
                    subplot(query_sum,maxtop_output+1,(m-1)*(maxtop_output+1)+1);
                    imshow(I);
                    title('\fontsize{15}target','Color','r');
                for i=2:(maxtop_output+1),
                    display([num2str(i-1), ':', words{ind{m}(i)}, '(', num2str(val{m}(i)), ')']);
                    I=imread(['images/',words{ind{m}(i)},'.png']);
                    subplot(query_sum,maxtop_output+1,(m-1)*(maxtop_output+1)+i);
                    imshow(I);
                end
            end
            k=0;
        end
        k=k+1;
    end
    
end

