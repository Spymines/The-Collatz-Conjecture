//Trevor Mines
//Collatz recursive
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

	//Calls the recursive function to get the sequence length of each value
	for j = 2; j < 5000000000; j++{
		i = j 
		ic = collatzIt(i)

	//Adds the len to largestLens if it is larger than the smallest value
	//Also adds the respective value and sorts
	if ic > largestLens[0]{
		if !contains(largestLens, ic){	
			largestLens[0] = ic
			topVals[0] = j
			bubblesort(largestLens, topVals)	
		}
	}
	

	} 

	//Prints the output in the specified formats, first sorted by length, then by value
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

//Sorts array a and makes the same swaps in array b to keep the values associated
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

//Searches the passed in array for the passed in item and returns a bool based on if it is found
func contains(array []int64, item int64) bool {
	for k := 0; k < 10; k++ {
		if array[k] == item{
			return true
		}
	}
	return false
}

//Recursive collatz function that returns the collatz length
func collatzIt(num int64) int64{
	if num == 1{	
 		return 0
	}else if num % 2 == 0{
         	return 1 + collatzIt(num / 2)
        }else{
                return 1 + collatzIt(3 * num + 1)
        }
}
