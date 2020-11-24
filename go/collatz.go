//Trevor Mines
//Collatz iterative
//CSC 330
//Fall 2020

package main

import "fmt"

func main(){
	var ic int64
	var i, j int64
	i = 0
	j = 0
	largestLens := [] int64{0,0,0,0,0,0,0,0,0,0}
	topVals := [] int64{0,0,0,0,0,0,0,0,0,0}	

	//Loops through each value calculating the collatz length
	for j = 2; j < 5000000000; j++{
		i = j 
		ic = 0
		for i > 1{
			if i%2 == 0{
				i /= 2
			}else{
				i = 3 * i + 1
			}
			ic++
		}

	//Puts the lengths into largestLens if it is larger than the smallest length in largestLens
	//Puts the value into topVals and sorts
	if ic > largestLens[0]{
		if !contains(largestLens, ic){	
			largestLens[0] = ic
			topVals[0] = j
			bubblesort(largestLens, topVals)	
		}
	}


	

	} 


	//Prints the output in the specified format, sorted by length then value resorting in between 
	fmt.Println("Sorted based on ascending length:")
	for l := 0; l < 10; l++{
		fmt.Println("A starting value of ", topVals[l], " has ", largestLens[l], " steps.")
	}

	bubblesort(topVals, largestLens)
	fmt.Println()

	fmt.Println("Sorted based on ascending value:")
	for l := 0; l < 10; l++{
                fmt.Println("A starting value of ", topVals[l], " has ", largestLens[l], " steps.")
        }


}

//Sorts array a and makes the same swaps in array b to keep the numbers associated with eachother
func bubblesort(a []int64, b []int64) {
    for itemCount := len(a) - 1; ; itemCount-- {
        hasChanged := false
        for index := 0; index < itemCount; index++ {
            if a[index] > a[index+1] {
                a[index], a[index+1] = a[index+1], a[index]
		b[index], b[index+1] = b[index+1], b[index]
                hasChanged = true
            }
        }
        if hasChanged == false {
            break
        }
    }
}

//Searches the passed in array for an item and returns a bool based on if it is found
func contains(array []int64, item int64) bool {
	for k := 0; k < 10; k++ {
		if array[k] == item{
			return true
		}
	}
	return false
}
