## Go Arrays

- Go arrays are fixed length. you can define length by ```[length]``` ex. ```[5]``` or inferred ```[...]``` compiler decide in this case.

## declare a slice:
```
var array = [length]datatype{values}
var array = [...]datatype{values}
array := [length]datatype{values}
array := [...]datatype{values}
```

## access and change the element:

example:
```
package main
import ("fmt")

func main() {
  arr := [4]int{1, 2, 3, 4}
  fmt.Printf("arr element = %v\n", arr[1])
  arr[1] = 22
  fmt.Printf("arr element = %v\n", arr[1])
  
}
```

output:
```
arr element = 2
arr element = 22
```

## more examples
example:
```
package main
import ("fmt")

func main() {
  arr1 := [4]string{} 
  arr2 := [4]string{"a","b"} 
  arr3 := [4]string{"a","b","c","d"} 
  arr4 := [4]string{1:"tom",3:"bom"}
  arr5 := [4]int{1:10,2:40}
  arr6 := [...]int{1,2,3,4,5,6,7}
  
  fmt.Println("array is", arr1, "length is", len(arr1))
  fmt.Println("array is", arr2, "length is", len(arr2))
  fmt.Println("array is", arr3, "length is", len(arr3))
  fmt.Println("array is", arr4, "length is", len(arr4))
  fmt.Println("array is", arr5, "length is", len(arr5))
  fmt.Println("array is", arr6, "length is", len(arr6))
  
}
```

output:
```
array is [   ] length is 4
array is [a b  ] length is 4
array is [a b c d] length is 4
array is [ tom  bom] length is 4
array is [0 10 40 0] length is 4
array is [1 2 3 4 5 6 7] length is 7
```

## loop through
example:
```
package main
import ("fmt")

func main() {

  arr6 := [...]string{"tom", "dom"}
  
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
- In Go, there is no such thing as passing by reference. Everything is passed by value. If you assign the value of an array to another variable, the entire value is copied.
```
arr2 := arr
```
- If you want to pass just the “reference” to the array, you can use pointers:
```
arr2 := &arr
```


More Reading:
- https://www.sohamkamani.com/golang/arrays-vs-slices/
- https://www.godesignpatterns.com/2014/05/arrays-vs-slices.html