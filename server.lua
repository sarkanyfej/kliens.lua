function respc(_ARG_0_)
  return _ARG_0_
end
engineReplaceModel(engineLoadDFF("files/wheel_o_fortune.dff"), 1895)
addEventHandler("onClientElementStreamIn", getRootElement(), function()
  if getElementData(source, "fortunePos") then
    if isElement(_UPVALUE0_[source]) then
      destroyElement(_UPVALUE0_[source])
    end
    _UPVALUE0_[source] = nil
    _UPVALUE0_[source] = createObject(1898, unpack(getElementData(source, "fortunePos")) + rotateAround(unpack(getElementData(source, "fortunePos"))), unpack(getElementData(source, "fortunePos")) + rotateAround(unpack(getElementData(source, "fortunePos"))), unpack(getElementData(source, "fortunePos")) + 2.2, 0, 0, unpack(getElementData(source, "fortunePos")))
    setElementInterior(_UPVALUE0_[source], getElementInterior(source))
    setElementDimension(_UPVALUE0_[source], getElementDimension(source))
  end
end)
addEventHandler("onClientElementDataChange", getRootElement(), function(_ARG_0_)
  if source == localPlayer and _ARG_0_ == "playerUsingFortune" and not getElementData(localPlayer, "playerUsingFortune") and _UPVALUE0_ then
    closeTheTable()
  end
  if _ARG_0_ == "fortunePos" and getElementData(source, "fortunePos") then
    if isElement(_UPVALUE1_[source]) then
      destroyElement(_UPVALUE1_[source])
    end
    _UPVALUE1_[source] = nil
    _UPVALUE1_[source] = createObject(1898, unpack(getElementData(source, "fortunePos")) + rotateAround(unpack(getElementData(source, "fortunePos"))), unpack(getElementData(source, "fortunePos")) + rotateAround(unpack(getElementData(source, "fortunePos"))), unpack(getElementData(source, "fortunePos")) + 2.2, 0, 0, unpack(getElementData(source, "fortunePos")))
    setElementInterior(_UPVALUE1_[source], getElementInterior(source))
    setElementDimension(_UPVALUE1_[source], getElementDimension(source))
  end
end)
addEventHandler("onClientElementDestroy", getRootElement(), function()
  if getElementData(source, "fortunePos") then
    if isElement(_UPVALUE0_[source]) then
      destroyElement(_UPVALUE0_[source])
    end
    _UPVALUE0_[source] = nil
  end
end)
addEventHandler("onClientElementStreamOut", getRootElement(), function()
  if getElementData(source, "fortunePos") then
    if isElement(_UPVALUE0_[source]) then
      destroyElement(_UPVALUE0_[source])
    end
    _UPVALUE0_[source] = nil
  end
end)
addEventHandler("onClientRender", getRootElement(), function()
  for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
    _UPVALUE1_[_FORV_4_] = (_UPVALUE1_[_FORV_4_] or 0) + math.abs(getElementRotation(_FORV_3_) - (_UPVALUE2_[_FORV_4_] or 0))
    _UPVALUE2_[_FORV_4_] = getElementRotation(_FORV_3_)
    if _UPVALUE1_[_FORV_4_] > 4 then
      _UPVALUE1_[_FORV_4_] = 0
      setElementInterior(playSound3D("files/wheel.mp3", getElementPosition(_FORV_4_)), getElementInterior(_FORV_4_))
      setElementDimension(playSound3D("files/wheel.mp3", getElementPosition(_FORV_4_)), getElementDimension(_FORV_4_))
    end
    if _UPVALUE1_[_FORV_4_] > 1 then
      setElementRotation(_FORV_4_, 0, -(_UPVALUE1_[_FORV_4_] - 1) / 3 * -10, getElementRotation(_FORV_3_))
    end
  end
end)
addEventHandler("onClientElementDataChange", localPlayer, function(_ARG_0_)
  if _ARG_0_ == "char.slotCoins" then
    _UPVALUE0_ = getElementData(source, "char.slotCoins")
  end
end)
addEvent("openFortuneWheel", true)
addEventHandler("openFortuneWheel", getRootElement(), function(_ARG_0_, _ARG_1_)
  Roboto = dxCreateFont("files/Roboto.ttf", 14, false, "antialiased")
  gtaFont = dxCreateFont("files/gtaFont.ttf", 20, false, "antialiased")
  tooltipFont = dxCreateFont("files/Roboto.ttf", 18, false, "antialiased")
  _UPVALUE0_ = _ARG_1_
  addEventHandler("onClientRender", getRootElement(), fortuneWheel)
  theX, theY = _UPVALUE1_ / 2, _UPVALUE2_ / 2
  _UPVALUE3_ = 0
end)
function closeTheTable(_ARG_0_)
  triggerServerEvent("closeTheWheel", localPlayer, _UPVALUE0_, _ARG_0_)
  removeEventHandler("onClientRender", getRootElement(), fortuneWheel)
  if isElement(Roboto) then
    destroyElement(Roboto)
  end
  if isElement(gtaFont) then
    destroyElement(gtaFont)
  end
  if isElement(tooltipFont) then
    destroyElement(tooltipFont)
  end
  _UPVALUE0_ = nil
  _UPVALUE1_ = 0
  _UPVALUE2_ = 0
  _UPVALUE3_ = {}
  _UPVALUE4_ = {}
  exitingProcessStarted = false
end
;({})[0] = {
  [0] = "x20",
  [1] = "x10"
}
;({})[1] = {
  [0] = "x5",
  [1] = "x2"
}
;({})[2] = {
  [0] = "x1",
  [1] = "\226\152\133 x40"
}
;({})[0] = {
  [0] = 20,
  [1] = 10
}
;({})[1] = {
  [0] = 5,
  [1] = 2
}
;({})[2] = {
  [0] = 1,
  [1] = 40
}
function showTooltip(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_2_ = tostring(_ARG_2_)
  if _ARG_3_ then
    _ARG_3_ = tostring(_ARG_3_)
  else
    return
  end
  if _ARG_3_ then
    _ARG_2_ = "#7cc576" .. _ARG_2_ .. [[

#ffffff]] .. _ARG_3_
  end
  _ARG_0_ = math.max(10, math.min(_ARG_0_, _UPVALUE0_ - math.max(dxGetTextWidth(_ARG_2_, 1, "clear", true) + 20, dxGetTextWidth(_ARG_3_, 1, "clear", true) + 20) - 10))
  _ARG_1_ = math.max(10, math.min(_ARG_1_, _UPVALUE1_ - math.max(dxGetTextWidth(_ARG_2_, 1, "clear", true) + 20, dxGetTextWidth(_ARG_3_, 1, "clear", true) + 20) - 10))
  dxDrawRectangle(_ARG_0_, _ARG_1_, math.max(dxGetTextWidth(_ARG_2_, 1, "clear", true) + 20, dxGetTextWidth(_ARG_3_, 1, "clear", true) + 20), 10 * (5 + string.gsub(_ARG_3_, "\n", "")), _UPVALUE2_, true)
  dxDrawText(_ARG_2_, _ARG_0_, _ARG_1_, _ARG_0_ + math.max(dxGetTextWidth(_ARG_2_, 1, "clear", true) + 20, dxGetTextWidth(_ARG_3_, 1, "clear", true) + 20), _ARG_1_ + 10 * (5 + string.gsub(_ARG_3_, "\n", "")), _UPVALUE3_, 0.5, tooltipFont, "center", "center", false, false, true, true)
end
addEvent("onFortuneBetPlaced", true)
addEventHandler("onFortuneBetPlaced", getRootElement(), function(_ARG_0_, _ARG_1_, _ARG_2_)
  _UPVALUE0_ = _UPVALUE0_ + _ARG_2_
  _UPVALUE1_[_ARG_0_ .. "," .. _ARG_1_] = (_UPVALUE1_[_ARG_0_ .. "," .. _ARG_1_] or 0) + _ARG_2_
end)
function fortuneWheel()
  if getCursorPosition() and (exitingProcessStarted or getCursorPosition() * _UPVALUE0_ >= theX + respc(150) - 25 and getCursorPosition() * _UPVALUE0_ <= theX + respc(150) - 5 and getCursorPosition() * _UPVALUE1_ >= theY - 150 - 4 and getCursorPosition() * _UPVALUE1_ <= theY - 150 + 26) and not exitingProcessStarted and getKeyState("mouse1") then
    if _UPVALUE2_ > 0 then
      if not cantNotiState then
        cantNotiState = true
        exports.lv_accounts:showInfo("e", "El�bb p�rgess, vagy vedd le a t�tjeidet!")
      elseif not getKeyState("mouse1") then
        cantNotiState = false
      end
    else
      cantNotiState = false
      exitingProcessStarted = true
      closeTheTable()
      return
    end
  end
  dxDrawRectangle(theX - respc(150), theY - 150 - 4, 300, 308, tocolor(0, 0, 0, 150))
  dxDrawRectangle(theX - respc(150), theY - 150 - 4, 300, 30, tocolor(0, 0, 0, 75))
  if getCursorPosition() * _UPVALUE0_ then
    if getKeyState("mouse1") then
      if getCursorPosition() * _UPVALUE0_ >= theX - respc(150) and getCursorPosition() * _UPVALUE0_ <= theX + respc(150) and getCursorPosition() * _UPVALUE1_ >= theY - 150 - 4 and getCursorPosition() * _UPVALUE1_ <= theY - 150 - 4 + 30 and not draggingWindows then
        draggingWindows = {
          getCursorPosition() * _UPVALUE0_,
          getCursorPosition() * _UPVALUE1_,
          theX,
          theY
        }
      end
      if draggingWindows then
        theX = getCursorPosition() * _UPVALUE0_ - draggingWindows[1] + draggingWindows[3]
        theY = getCursorPosition() * _UPVALUE1_ - draggingWindows[2] + draggingWindows[4]
      end
    else
      draggingWindows = false
    end
  else
    draggingWindows = false
  end
  if getCursorPosition() then
  else
  end
  for _FORV_8_ = 0, 2 do
    for _FORV_12_ = 0, 1 do
      dxDrawRectangle(theX - 146 + _FORV_8_ * 97.33333333333333 + 4, theY - 160 + 30 + _FORV_12_ * 160 / 2 + 4, 89.33333333333333, 72, tocolor(124, 197, 118, 200))
      dxDrawText(_UPVALUE3_[_FORV_8_][_FORV_12_], math.floor(theX - 146 + _FORV_8_ * 97.33333333333333) - 1, math.floor(theY - 160 + 30 + _FORV_12_ * 160 / 2) + 1, math.floor(theX - 146 + (_FORV_8_ + 1) * 97.33333333333333) - 1, math.floor(theY - 160 + 30 + (_FORV_12_ + 1) * 160 / 2) + 1, tocolor(0, 0, 0), 0.9, gtaFont, "center", "center", false, false, false, true)
      dxDrawText(_UPVALUE3_[_FORV_8_][_FORV_12_], math.floor(theX - 146 + _FORV_8_ * 97.33333333333333) + 1, math.floor(theY - 160 + 30 + _FORV_12_ * 160 / 2) - 1, math.floor(theX - 146 + (_FORV_8_ + 1) * 97.33333333333333) + 1, math.floor(theY - 160 + 30 + (_FORV_12_ + 1) * 160 / 2) - 1, tocolor(0, 0, 0), 0.9, gtaFont, "center", "center", false, false, false, true)
      dxDrawText(_UPVALUE3_[_FORV_8_][_FORV_12_], math.floor(theX - 146 + _FORV_8_ * 97.33333333333333) - 1, math.floor(theY - 160 + 30 + _FORV_12_ * 160 / 2) - 1, math.floor(theX - 146 + (_FORV_8_ + 1) * 97.33333333333333) - 1, math.floor(theY - 160 + 30 + (_FORV_12_ + 1) * 160 / 2) - 1, tocolor(0, 0, 0), 0.9, gtaFont, "center", "center", false, false, false, true)
      dxDrawText(_UPVALUE3_[_FORV_8_][_FORV_12_], math.floor(theX - 146 + _FORV_8_ * 97.33333333333333) + 1, math.floor(theY - 160 + 30 + _FORV_12_ * 160 / 2) + 1, math.floor(theX - 146 + (_FORV_8_ + 1) * 97.33333333333333) + 1, math.floor(theY - 160 + 30 + (_FORV_12_ + 1) * 160 / 2) + 1, tocolor(0, 0, 0), 0.9, gtaFont, "center", "center", false, false, false, true)
      dxDrawText(_UPVALUE3_[_FORV_8_][_FORV_12_], math.floor(theX - 146 + _FORV_8_ * 97.33333333333333), math.floor(theY - 160 + 30 + _FORV_12_ * 160 / 2), math.floor(theX - 146 + (_FORV_8_ + 1) * 97.33333333333333), math.floor(theY - 160 + 30 + (_FORV_12_ + 1) * 160 / 2), tocolor(255, 255, 255), 0.9, gtaFont, "center", "center", false, false, false, true)
      if _UPVALUE4_[_FORV_8_ .. "," .. _FORV_12_] then
        dxDrawImage(theX - 146 + _FORV_8_ * 97.33333333333333 + 4 + 44.666666666666664 - 12, theY - 160 + 30 + _FORV_12_ * 160 / 2 + 4 + 18 - 12, 24, 24, "files/chips/" .. _UPVALUE4_[_FORV_8_ .. "," .. _FORV_12_] .. ".png")
        if 0 >= theX - 146 + _FORV_8_ * 97.33333333333333 + 4 + 44.666666666666664 - 12 and 0 >= theY - 160 + 30 + _FORV_12_ * 160 / 2 + 4 + 18 - 12 and 0 <= theX - 146 + _FORV_8_ * 97.33333333333333 + 4 + 44.666666666666664 + 12 and 0 <= theY - 160 + 30 + _FORV_12_ * 160 / 2 + 4 + 18 + 12 then
          if _UPVALUE5_ and _UPVALUE6_[_FORV_8_ .. "," .. _FORV_12_] and _UPVALUE6_[_FORV_8_ .. "," .. _FORV_12_] + _UPVALUE5_ > 10000 then
          else
            showTooltip(0, 0, _UPVALUE3_[_FORV_8_][_FORV_12_], "T�ted: " .. (_UPVALUE6_[_FORV_8_ .. "," .. _FORV_12_] or 0) .. " SSC")
          end
          if getKeyState("mouse2") then
            if 0 < (_UPVALUE6_[_FORV_8_ .. "," .. _FORV_12_] or 0) then
              _UPVALUE2_ = _UPVALUE2_ - _UPVALUE6_[_FORV_8_ .. "," .. _FORV_12_]
              _UPVALUE6_[_FORV_8_ .. "," .. _FORV_12_] = 0
              _UPVALUE4_[_FORV_8_ .. "," .. _FORV_12_] = false
              triggerServerEvent("onRemoveFortuneBet", localPlayer, _UPVALUE7_, _FORV_8_, _FORV_12_)
            end
          end
        end
      end
      if _UPVALUE5_ > 0 and 0 >= theX - 146 + _FORV_8_ * 97.33333333333333 and 0 >= theY - 160 + 30 + _FORV_12_ * 160 / 2 and 0 <= theX - 146 + (_FORV_8_ + 1) * 97.33333333333333 and 0 <= theY - 160 + 30 + (_FORV_12_ + 1) * 160 / 2 then
        if _UPVALUE5_ then
          if (_UPVALUE6_[_FORV_8_ .. "," .. _FORV_12_] or 0) + _UPVALUE5_ > 10000 then
            showTooltip(0, 0, _UPVALUE3_[_FORV_8_][_FORV_12_], "Maximum 10000 SSC lehet a t�t.")
          end
        elseif not getKeyState("mouse1") then
          triggerServerEvent("onPlaceFortuneCoin", localPlayer, _UPVALUE5_, _UPVALUE7_, _FORV_8_, _FORV_12_, getElementsByType("player", getRootElement(), true), _UPVALUE8_[_FORV_8_][_FORV_12_])
          _UPVALUE9_ = getTickCount()
          _UPVALUE4_[_FORV_8_ .. "," .. _FORV_12_] = _UPVALUE5_
          _UPVALUE5_ = 0
        end
      end
    end
  end
  dxDrawText("#7cc576See#ffffffMTA - Szerencseker�k", theX - respc(150) + 5, theY - 150 - 4, 0, theY - 150 - 4 + 30, tocolor(255, 255, 255), 1, Roboto, "left", "center", false, false, false, true)
  dxDrawText("x", 0, theY - 150 - 4, theX + respc(150) - 5, theY - 150 - 4 + 30, tocolor(215, 89, 89, 200), 1, Roboto, "right", "center", false, false, false, true)
  if 0 >= theX - 142 and 0 >= theY + 160 - 130 + 8 and 0 <= theX - 142 + 284 and 0 <= theY + 160 - 130 + 8 + 50 - 16 and _UPVALUE2_ > 0 and _UPVALUE5_ < 1 and getTickCount() - _UPVALUE9_ > 2000 then
    if not exitingProcessStarted and getKeyState("mouse1") then
      cantNotiState = false
      exitingProcessStarted = true
      closeTheTable(true)
      return
    end
  end
  dxDrawRectangle(theX - 142, theY + 160 - 130 + 8, 284, 34, tocolor(124, 197, 118, 225))
  dxDrawText("P�rget�s", theX - 150, theY + 160 - 130, theX + 150, theY + 160 - 80, tocolor(0, 0, 0), 0.85, Roboto, "center", "center", false, false, false, true)
  dxDrawText("#7cc576" .. _UPVALUE10_ .. " #ffffffSSC", theX - 150, theY + 150 - 80, theX + 150, theY + 150 - 32, tocolor(255, 255, 255), 0.9, gtaFont, "center", "center", false, false, false, true)
  dxDrawImage(math.floor(theX - 96), math.floor(theY + respc(150) - respc(32)), respc(24), respc(24), "files/chips/1.png", 0, 0, 0, tocolor(255, 255, 255, 120))
  dxDrawImage(math.floor(theX - 96 + respc(32)), math.floor(theY + respc(150) - respc(32)), respc(24), respc(24), "files/chips/5.png", 0, 0, 0, tocolor(255, 255, 255, 120))
  dxDrawImage(math.floor(theX - 96 + respc(64)), math.floor(theY + respc(150) - respc(32)), respc(24), respc(24), "files/chips/25.png", 0, 0, 0, tocolor(255, 255, 255, 120))
  dxDrawImage(math.floor(theX - 96 + respc(96)), math.floor(theY + respc(150) - respc(32)), respc(24), respc(24), "files/chips/50.png", 0, 0, 0, tocolor(255, 255, 255, 120))
  dxDrawImage(math.floor(theX - 96 + respc(128)), math.floor(theY + respc(150) - respc(32)), respc(24), respc(24), "files/chips/100.png", 0, 0, 0, tocolor(255, 255, 255, 120))
  dxDrawImage(math.floor(theX - 96 + respc(160)), math.floor(theY + respc(150) - respc(32)), respc(24), respc(24), "files/chips/500.png", 0, 0, 0, tocolor(255, 255, 255, 120))
  if _UPVALUE5_ > 0 then
    dxDrawImage(0 - 12, 0 - 12, 24, 24, "files/chips/" .. _UPVALUE5_ .. ".png")
  end
  if _UPVALUE5_ > 0 and not getKeyState("mouse1") then
    _UPVALUE5_ = 0
  end
  if 0 and getTickCount() - _UPVALUE11_ > 1000 then
    if 0 >= theX - 96 and 0 >= theY + respc(150) - respc(32) and 0 <= theX - 96 + respc(24) and 0 <= theY + respc(174) - respc(32) and getKeyState("mouse1") and _UPVALUE10_ >= 1 then
      _UPVALUE5_ = 1
      _UPVALUE11_ = getTickCount()
    end
    if 0 >= theX - 96 + respc(32) and 0 >= theY + respc(150) - respc(32) and 0 <= theX - 96 + respc(56) and 0 <= theY + respc(174) - respc(32) and getKeyState("mouse1") and _UPVALUE10_ >= 5 then
      _UPVALUE5_ = 5
      _UPVALUE11_ = getTickCount()
    end
    if 0 >= theX - 96 + respc(64) and 0 >= theY + respc(150) - respc(32) and 0 <= theX - 96 + respc(88) and 0 <= theY + respc(174) - respc(32) and getKeyState("mouse1") and _UPVALUE10_ >= 25 then
      _UPVALUE5_ = 25
      _UPVALUE11_ = getTickCount()
    end
    if 0 >= theX - 96 + respc(96) and 0 >= theY + respc(150) - respc(32) and 0 <= theX - 96 + respc(120) and 0 <= theY + respc(174) - respc(32) and getKeyState("mouse1") and _UPVALUE10_ >= 50 then
      _UPVALUE5_ = 50
      _UPVALUE11_ = getTickCount()
    end
    if 0 >= theX - 96 + respc(128) and 0 >= theY + respc(150) - respc(32) and 0 <= theX - 96 + respc(152) and 0 <= theY + respc(174) - respc(32) and getKeyState("mouse1") and _UPVALUE10_ >= 100 then
      _UPVALUE5_ = 100
      _UPVALUE11_ = getTickCount()
    end
    if 0 >= theX - 96 + respc(160) and 0 >= theY + respc(150) - respc(32) and 0 <= theX - 96 + respc(184) and 0 <= theY + respc(174) - respc(32) and getKeyState("mouse1") and _UPVALUE10_ >= 500 then
      _UPVALUE5_ = 500
      _UPVALUE11_ = getTickCount()
    end
  end
end
function roulettePlaceRender()
  setElementPosition(_UPVALUE0_, getElementPosition(localPlayer))
  setElementRotation(_UPVALUE0_, 0, 0, math.floor(getElementRotation(localPlayer) / 5) * 5)
end
addCommandHandler("createwheel", function()
  if getElementData(localPlayer, "acc.adminLevel") >= 9 then
    if _UPVALUE0_ then
      removeEventHandler("onClientRender", getRootElement(), roulettePlaceRender)
      triggerServerEvent("placeFortuneWheel", localPlayer, getElementPosition(_UPVALUE0_))
      if isElement(_UPVALUE0_) then
        destroyElement(_UPVALUE0_)
      end
      _UPVALUE0_ = nil
    else
      _UPVALUE0_ = createObject(1896, 0, 0, 0)
      setElementCollisionsEnabled(_UPVALUE0_, false)
      setElementAlpha(_UPVALUE0_, 175)
      setElementInterior(_UPVALUE0_, getElementInterior(localPlayer))
      setElementDimension(_UPVALUE0_, getElementDimension(localPlayer))
      addEventHandler("onClientRender", getRootElement(), roulettePlaceRender)
    end
  end
end)
addCommandHandler("nearbywheels", function()
  if getElementData(localPlayer, "acc.adminLevel") and getElementData(localPlayer, "acc.adminLevel") >= 9 then
    outputChatBox("#7cc576------[K�zeledben l�v� kerekek]------", 255, 255, 255, true)
    for _FORV_7_ = 1, #getElementsByType("object", getRootElement(), true) do
      if getElementData(getElementsByType("object", getRootElement(), true)[_FORV_7_], "fortuneTable") then
        outputChatBox("  #" .. getElementData(getElementsByType("object", getRootElement(), true)[_FORV_7_], "fortuneTable") .. " T�vols�g:#32b3ef " .. math.floor(getDistanceBetweenPoints3D(getElementPosition(localPlayer)) * 1000) / 1000, 255, 255, 255, true)
      end
    end
  end
end)
