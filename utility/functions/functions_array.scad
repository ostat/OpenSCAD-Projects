//Replace multiple values in an array
// Replaces multiple key-value pairs in an array with new values.
// keyValueArray: An array of key-value pairs to be replaced.
// arr: The original array.
// Returns a new array with the specified replacements.
function replace_Items(keyValueArray, arr) = !(len(keyValueArray)>0) ? arr :
  assert(is_list(arr), "replace_Items(keyValueArray, arr) - arr is not a list")
  assert(is_list(keyValueArray), "replace_Items(keyValueArray, arr) - keyValueArray is not a list")
  let(currentKeyValue = keyValueArray[0])
  assert(is_list(currentKeyValue), "replace_Items(keyValueArray, arr) - currentKeyValue is not a list")
  assert(is_num(currentKeyValue[0]), "replace_Items(keyValueArray, arr) - currentKeyValue[0] is not a number")
  let(keyValueArrayNext = remove_item(keyValueArray,0),
    updatedList = replace(arr, currentKeyValue[0],currentKeyValue[1])
) concat(replace_Items(keyValueArrayNext, updatedList));

//Replace a value in an array
// Replaces a value in the array at the specified position.
// list: The original array.
// position: The position of the value to be replaced (0-based index).
// value: The new value to be inserted.
// Returns a new array with the value replaced.
function replace(list,position,value) =
  assert(is_list(list), "replace(list,position,value) - list is not a list")
  assert(is_num(position), "replace(list,position,value) - position is not a number")
  let (
    l1 = position > 0 ? partial(list,start=0,end=position-1) : [],
    l2 = position < len(list)-1 ? partial(list,start=position+1,end=len(list)-1) :[]
  ) concat(l1,[value],l2);

// takes part of an array
// Extracts a subset of the array from start to end indices.
// list: The original array.
// start: The starting index of the subset (inclusive).
// end: The ending index of the subset (inclusive).
// Returns a new array containing the specified subset.
function partial(list,start,end) = [for (i = [start:end]) list[i]];

//Removes item from an array
// Removes an item from the array at the specified position.
// list: The original array.
// position: The position of the item to be removed (0-based index).
// Returns a new array with the item removed.
function remove_item(list,position) = [for (i = [0:len(list)-1]) if (i != position) list[i]];

// Sums the elements of an array.
// list: The array of numbers to be summed.
// c: The current index in the recursion (used internally).
// end: The ending index for the sum (optional).
// Returns the sum of the elements in the array from index c to the end index.
function sum(list, c = 0, end) =
  let(end = is_undef(end) ? len(list) : end)
  c < 0 || end < 0 ? 0 :
  c < len(list) - 1 && c < end
    ? list[c] + sum(list, c + 1, end=end)
    : list[c];

// Sums a specific component of a list of vectors.
// v: The list of vectors (e.g., [[1,2,3],[4,5,6]]).
// start: The starting index for the sum (optional).
// end: The ending index for the sum (optional).
// itemIndex: The index of the component in the vectors to be summed.
// Returns the sum of the specified component from the start to the end index.
function vector_sum(v, start=0, end, itemIndex) =
  let(v=is_list(v)?v:[v], end = is_undef(end)?len(v)-1:min(len(v)-1,end))
  is_num(itemIndex)
    ? start<end ? v[start][itemIndex] + vector_sum(v, start+1, end, itemIndex) : v[start][itemIndex]
    : start<end ? v[start] + vector_sum(v, start+1, end, itemIndex) : v[start];
