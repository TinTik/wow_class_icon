
--/run print((select(4, GetBuildInfo())))

local frame, events = CreateFrame("Frame", "MySpecIcon"), {};
frame:SetFrameStrata("BACKGROUND")
frame:SetWidth(16) -- Set these to whatever height/width is needed 
frame:SetHeight(16) -- for your Texture
local t = frame:CreateTexture(nil,"BACKGROUND")


function events:PLAYER_ENTERING_WORLD(...)
    local currentSpec = GetSpecialization()
    local id, currentSpecName, description, currentSpecIcon, background, role = GetSpecializationInfo(currentSpec)
    print("Your current spec:", currentSpecName, currentSpecIcon)
    t:SetTexture(currentSpecIcon)
    t:SetAllPoints(frame)
    frame.texture = t

    frame:SetPoint("CENTER", -180, -250)
    frame:Show()
    print("Hello World! Hello PLAYER_ENTERING_WORLD");
end

function events:CINEMATIC_START(...)
    print("Hello CINEMATIC_START");
    frame:Hide()
end

function events:CINEMATIC_STOP(...)
    print("Hello CINEMATIC_STOP");
    frame:Show()
end


function events:ACTIVE_TALENT_GROUP_CHANGED(...)
    local currentSpec = GetSpecialization()
    local id, currentSpecName, description, currentSpecIcon, background, role = GetSpecializationInfo(currentSpec)
    print("Your current spec:", currentSpecName, currentSpecIcon)
    frame:Hide()
    t:SetTexture(currentSpecIcon)
    t:SetAllPoints(frame)
    frame.texture = t

    --frame:SetPoint("CENTER", -180, -250)
    frame:Show()
    print("Hello ACTIVE_TALENT_GROUP_CHANGED");
end

frame:SetScript("OnEvent", function(self, event, ...)
 events[event](self, ...); -- call one of the functions above
end);

for k, v in pairs(events) do
 frame:RegisterEvent(k); -- Register all events for which handlers have been defined
end



