# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
    values = []

    tokens.each do |i|
        if i =~ /[0-9]+/
            values.append(i)
            next
        end
        a = values.pop.to_i
        b = values.pop.to_i
        case i 
        when '+'
            values.append((b+a).to_s)
        when '-'
            values.append((b-a).to_s)
        when '*'
            values.append((b*a).to_s)
        when '/'
            values.append(((b/(a*1.0)).to_i))
        end
    end
    values.pop.to_i
    
end
