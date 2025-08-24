## Go maps

- maps are collection of ```key: value``` pairs
- no duplicates.
- you can use ```len()``` function
- changable


# declaring
```
var a = map[KeyType]ValueType{key1:value1, key2:value2,...}
b := map[KeyType]ValueType{key1:value1, key2:value2,...}
var x = make(map[string]string)
```

# example
```
package main
import ("fmt")

func main() {
  var a = map[string]string{"a": "apple", "b": "ball"}
  b := map[string]int{"x": 1, "y": 2}

  var c map[string]string            // empty map using variable
  var d = make(map[string]string)    // empty map using make function

  fmt.Printf("a\t%v\n", a)
  fmt.Printf("b\t%v\n", b)
  fmt.Printf("a\t%v\n", c)
  fmt.Printf("b\t%v\n", d)
  fmt.Println(c == nil)
  fmt.Println(d == nil)

  //c["a"] = "apple"  // panic: assignment to entry in nil map
  d["a"] = "apple"  // adding/updating key-value to map
  fmt.Printf("a\t%v\n", d)
}
```

output
```
a	map[a:apple b:ball]
b	map[x:1 y:2]
a	map[]
b	map[]
true
false
a	map[a:apple]
```


## adding and removing element
```
package main
import ("fmt")

func main() {
  var a = map[string]string{"a": "apple", "b": "ball"}
  a["a"] = "ball"
  delete(a, "b")

  fmt.Printf("a\t%v\n", a)

}
```
output:
```
a	map[a:ball]
```


## loop through


## merge 
no builtin func.
```
for k, v := range b {
    a[k] = v
}
```