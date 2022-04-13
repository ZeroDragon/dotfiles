leader = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(leader, "R", function() hs.reload() end)

-- remove window movement animation
hs.window.animationDuration = 0

-- windows placement
-- coordinates are x from left to right and y from top to bottom

function resizer (action)
  return function ()
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()
    -- Default = maximze
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h
    if (action == "left") then
      frame = left(frame, max)
    elseif (action == "right") then
      frame = right(frame, max)
    elseif (action == "top") then
      frame = top(frame, max)
    elseif (action == "bottom") then
      frame = bottom(frame, max)
    elseif (action == "1/3l") then
      frame = onethirdleft(frame, max)
    elseif (action == "2/3r") then
      frame = twothirdsright(frame, max)
    elseif (action == "center") then
      frame = center(frame, max)
    end
    window:setFrame(frame)
  end
end

-- put to left
function left (frame, max)
    frame.w = max.w / 2
    return frame
end

-- put to right
function right (frame, max)
    frame.x = max.x + (max.w / 2)
    frame.w = max.w / 2
    return frame
end

-- put to top
function top (frame, max)
    frame.y = max.y - (max.h / 2)
    frame.h = max.h / 2
    return frame
end

-- put to bottom
function bottom (frame, max)
    frame.y = max.y + (max.h / 2)
    frame.h = max.h / 2
    return frame
end

-- put 1/3 left
function onethirdleft (frame, max)
    frame.w = max.w / 3
    return frame
end

-- put 3/3 right
function twothirdsright (frame, max)
    frame.x = max.x + (max.w / 3)
    frame.w = (max.w / 3) * 2
    return frame
end

-- center frame
function center (frame, max)
    frame.x = max.x + (max.w / 8) * 2
    frame.y = max.y + (max.h / 8) * 1
    frame.w = (max.w / 8) * 4
    frame.h = (max.h / 3) * 2
    return frame
end

hs.alert.show("Bienvenido, Zero")
hs.hotkey.bind(leader, "pad4", resizer("left"))
hs.hotkey.bind(leader, "Left", resizer("left"))
hs.hotkey.bind(leader, "pad6", resizer("right"))
hs.hotkey.bind(leader, "Right", resizer("right"))
hs.hotkey.bind(leader, "pad8", resizer("top"))
hs.hotkey.bind(leader, "Up", resizer("top"))
hs.hotkey.bind(leader, "pad2", resizer("bottom"))
hs.hotkey.bind(leader, "Down", resizer("bottom"))
hs.hotkey.bind(leader, "pad1", resizer("1/3l"))
hs.hotkey.bind(leader, "pad3", resizer("2/3r"))
hs.hotkey.bind(leader, "\\", resizer("center"))
hs.hotkey.bind(leader, "pad5", resizer("center"))
hs.hotkey.bind(leader, "RETURN", resizer("maximize"))
