function [index] = explicit_index(words, word)
   %% index word in words
   %    <input> 
   %    words: cell list
   %    word:  input word
   %    <return>
   %    index: index of word in words
    index = find(1 == strcmp(words, word));
end

