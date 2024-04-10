# @param {Integer[]} deck
# @return {Integer[]}
def deck_revealed_increasing(deck)
    return deck if deck.size == 1
    deck.sort!
    result = []
    result << deck.pop
    while !deck.empty? do
        result.prepend(result.pop)
        result.prepend(deck.pop)
    end
    result
end
