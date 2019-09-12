#' @title LMList
#' @description Limited Memory List. Adds new element to top of list, removing bottom elements if new length is greater than M.
#' @param new_el   element to add to top of list
#' @param old_list list to append new_el to
#' @param M        maximum size of list (will truncate by removing bottom if length is greater than M). If M==0, the list will have 'unlimited' memory.
#' @examples
#' # create a new LM List, with 2 element memory:
#' lm = LMList("horse", M=2)
#' print(lm)
#'
#' # append new item
#' lm = LMList("buggy", lm, M=2)
#' print(lm)
#'
#' # append a third item (will forget the oldest)
#' lm = LMList("driver", lm, M=2)
#' print(lm)
#' @export
LMList <- function(new_el, old_list = list(), M = 1) {
  M=ifelse(M==0, 1+length(old_list), M)
  old_list <- c(list(new_el), old_list)
  if(length(old_list) > M) {
    old_list <- old_list[1:M]
  }
  return(old_list)
}

#' @title LMc
#' @description Limited Memory concatenate. Adds new elements to front, removing oldest elements if new length is greater tham M.
#' @param new_el   elements to add to top of vector, if length(new_el) > 1, then the new elements will be appended left to right (so that the last element will be the most recent).
#' @param old_list elements to concatenate new_el with.
#' @param M        Memory, maximum number of elements (will truncate by removing oldest if length is greater than M). If M==0, the vector will have 'unlimited' memory.
#' @examples
#' a = LMc(1, M=5)
#' print(a)
#'
#' a = LMc(c(2,3,4,5), a, M=5)
#' print(a)
#'
#' a = LMc(c(6,7), a, M=5)
#' print(a)
#' @export
LMc <- function(new_el, old_list = NULL, M = 1) {
  M=ifelse(M==0, 1+length(old_list), M)
  old_list <- c(rev(new_el), old_list)
  if(length(old_list) > M) {
    old_list <- old_list[1:M]
  }
  return(old_list)
}
