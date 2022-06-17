# write code here...
def get_pair(array, k)
  sorted_array = array.sort
  result = []

  sorted_array.each do |n|
    desired_n = k - n

    if array.include? desired_n && !result.include? [n, desired_n] && n != desired_n
      result << (n, desired_n)
    end
  end

  result
end
