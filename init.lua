-- Este archivo es la configuración del hammerspoon

leader = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(leader, "R", function() hs.reload() end)

-- remove window movement animation
hs.window.animationDuration = 0

functions = {
  left = function(frame, max)
      frame.w = max.w / 2
      return frame
  end,
  right = function(frame, max)
      frame.x = max.x + (max.w / 2)
      frame.w = max.w / 2
      return frame
  end,
  top = function(frame, max, frameCopy)
      frame.x = frameCopy.x
      frame.w = frameCopy.w
      frame.h = max.h / 2
      return frame
  end,
  bottom = function(frame, max, frameCopy)
      frame.x = frameCopy.x
      frame.w = frameCopy.w
      frame.y = max.y + (max.h / 2)
      frame.h = max.h / 2
      return frame
  end,
  oneThirdLeft = function(frame, max)
      frame.w = max.w / 3
      return frame
  end,
  twoThirdsRight = function(frame, max)
      frame.x = max.x + (max.w / 3)
      frame.w = (max.w / 3) * 2
      return frame
  end,
  center = function(frame, max)
      frame.x = max.x + (max.w / 8) * 2
      frame.y = max.y + (max.h / 8) * 1
      frame.w = (max.w / 8) * 4
      frame.h = (max.h / 3) * 2
      return frame
  end,
  maximize = function(frame) return frame end
}

function resizer (action)
  return function ()
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()
    local frameCopy = window:frame()
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h
    window:setFrame(functions[action](frame, max, frameCopy))
  end
end

hs.fnutils.each({
  { key = "Left", action = "left" },
  { key = "pad4", action = "left" },
  { key = "Right", action = "right" },
  { key = "pad6", action = "right" },
  { key = "Up", action = "top" },
  { key = "pad8", action = "top" },
  { key = "Down", action = "bottom" },
  { key = "pad2", action = "bottom" },
  { key = "pad1", action = "oneThirdLeft" },
  { key = "pad3", action = "twoThirdsRight" },
  { key = "\\", action = "center" },
  { key = "pad5", action = "center" },
  { key = "RETURN", action = "maximize" },
  { key = "pad0", action = "maximize" }
}, function(obj)
  hs.hotkey.bind(leader, obj.key, resizer(obj.action))
end)

hs.alert.show("Bienvenido, Zero")
