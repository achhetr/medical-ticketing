class BaseViews
  def display(prompt)
    puts prompt
  end

  def user_input(prompt)
    puts prompt
    print "=> "
    gets.chomp
  end

  def list_arr(arr)
    arr.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
  end
end