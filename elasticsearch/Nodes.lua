-------------------------------------------------------------------------------
-- Declaring module
-------------------------------------------------------------------------------
local Nodes = {}

-------------------------------------------------------------------------------
-- Declaring instance variables
-------------------------------------------------------------------------------

-- The transport module
Nodes.transport = nil

-------------------------------------------------------------------------------
-- Function to request an endpoint instance for a particular type of request
--
-- @param   endpoint        The string denoting the endpoint
-- @param   params          The parameters to be passed
-- @params  endpointParams  The endpoint params passed while object creation
--
-- @return  table     Error or the data recevied from the elasticsearch server
-------------------------------------------------------------------------------
function Nodes:requestEndpoint(endpoint, params, endpointParams)
  local Endpoint = require("endpoints.Nodes." .. endpoint)
  local endpoint = Endpoint:new{
    transport = self.transport,
    endpointParams = endpointParams or {}
  }
  if params ~= nil then
    -- Parameters need to be set
    local err = endpoint:setParams(params);
    if err ~= nil then
      -- Some error in setting parameters, return to user
      return nil, err
    end
  end
  -- Making request
  local response, err = endpoint:request()
  if response == nil then
    -- Some error in response, return to user
    return nil, err
  end
  -- Request successful, return body
  return response.body
end

-------------------------------------------------------------------------------
-- Function to retrieve info of a node
--
-- @param    params    The stats Parameters
--
-- @return   table     Error or the data recevied from the elasticsearch server
-------------------------------------------------------------------------------
function Nodes:info(params)
  return self:requestEndpoint("Info", params)
end

-------------------------------------------------------------------------------
-- Function to retrieve statistics of a node
--
-- @param    params    The stats Parameters
--
-- @return   table     Error or the data recevied from the elasticsearch server
-------------------------------------------------------------------------------
function Nodes:stats(params)
  return self:requestEndpoint("Stats", params)
end

-------------------------------------------------------------------------------
-- Function to retrieve current hot threads
--
-- @param    params    The stats Parameters
--
-- @return   table     Error or the data recevied from the elasticsearch server
-------------------------------------------------------------------------------
function Nodes:hotThreads(params)
  return self:requestEndpoint("HotThreads", params)
end

-------------------------------------------------------------------------------
-- Function to shutdown nodes
--
-- @param    params    The stats Parameters
--
-- @return   table     Error or the data recevied from the elasticsearch server
-------------------------------------------------------------------------------
function Nodes:shutdown(params)
  return self:requestEndpoint("Shutdown", params)
end

-------------------------------------------------------------------------------
-- Returns an instance of Nodes class
-------------------------------------------------------------------------------
function Nodes:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return Nodes