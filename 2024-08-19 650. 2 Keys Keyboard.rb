# @param {Integer} n
# @return {Integer}
def min_steps(n)
    return 0 if n == 1
    return 2 if n == 2
    
    notepad = 1
    clipboard = 1
    operations = 1

    while notepad != n do
        if clipboard < notepad && n % notepad == 0
            clipboard = notepad
        else
            notepad += clipboard
        end
        operations+=1
    end
    operations
end
