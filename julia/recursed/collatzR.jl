#!/usr/bin/julia

#Trevor Mines
#Collatz recursive
#CSC 330
#Fall 2020

function bubblesort(largestLens::AbstractVector, topVals::AbstractVector)
        for _ in 2:length(largestLens), j in 1:length(largestLens)-1
                if largestLens[j] > largestLens[j+1]
                        largestLens[j], largestLens[j+1] = largestLens[j+1], largestLens[j]
                        topVals[j], topVals[j+1] = topVals[j+1], topVals[j]
                end
        end
end

function main()

	largestLens :: Array{Int64, 1}  = [0,0,0,0,0,0,0,0,0,0]
	topVals :: Array{Int64, 1} = [0,0,0,0,0,0,0,0,0,0]

	#Loops through all the values
	j :: Int64 = 2
	while j < 5000000000
		#Calls the recursive collatz function to get ic
		ic = collatzIt(j)
	
		#Adds the value to largestLens if it is larger than the smallest value
		#Also adds the value to topVals and sorts
		if ic > largestLens[1]
			if (indexin(ic, largestLens)) .== nothing
				largestLens[1] = ic
				topVals[1] = j
				bubblesort(largestLens,topVals)
			end
		end

		j = j + 1

	end

	#Prints in the specified format, first sorted by length, then by value
	println("Sorted based on ascending length:")
	ic = 1
	while ic <= 10
		println("A starting value of ", topVals[ic], " has ", largestLens[ic], " steps.")
		ic = ic + 1
	end 

	bubblesort(topVals, largestLens)
	
	println()
	println("Sorted based on ascending value:")

	ic = 1
	while ic <= 10
		println("A starting value of ", topVals[ic], " has ", largestLens[ic], " steps.")
		ic = ic + 1
	end

end

#Recursive collatz function that returns the function length  
function collatzIt(num :: Int64)
	if num == 1
		return 0
	elseif (num % 2) == 0 
		return 1 + collatzIt(num ÷ 2)
	else 
		return 1 + collatzIt(num * 3 + 1 )
	end
end

main()

exit(0)
