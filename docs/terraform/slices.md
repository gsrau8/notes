## Go slices 

- used to store values of same data type.
- flixible than arrays. i.e. length of an array can grow or shrink


## declare a slice:
```
slice_name := []datatype{values}
slice_name := []datatype{}  // here length is 0 and capacity is 0 and empty
letters := []string{"a", "b", "c", "d"}
numbers := []int{1, 3, 3, 4, 5}
```

## create slice using ```make``` func:

declaring slice using ```make```:
```
slice_name := make([]type, length, capacity)
```
- capacity equal to length if not defined
example:
```
package main

import (
	"fmt"
)

func main() {
	testclice := make([]int, 0)
	fmt.Printf("length = %d\n", len(testclice))
	fmt.Printf("capacity = %d\n", cap(testclice))
	testclice = append(testclice, 1, 2, 3, 4, 5)
	fmt.Println(testclice)
	fmt.Printf("length after append = %d\n", len(testclice))
	fmt.Printf("capacity after append = %d\n", cap(testclice))
	
	fmt.Println("----------------------------")
	
	testclice1 := make([]int, 2, 3)
	fmt.Printf("length = %d\n", len(testclice1))
	fmt.Printf("capacity = %d\n", cap(testclice1))
	testclice1 = append(testclice1, 1, 2, 3 ,4 , 5 )
	fmt.Println(testclice1)
	fmt.Printf("length after append = %d\n", len(testclice1))
	fmt.Printf("capacity after append = %d\n", cap(testclice1))
}
```
output:
```
length = 0
capacity = 0
[1 2 3 4 5]
length after append = 5
capacity after append = 6
----------------------------
length = 2
capacity = 3
[0 0 1 2 3 4 5]
length after append = 7
capacity after append = 8
```




## creating a slice from an array:
usage:
```
var testarray = [length]datatype{values} 
myslice := testarray[start:end]
```
example:
```
package main

import (
	"fmt"
)

func main() {
	
	testarray := [5]int{1, 2, 3, 4, 5}
	testslice := testarray[3:5]
	fmt.Printf("length = %d\n", len(testslice))
	fmt.Printf("capacity = %d\n", cap(testslice))
	fmt.Println(testslice)

    fmt.Println("----------------------------")

    y_array := [6]byte{'G', 'o', 'l', 'a', 'n', 'g'}
	fmt.Println(y_array)
	y_slice := y_array[3:5]
	fmt.Println(y_slice)
	
}
```

output:
```
length = 2
capacity = 2
[4 5]
------------------
[71 111 108 97 110 103]
[97 110]
```

## appending to slice
usahe:
```
c := append(slice1, slice2...)        # merging 2 slices
c := append(slice1, "item1", "item2" )  # adding items to slice
```

example:
```
package main

import (
	"fmt"
)

func main() {

	a := []string{"John", "Paul"}
	b := []string{"George", "Ringo", "Pete"}
	a = append(a, b...) // equivalent to "append(a, b[0], b[1], b[2])"
	fmt.Println(a)
	a = append(a, "something")
	fmt.Println(a)
}
```

output:
```
[John Paul George Ringo Pete]
[John Paul George Ringo Pete something]
```

# get and change a element from slice
usage:
```
slice[index] = "new_value"
```
example:
```
package main

import (
	"fmt"
)

func main() {

	b := []string{"George", "Ringo", "Pete"}
	fmt.Println(b)
	b[0] = "Tom"
	fmt.Println(b)

}
```

output:
```
[George Ringo Pete]
[Tom Ringo Pete]
```

## ```copy``` function
usage:
```
copy(dest, src)
```

as per  https://go.dev/blog/slices-intro
- re-slicing a slice doesn’t make a copy of the underlying array. The full array will be kept in memory until it is no longer referenced. Occasionally this can cause the program to hold all the data in memory when only a small piece of it is needed.
effective:
```
var digitRegexp = regexp.MustCompile("[0-9]+")

func FindDigits(filename string) []byte {
    b, _ := ioutil.ReadFile(filename)
    return digitRegexp.Find(b)
}
```

effective:
```
func CopyDigits(filename string) []byte {
    b, _ := ioutil.ReadFile(filename)
    b = digitRegexp.Find(b)
    c := make([]byte, len(b))
    copy(c, b)
    return c
}
```

example:
```
package main
import ("fmt")

func main() {
  main_slice := []int{1,2,3,4,5,6,7,8,9,10}
  fmt.Printf("main_slice = %v\n", main_slice)
  fmt.Printf("main_slice length= %v\n", len(main_slice))
  fmt.Printf("main_slice capacity = %v\n", cap(main_slice))

  
  sub_slice := main_slice[:len(main_slice)-5]
  fmt.Printf("sub_slice = %v\n",sub_slice)
  fmt.Printf("sub_slice length = %d\n", len(sub_slice))
  fmt.Printf("sub_slice capacity = %d\n", cap(sub_slice))
  
  // copy
  new_slice := make([]int, len(sub_slice))
  copy(new_slice, sub_slice)

  fmt.Printf("new_slice = %v\n",new_slice)
  fmt.Printf("new_slice length = %d\n", len(new_slice))
  fmt.Printf("new_slice capacity = %d\n", cap(new_slice))
}
```

output:
```
main_slice = [1 2 3 4 5 6 7 8 9 10]
main_slice length= 10
main_slice capacity = 10
sub_slice = [1 2 3 4 5]
sub_slice length = 5
sub_slice capacity = 10
new_slice = [1 2 3 4 5]
new_slice length = 5
new_slice capacity = 5
```

## loop through
example:
```
package main
import ("fmt")

func main() {

  arr6 := []string{"tom", "dom"}
  
  for i, s := range arr6 {
    fmt.Println(i, s)
  }
  
  for _, s := range arr6 {
    fmt.Println(s)
  }
  
   
}
```

output:
```
0 tom
1 dom
tom
dom
```

## Memory Representation
A slice is allocated differently from an array, and is actually a modified pointer. Each slice contains three pieces of information:
- The pointer to the sequence of data
- The length: which denotes the total number of elements currently contained.
- The capacity: which is the total number of memory locations provisioned.

## Reference Passing
- When you assign a slice to another variable, you still pass by value. The value here refers to just the pointer, length, and capacity, and not the memory occupied by the elements themselves.


- Everything in Go is passed by value, slices too. But a slice value is a header, describing a contiguous section of a backing array, and **a slice value only contains a pointer to the array where the elements are actually stored**. The slice value does not include its elements (unlike arrays).

- So when you pass a slice to a function, a copy will be made from this header, including the pointer, which will point to the same backing array. Modifying the elements of the slice implies modifying the elements of the backing array, and so all slices which share the same backing array will "observe" the change.


## more examples
```
package main

import "fmt"

func main() {
  
  
    fmt.Println("Go takes a more lean and lazy approach in doing this. It keeps modifying the same underlying array until the capacity of a slice is reached.")
    fmt.Println("Because since s still has capacity, both a and b share the same data ptr. If you change the capacity to 4, it prints:")
    t := make([]int, 0, 5)
    t = append(t, []int{1, 2, 3, 4}...)
    
    fmt.Printf("t: length: %d, capacity: %d, data: %v\n", len(t), cap(t), t)

    c := append(t, 5)
    fmt.Printf("a: length: %d, capacity: %d, data: %v\n", len(c), cap(c), c)

    d := append(t, 6)
    fmt.Printf("d: length: %d, capacity: %d, data: %v\n", len(d), cap(d), d)
    fmt.Printf("c: length: %d, capacity: %d, data: %v\n", len(c), cap(c), c)
    fmt.Println(" ")
    
    
    
    fmt.Println(" ")
    fmt.Println("when new variable added slice capacity doubles")
  
    s := make([]int, 0, 0)
    s = append(s, []int{1, 2, 3, 4}...)
    
    fmt.Printf("s: length: %d, capacity: %d, data: %v\n", len(s), cap(s), s)

    a := append(s, 5)
    fmt.Printf("a: length: %d, capacity: %d, data: %v\n", len(a), cap(a), a)

    b := append(s, 6)
    fmt.Printf("b: length: %d, capacity: %d, data: %v\n", len(b), cap(b), b)
    fmt.Printf("a: length: %d, capacity: %d, data: %v\n", len(a), cap(a), a)
    
    a = append(a, 7, 8, 9, 10)
    fmt.Printf("a: length: %d, capacity: %d, data: %v\n", len(a), cap(a), a)
}

```

output:
```
Go takes a more lean and lazy approach in doing this. It keeps modifying the same underlying array until the capacity of a slice is reached.
Because since s still has capacity, both a and b share the same data ptr. If you change the capacity to 4, it prints:
t: length: 4, capacity: 5, data: [1 2 3 4]
a: length: 5, capacity: 5, data: [1 2 3 4 5]
d: length: 5, capacity: 5, data: [1 2 3 4 6]
c: length: 5, capacity: 5, data: [1 2 3 4 6]
 
 
when new variable added slice capacity doubles
s: length: 4, capacity: 4, data: [1 2 3 4]
a: length: 5, capacity: 8, data: [1 2 3 4 5]
b: length: 5, capacity: 8, data: [1 2 3 4 6]
a: length: 5, capacity: 8, data: [1 2 3 4 5]
a: length: 9, capacity: 16, data: [1 2 3 4 5 7 8 9 10]
```

More Reading:
- https://www.sohamkamani.com/golang/arrays-vs-slices/
- https://stackoverflow.com/questions/39993688/are-slices-passed-by-value
- https://www.geeksforgeeks.org/how-to-pass-a-slice-to-function-in-golang/
- https://stackoverflow.com/questions/28115599/when-does-golang-append-create-a-new-slice


```
package main

import "fmt"

func main() {

	fmt.Println("array address")
	array1 := [3]int{6, 1, 2}
	array2 := array1
	fmt.Printf("Address of array = %v: %p\n", array1, &array1)
	fmt.Printf("Address of array = %v: %p\n", array2, &array2)
	fmt.Println("-------")
	array2[1] = 3333
	fmt.Println(array1)
	fmt.Println(array2)
	fmt.Println("---array done----")

	fmt.Println("--- print address of slice")
	slice1 := []int{6, 1, 2}
	slice2 := slice1
	fmt.Printf("Address of slice = %v: %p\n", slice1, &slice1)
	fmt.Printf("Address of slice = %v: %p\n", slice2, &slice2)
	fmt.Println("--- print address of slice underlying array")
	fmt.Printf("Address of slice = %v: %p\n", slice1, slice1)
	fmt.Printf("Address of slice = %v: %p\n", slice2, slice2)

	fmt.Println("Go takes a more lean and lazy approach in doing this. It keeps modifying the same underlying array until the capacity of a slice is reached.")
	fmt.Println("Because since s still has capacity, both a and b share the same data ptr. If you change the capacity to 4, it prints:")
	t := make([]int, 0, 5)
	t = append(t, []int{1, 2, 3, 4}...)

	fmt.Printf("t: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(t), cap(t), t, t)
	c := append(t, 5)
	fmt.Printf("a: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(c), cap(c), c, c)
	d := append(t, 6)
	fmt.Printf("d: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(d), cap(d), d, d)
	fmt.Printf("c: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(c), cap(c), c, c)
	fmt.Println(" ")

	fmt.Println(" ")
	fmt.Println("when new variable added slice capacity doubles")
	s := make([]int, 0, 0)
	s = append(s, []int{1, 2, 3, 4}...)
	fmt.Printf("s: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(s), cap(s), s, s)
	a := append(s, 5)
	fmt.Printf("a: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(a), cap(a), a, a)
	b := append(s, 6)
	fmt.Printf("b: length: %d, capacity: %d,pointer to underlying array: %p,  data: %v\n", len(b), cap(b), b, b)
	fmt.Printf("a: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(a), cap(a), a, a)
	a = append(a, 7, 8, 9, 10)
	fmt.Printf("a: length: %d, capacity: %d, pointer to underlying array: %p, data: %v\n", len(a), cap(a), a, a)
}
```

```
Address of array = [6 1 2]: 0xc000128090
Address of array = [6 1 2]: 0xc0001280a8
-------
[6 1 2]
[6 3333 2]
---array done----
--- print address of slice
Address of slice = [6 1 2]: 0xc000112060
Address of slice = [6 1 2]: 0xc000112078
--- print address of slice underlying array
Address of slice = [6 1 2]: 0xc000128138
Address of slice = [6 1 2]: 0xc000128138
Go takes a more lean and lazy approach in doing this. It keeps modifying the same underlying array until the capacity of a slice is reached.
Because since s still has capacity, both a and b share the same data ptr. If you change the capacity to 4, it prints:
t: length: 4, capacity: 5, pointer to underlying array: 0xc00013c090, data: [1 2 3 4]
a: length: 5, capacity: 5, pointer to underlying array: 0xc00013c090, data: [1 2 3 4 5]
d: length: 5, capacity: 5, pointer to underlying array: 0xc00013c090, data: [1 2 3 4 6]
c: length: 5, capacity: 5, pointer to underlying array: 0xc00013c090, data: [1 2 3 4 6]


when new variable added slice capacity doubles
s: length: 4, capacity: 4, pointer to underlying array: 0xc0001240a0, data: [1 2
                                                                               2 3 4]
a: length: 5, capacity: 8, pointer to underlying array: 0xc000140100, data: [1 2
                                                                               2 3 4 5]
b: length: 5, capacity: 8,pointer to underlying array: 0xc000140140,  data: [1 2
                                                                               2 3 4 6]
a: length: 5, capacity: 8, pointer to underlying array: 0xc000140100, data: [1 2
                                                                               2 3 4 5]
a: length: 9, capacity: 16, pointer to underlying array: 0xc00015a080, data: [1 
                                                                                2 3 4 5 7 8 9 10]
```