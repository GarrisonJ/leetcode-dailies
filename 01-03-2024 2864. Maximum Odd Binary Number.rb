# @param {String} s
# @return {String}
def maximum_odd_binary_number(s)
   one_count = s.count('1') - 1 
   zero_count = s.count('0')
   ('1'*one_count) + ('0'*zero_count) + '1'
end
