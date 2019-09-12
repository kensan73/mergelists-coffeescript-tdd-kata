'use strict'

merge = (A, B) ->
  return if A == undefined && B == undefined
  return B if A == undefined
  return A if B == undefined

  if A.length == 1
    for i in [0..B.length-1]
      break if A[0] < B[i]

    return [
      A[0],
      B...
    ] if i == 0

  return [
    A...,
    B[0]
  ] if B.length == 1

module.exports = merge
