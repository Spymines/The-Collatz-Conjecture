#!/usr/bin/julia

#Trevor Mines
#Collatz iterative
#CSC 330
#Fall 2020

#Function that sorts the first array and makes the same swaps in the second array
function bubblesort(largestLens::AbstractVector, topVals::AbstractVector)
        for _ in 2:length(largestLens), j in 1:length(largestLens)-1
                if largestLens[j] > largestLens[j+1]
                        largestLens[j], largestLens[j+1] = largestLens[j+1], largestLens[j]
                        topVals[j], topVals[j+1] = topVals[j+1], topVals[j]
                end
        end
end

function main()

	largestLens :: Array{Int64,1} = [0,0,0,0,0,0,0,0,0,0]
	topVals :: Array{Int64,1} = [0,0,0,0,0,0,0,0,0,0]

	#Loops through each value and gets the ic	
	j :: Int64 = 2
	while j < 5000000000
		ic = 0
		i :: Int64 = j
		while i != 1
			if i % 2 == 0
				i = i ÷ 2
			else 
				i = i * 3 + 1
			end
			ic = ic + 1
		end
	
		#Puts the length in largestLens if it is larger than the smallest value in largestLens
		#Mirrors changes in topVals and sorts
		if ic > largestLens[1]
			if (indexin(ic, largestLens)) .== nothing
				largestLens[1] = ic
				topVals[1] = j
				bubblesort(largestLens,topVals)
			end
		end

		j = j + 1

	end

	#Prints in the specified format, sorted first by lengths then by values
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


main()

exit(0)
