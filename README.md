
## Limited Memory List





The purpose of this package is to implement simple lists and vectors which automatically drop the oldest elements when the number of elements grows large enough.

## Install

You can install from github:


```r
library(remotes)
remotes::install_github("mrparker909/LimitedMemoryList")
```

## Examples

First, load the library:


```r
library(LimitedMemoryList)
```

### Lists

Create a new list:


```r
my_list = list()
```

Add elements to the list, limiting the memory to 3 items:


```r
my_list = LMList("please",my_list,3)
my_list = LMList("tree",  my_list,3)
my_list = LMList("my",    my_list,3)
my_list = LMList("climb", my_list,3)
my_list = LMList("don't", my_list,3)
my_list
```

```
## [[1]]
## [1] "don't"
## 
## [[2]]
## [1] "climb"
## 
## [[3]]
## [1] "my"
```

Because the list memory is capped at 3, the first two elements were dropped to make room for the new elements.

### Vectors

Create a new vector:


```r
my_vec = c()
```

Add elements to the vector, limiting the memory to 4 items:


```r
my_vec = LMc("please",my_vec,4)
my_vec = LMc("tree",  my_vec,4)
my_vec = LMc("my",    my_vec,4)
my_vec = LMc("climb", my_vec,4)
my_vec = LMc("don't", my_vec,4)
my_vec
```

```
## [1] "don't" "climb" "my"    "tree"
```

Since the vector memory is capped at 4, the last element was dropped to make room for the newest element.


