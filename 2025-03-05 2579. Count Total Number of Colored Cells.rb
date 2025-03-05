# @param {Integer} n
# @return {Integer}
def colored_cells(n)
    width = 1 + (n-1)*2
    width**2 - (n*(n-1))*2
end

