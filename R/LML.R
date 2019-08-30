#' @title LMList
#' @description Limited Memory List. Adds new element to top of list, removing bottom elements if new length is greater tham M.
#' @param new_el   element to add to top of list
#' @param old_list list to append new_el to
#' @param M        maximum size of list (will truncate by removing bottom if length is greater than M)
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
  old_list <- c(list(new_el), old_list)
  if(length(old_list) > M) {
    old_list <- old_list[1:M]
  }
  return(old_list)
}

#' @title LMc
#' @description Limited Memory concatenate. Adds new elements to front, removing oldest elements if new length is greater tham M
#' @param new_el   elements to add to top of list, if length(new_el) > 1, then the new elements will be appended left to right (so that the last element will be the most recent).
#' @param old_list elements to concatenate new_el with
#' @param M        maximum number of elements (will truncate by removing oldest if length is greater than M)
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
  old_list <- c(rev(new_el), old_list)
  if(length(old_list) > M) {
    old_list <- old_list[1:M]
  }
  return(old_list)
}
