# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)

    loop do
        changed = false
        new_students = []
        students.each do |s|
            if s == sandwiches.first
                sandwiches.shift
                changed = true
            else
                new_students << s
            end
        end
        students = new_students
        break if !changed || students.empty?
    end
    students.size
end
