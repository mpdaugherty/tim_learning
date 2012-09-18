puts 'Please enter some words.  Press "enter" on a blank line'
puts 'to finish.'
start = []
sorted = []

while true
	input = gets.chomp
	if input == ''
		break
	else
		start.push input
	end
end

def sort start, sorted
	unsorted = []
	
	if start.length == 0
		return sorted
	else
	pop = start.pop
		start.each do |x|
			if pop < x || pop == x
				unsorted.push x
			else
				unsorted.push pop
				pop = x
			end
		end
		sorted.push pop
	end
	
	sort unsorted, sorted
end

puts ''
puts sort(start, sorted)

