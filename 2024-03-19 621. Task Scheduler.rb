# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
    tasks = tasks.tally
    time = 0
    while !tasks.empty? do
        cycle = n + 1
        next_tasks = {}
        task_count = 0
        while cycle > 0 && !tasks.empty? do
            key, task_c = tasks.max_by { |h,v| v }
            tasks.delete(key)
            next_tasks[key] = task_c-1 if task_c > 1
            task_count+=1
            cycle-=1
        end
        tasks = tasks.merge(next_tasks)
        time += tasks.empty? ? task_count : n + 1
    end
    time
end
