'use strict'

mocha = require 'mocha'
Given = require 'given'

describe = mocha.describe
it = mocha.it

merge = require './merge'
expect = require 'expect'

describe 'merge', ->
  given = undefined

  beforeEach ->
    given = Given @
    given
      listA: -> [1, 5, 10]
      undefinedList: -> undefined
      listB: -> [2, 4, 8]


  it 'is a function', ->
    expect(typeof merge).toBe('function')
  it 'returns undefined for 2 undefined parameters', ->
    expect(merge(undefined, undefined)).toBe(undefined)
  it 'returns A for (A, undefined)', ->
    expect(merge(@listA, @undefinedList)).toBe(@listA)
  it 'returns B for (undefined, B)', ->
    expect(merge(undefined, @listB)).toBe(@listB)
  describe 'returns [1, 2, 3, 4] for [1], [2, 3, 4]', ->
    beforeEach ->
      given
        listA: -> [1]
        listB: -> [2, 3, 4]
    it 'returns correct length', ->
      expect(merge(@listA, @listB).length).toBe(4)
    it 'returns correct 0th el', ->
      expect(merge(@listA, @listB).toString()).toBe('1,2,3,4')
  describe 'returns [1, 2, 6] for [1, 2], [6]', ->
    beforeEach ->
      given
        listA: -> [1, 2]
        listB: -> [6]
    it 'returns correct length', ->
      expect(merge(@listA, @listB).length).toBe(3)
    it 'returns correct 0th el', ->
      expect(merge(@listA, @listB).toString()).toBe('1,2,6')
