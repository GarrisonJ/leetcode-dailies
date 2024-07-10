# @param {String[]} logs
# @return {Integer}
def min_operations(logs)
    logs.reduce(0) do |acc, log| 
        acc += 1 if log != "./" && log != "../"
        acc -= 1 if log == "../"
        acc = [acc, 0].max
        acc
    end
end
