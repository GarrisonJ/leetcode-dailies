# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
    fives = 0
    tens = 0 
    bills.each do |amount|
       case amount
       when 5
        fives+=1
       when 10
        tens+=1
        fives-=1
        return false if fives < 0
       when 20
        if tens > 0
            tens-=1
            fives-=1
        else
            fives-=3
        end
        return false if fives < 0 || tens < 0
       end 
    end
    true
end
