puts 'Please give me some words to sort alphabetically.  One word per line.'
set = []
unsortset = []
sortedset = []
words = 0
tosort = 0
word = 0
compword = 1
x = 0

begin
	input = gets.chomp
	input = input.downcase
	set.push input
	words = words +1
	tosort = tosort + 1
end while input != ''

set.push ''

def try set, sortedset, words, word, compword, tosort, unsortset, x
	if tosort == 0
		puts'---'
		puts 'In alphabetical order: '
		sortedset
	elsif set[word] < set[compword] || compword == words
			if compword == words
				sortedset.push set[word]
				for x in (word+1)..(words-1)
					unsortset.push set[x]
				end

				for x in 0..(word-1)
					unsortset.push set[x]
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
				x = x + 1
				compword = compword + 1
				try set, sortedset, words, word, compword, tosort, unsortset, x
			end

        # Add some more comments to describe what you are trying to do
        # at each point in the code.  I'm not 100% why this elsif is needed
        # for example.  This will also help yourself after a day or two away
	elsif set[word] > set[compword] || set[word] == set[compword]
		x = x + 1
		compword = compword + 1
		word = compword - 1
		try set, sortedset, words, word, compword, tosort, unsortset, x
	else
		'ugh'
	end
end

puts try set, sortedset, words, word, compword, tosort, unsortset, x
