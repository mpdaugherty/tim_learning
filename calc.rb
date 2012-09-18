puts 'Please give me some words to sort alphabetically.  One word per line.'
set = []
unsortset = []
sortedset = []
words = 0
tosort = 0
word = 0
compword = 1
x = 0

while true
	input = gets.chomp
	input = input.downcase
	if input == ''
		break
	else
		set.push input
		words = words +1
		tosort = tosort + 1
	end
end

set.push ''

def try set, sortedset, words, word, compword, tosort, unsortset, x
	if tosort == 0
		puts'---'
		puts 'In alphabetical order: '
		sortedset
	elsif set[word] < set[compword] || compword == words
			if compword == words
				sortedset.push set[word]
				x = word
				x2 = word
					while true
						x = x + 1
						if x < words
							unsortset.push set[x]
						elsif x == words
							break
						end
					end

					while true
						x2 = x2 - 1
						if x2 >= 0
							unsortset.push set[x2]
						elsif x2 < 0
							break
						end
					end
				set = unsortset
				unsortset = []
				set.push ''
				x = 0
				words = words - 1
				tosort = tosort - 1
				word = 0
				compword = 1
				try set, sortedset, words, word, compword, tosort, unsortset, x
			else
				x = x+1
				compword = compword + 1
				try set, sortedset, words, word, compword, tosort, unsortset, x
			end
	elsif set[word] > set[compword] || set[word] == set[compword]
		x = x+1
		compword = compword +1
		word = compword - 1
		try set, sortedset, words, word, compword, tosort, unsortset, x
	else
		'ugh'
	end
end

puts try set, sortedset, words, word, compword, tosort, unsortset, x
