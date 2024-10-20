-- Importing modules
local UpdateByQuery = require "elasticsearch.endpoints.UpdateByQuery"
local parser = require "elasticsearch.parser"
local MockTransport = require "lib.MockTransport"
local getmetatable = getmetatable

-- Setting up environment
local _ENV = lunit.TEST_CASE "tests.endpoints.UpdateByQueryTest"

-- Declaring local variables
local endpoint
local mockTransport = MockTransport:new()

-- Testing the constructor
function constructorTest()
  assert_function(UpdateByQuery.new)
  local o = UpdateByQuery:new()
  assert_not_nil(o)
  local mt = getmetatable(o)
  assert_table(mt)
  assert_equal(mt, mt.__index)
end

-- The setup function
function setup()
  endpoint = UpdateByQuery:new{
    transport = mockTransport
  }
end

-- Testing request
function requestTest()
  mockTransport.method = "POST"
  mockTransport.uri = "/twitter/_update_by_query"
  mockTransport.params = {}
  mockTransport.body = nil

  endpoint:setParams{
    index = "twitter"
  }

  local _, err = endpoint:request()
  assert_nil(err)
end

-- Testing type request
function requestTypeTest()
  mockTransport.method = "POST"
  mockTransport.uri = "/twitter/_update_by_query"
  mockTransport.params = {}
  mockTransport.body = nil

  endpoint:setParams{
    index = "twitter",
  }

  local _, err = endpoint:request()
  assert_nil(err)
end

