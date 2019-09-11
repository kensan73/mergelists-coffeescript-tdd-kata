merge = require './merge'
expect = require 'expect'
require 'mocha'

describe 'merge', ->
  it 'is a function', ->
    expect(typeof merge).toBe('function')
