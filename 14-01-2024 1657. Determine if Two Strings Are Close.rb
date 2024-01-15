def close_strings(word1, word2)
    word1count = word1.chars.tally
    word2count = word2.chars.tally
    word1count.values.sort == word2count.values.sort && word1count.keys.sort == word2count.keys.sort
end
