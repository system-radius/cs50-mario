StateMachine = Class{}

--[[
  Initialize the state machine with an empty state, so that the update
  and draw methods in main will not malfunction.
]]
function StateMachine:init(states)
  self.empty = {
    render = function() end,
    update = function() end,
    enter = function() end,
    exit = function() end
  }

  self.states = states or {}
  self.current = self.empty

end

--[[
  Change the current state for another, with the accompanying parameters.
]]
function StateMachine:change(stateName, enterParams)

  -- Assert if the state exists
  assert(self.states[stateName])

  self.current:exit()
  self.current = self.states[stateName]()
  self.current:enter(enterParams)

end

--[[
  Update the current state.
]]
function StateMachine:update(dt)
  self.current:update(dt)
end

--[[
  Render the current state.
]]
function StateMachine:render()
  self.current:render()
end