program collatz

integer ::  ic, counter
integer (8) :: j,i,temp
integer (8), dimension(10):: largestLens
integer (8), dimension(10):: topVals

interface
        SUBROUTINE Bubble_Sort(a,b)
                Integer(8), INTENT(in out), DIMENSION(:) :: a
                Integer(8), INTENT(in out), DIMENSION(:) :: b
                Integer(8) :: temp
                INTEGER :: i, j
                LOGICAL :: swapped
        end subroutine Bubble_Sort

        LOGICAL FUNCTION inArray(array, item) result(found)
                INTEGER(8), INTENT(in), DIMENSION(:) :: array
                INTEGER :: item
                INTEGER(8) :: counter
        END FUNCTION inArray
end interface


!Sets all of the array values to 0
counter = 1
do while (counter <= 10)
        largestLens(counter) = 0_8
        topVals(counter) = 0_8
        counter = counter + 1
end do 

!Sets the limits to be checked
temp = 5000000000_8
j = 2_8
do while (j < temp)


!Sets i to j to be used in the calculations
i = j
ic=0
!Loops to calculate the collatz length of j 
do while ( i /= 1 )  
        if ( mod(i,2) == 0 ) then  ! If even divide by 2
                i = i / 2
        else
                i = i * 3 + 1            ! If odd multiply by 3 and add 1
        endif
                ic = ic + 1                ! Increment counter 
enddo 

!Adds the current value to the array and sorts it
!if the value is larger than the smallest value in largestLens
if(ic > largestLens(1)) then
        if(.not. inArray(largestLens,ic)) then
                largestLens(1) = ic
                topVals(1) = j
                Call Bubble_Sort(largestLens, topVals)
        endif
endif


j = j + 1
enddo

!Prints the output sorted based on length and value respectively, resorting
!between the two
print*,"Sorted based on ascending length:"
counter = 1
do while (counter <= 10)
        print *, "A starting value of ", topVals(counter:counter), " has ",largestLens(counter:counter), " steps."
        counter = counter + 1
enddo

Call Bubble_Sort(topVals, largestLens)

print*, " " 

print*,"Sorted based on ascending value:"
counter = 1
do while (counter <= 10)
        print *, "A starting value of ", topVals(counter:counter), " has ",largestLens(counter:counter), " steps."
        counter = counter + 1
enddo

end program collatz

!Subroutine that sorts array a and makes the same swaps in 
!array b to keep the values associated with eachother
SUBROUTINE Bubble_Sort(a, b)
  Integer(8), INTENT(in out), DIMENSION(:) :: a
  Integer(8), INTENT(in out), DIMENSION(:) :: b
  Integer(8) :: temp
  INTEGER :: i, j
  LOGICAL :: swapped
 
  DO j = SIZE(a)-1, 1, -1
    swapped = .FALSE.
    DO i = 1, j
      IF (a(i) > a(i+1)) THEN
        temp = a(i)
        a(i) = a(i+1)
        a(i+1) = temp

        temp = b(i)
        b(i) = b(i+1)
        b(i+1) = temp

        swapped = .TRUE.
      END IF
    END DO
    IF (.NOT. swapped) EXIT
  END DO
END SUBROUTINE Bubble_Sort

!Function that gets passed an array and an item and
!returns a logical based on if the item is in the array
LOGICAL FUNCTION inArray(array, item) result(found)
        INTEGER(8), INTENT(in), DIMENSION(:) :: array
        INTEGER :: item
        INTEGER(8) :: counter
        found = .FALSE.
        counter = 1
        do while (counter <= 10)
                if (array(counter) == item) then
                        found = .TRUE.
                        EXIT
                end if
                counter = counter + 1
        enddo
END FUNCTION inArray














