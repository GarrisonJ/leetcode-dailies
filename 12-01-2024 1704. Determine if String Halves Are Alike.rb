def halves_are_alike(s)
    vowels = Set.new(['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'])
    count_a = 0
    count_b = 0
    half = s.size / 2
    half.times do |i|
        count_a += 1 if vowels.include?(s[i])
        count_b += 1 if vowels.include?(s[half+i])
    end
    count_a == count_b
end
