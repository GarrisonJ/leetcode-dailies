# @param {Integer} n
# @param {Integer[][]} meetings
# @param {Integer} first_person
# @return {Integer[]}
def find_all_people(n, meetings, first_person)
    graph = Hash.new { |h,k| h[k] = [] }
    meetings.each do |persona, personb, time|
        graph[persona] << [time, personb]
        graph[personb] << [time, persona]
    end

    has_secret = Array.new(n, Float::INFINITY)
    has_secret[first_person] = 0
    has_secret[0] = 0
    queue = MinHeap.new([[0, first_person], [0, 0]])

    while !queue.empty? do 
        time, persona = queue.pop
        graph[persona].each do |meeting_time, personb|
            next if meeting_time < time
            if has_secret[personb] > meeting_time
                has_secret[personb] = meeting_time
                queue.push([meeting_time, personb])
            end
        end
    end

    ans = []
    has_secret.each_with_index do |time, person|
        ans << person if time != Float::INFINITY
    end
    ans
end
