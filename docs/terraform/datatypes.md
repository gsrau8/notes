

Data types specify the type of data that a valid Go variable can hold


- Basic Types
  - Integers (Signed and UnSigned)
  - Floats
  - Complex Numbers
  - Byte
  - Rune
  - String
  - Booleans
- Composite ( Unnamed ) Types
  > In computer science, a composite data type is any data type which can be constructed in a program using its programming language's primitive data types and other composite types.  Composite types are known as “unnamed types”, because they use a type literal to represent the structural definition of the type, instead of using a simple name identifier
  - Non-Reference Types
    - Arrays
    - Structs 
  - Reference Types ( Non-primitive )
    - Slices
    - Channels
    - Maps
    - Pointers
    - Functions
  - Interface
    - Special case of empty interface


> **A primitive data type** type that hold simple values. A primitive type has always a value, while non-primitive types can be null.  In golang, we have string, numeric type ( integer, float and complex ), bool, and error type.  variable contains the value 

> **Non-primitive data types** Non-Primitive data types refer to objects and hence they are called reference types. variable contains address of the value 

Default values:
- String: ""
- integer, byte, rune is 0
- Float  0
- complex 0+0i
- Booleans False
- Pointers ( var num *int - fmt.Println(num) ) is nil
- structs { "", 0 }
- slices nil
- map in Go is nil
