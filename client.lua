function addEvent(_ARG_0_, _ARG_1_)
  return _UPVALUE0_("bball2:" .. _ARG_0_, _ARG_1_)
end
function addEventHandler(_ARG_0_, _ARG_1_, _ARG_2_)
  return _UPVALUE0_("bball2:" .. _ARG_0_, _ARG_1_, _ARG_2_)
end
function getElementData(_ARG_0_, _ARG_1_)
  return _UPVALUE0_(_ARG_0_, "bball2:" .. _ARG_1_)
end
function setElementData(_ARG_0_, _ARG_1_, _ARG_2_)
  return _UPVALUE0_(_ARG_0_, "bball2:" .. _ARG_1_, _ARG_2_)
end
function triggerServerEvent(_ARG_0_, _ARG_1_, ...)
  return _UPVALUE0_("bball2:" .. _ARG_0_, _ARG_1_, ...)
end
function movement(_ARG_0_, _ARG_1_)
  if getElementData(localPlayer, "ownsTheBall") then
    triggerServerEvent("setBBALLAnim", localPlayer, _ARG_1_)
  end
  if _ARG_1_ == "up" then
    _UPVALUE0_ = false
  else
    _UPVALUE0_ = true
  end
end
bindKey("forwards", "both", movement)
bindKey("backwards", "both", movement)
bindKey("left", "both", movement)
bindKey("right", "both", movement)
bindKey("sprint", "both", function(_ARG_0_, _ARG_1_)
  if getElementData(localPlayer, "ownsTheBall") and (getControlState("forwards") or getControlState("backwards") or getControlState("left") or getControlState("right")) then
    triggerServerEvent("setBBALLAnim", localPlayer, false, _ARG_1_)
  end
end)
setGameSpeed(1)
setObjectScale(createObject(1946, 2496.1904296875, 1295.96484375, 9.85 + 0.1), 0.5)
setElementFrozen(createObject(1946, 2496.1904296875, 1295.96484375, 9.85 + 0.1), true)
addEventHandler("onClientPlayerWasted", getRootElement(), function()
  if source == localPlayer and getElementData(source, "ownsTheBall") then
    setTimer(function()
      triggerServerEvent("stopAnim", localPlayer, _UPVALUE0_)
      setElementData(localPlayer, "ownsTheBall", false)
      setElementData(localPlayer, "placesBall", not getElementData(localPlayer, "placesBall"))
      triggerServerEvent("ballPosSet", localPlayer, getElementPosition(_UPVALUE1_))
    end, 1000, 1)
    _UPVALUE2_ = false
    setTimer(function()
      _UPVALUE0_ = true
    end, 1000, 1)
    toggleControl("fire", true)
    toggleControl("aim_weapon", true)
    toggleControl("walk", true)
    toggleControl("enter_exit", true)
    toggleControl("crouch", true)
    toggleControl("jump", true)
    triggerServerEvent("pickupAnim", localPlayer)
  end
end)
bindKey("q", "both", function(_ARG_0_, _ARG_1_)
  if isElementWithinColShape(localPlayer, _UPVALUE0_) and _ARG_1_ == "up" and not _UPVALUE1_ and _UPVALUE2_ and not _UPVALUE3_ then
    setElementFrozen(_UPVALUE4_, false)
    if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) <= 1 then
      setTimer(function()
        setElementData(localPlayer, "ownsTheBall", false)
        setElementData(localPlayer, "ownsTheBall", true)
        _UPVALUE0_ = true
        triggerServerEvent("setBBALLAnim", localPlayer, "up")
      end, 1000, 1)
      _UPVALUE2_ = false
      setTimer(function()
        _UPVALUE0_ = true
      end, 1000, 1)
      triggerServerEvent("pickupAnim", localPlayer)
    end
  end
  if isElementWithinColShape(localPlayer, _UPVALUE0_) and _ARG_1_ == "up" and _UPVALUE5_ == localPlayer and _UPVALUE1_ and _UPVALUE2_ then
    setTimer(function()
      triggerServerEvent("stopAnim", localPlayer, _UPVALUE0_)
      setElementData(localPlayer, "ownsTheBall", false)
      setElementData(localPlayer, "placesBall", not getElementData(localPlayer, "placesBall"))
      triggerServerEvent("ballPosSet", localPlayer, getElementPosition(_UPVALUE1_))
    end, 1000, 1)
    _UPVALUE2_ = false
    setTimer(function()
      _UPVALUE0_ = true
    end, 1000, 1)
    toggleControl("fire", true)
    toggleControl("aim_weapon", true)
    toggleControl("walk", true)
    toggleControl("enter_exit", true)
    toggleControl("crouch", true)
    toggleControl("jump", true)
    triggerServerEvent("pickupAnim", localPlayer)
  end
end)
bindKey("f", "down", function(_ARG_0_, _ARG_1_)
  if isElementWithinColShape(localPlayer, _UPVALUE0_) and _UPVALUE1_ ~= localPlayer and _UPVALUE2_ and isElement(_UPVALUE1_) then
    triggerServerEvent("stealAnim", localPlayer)
    _UPVALUE2_ = false
    setTimer(function()
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < 1 then
        triggerServerEvent("throwSuccess", localPlayer, _UPVALUE1_)
        triggerServerEvent("setBBALLAnim", localPlayer, "up")
        triggerServerEvent("stopAnim", localPlayer, _UPVALUE1_)
        setElementData(_UPVALUE1_, "ownsTheBall", false)
        setElementData(localPlayer, "ownsTheBall", true)
        _UPVALUE2_ = true
      else
        outputChatBox("#7cc576[SeeMTA - Kosárlabda]:#FFFFFF Túl messze vagy a labdától, próbáld #7cc5765 másodperc#FFFFFF múlva.", 0, 0, 0, true)
        setTimer(function()
          _UPVALUE0_ = true
        end, 5000, 1)
      end
    end, 500, 1)
  end
end)
bindKey("r", "up", function(_ARG_0_, _ARG_1_)
  if isElementWithinColShape(localPlayer, _UPVALUE0_) and _UPVALUE1_ == localPlayer and _UPVALUE2_ and _UPVALUE3_ then
    _UPVALUE2_ = false
    triggerServerEvent("stopAnimPass", localPlayer, localPlayer)
    setElementData(localPlayer, "ownsTheBall", false)
    setTimer(function(_ARG_0_)
      _UPVALUE0_ = true
      triggerServerEvent("passIdle", localPlayer, _ARG_0_)
      setElementData(_ARG_0_, "ownsTheBall", true)
      setElementData(localPlayer, "passTo", false)
    end, 55, 1, _UPVALUE3_)
    setTimer(function(_ARG_0_)
      setElementData(localPlayer, "passTo", _ARG_0_)
    end, 350, 1, _UPVALUE3_)
  end
end)
bindKey("e", "down", function(_ARG_0_, _ARG_1_)
  if not _UPVALUE0_ and _UPVALUE1_ == localPlayer and _UPVALUE2_ and (isElementWithinColShape(localPlayer, _UPVALUE3_) or isElementWithinColShape(localPlayer, _UPVALUE4_)) then
    throwTo = "A"
    if isElementWithinColShape(localPlayer, _UPVALUE4_) then
      throwTo = "B"
    end
    if throwTo == "A" then
      if not (getElementRotation(localPlayer) <= 180) then
        outputChatBox("#7cc576[SeeMTA - Kosárlabda]:#FFFFFF Állj szembe a kosárral!", 0, 0, 0, true)
        return
      end
    elseif throwTo == "B" and not (getElementRotation(localPlayer) >= 180) then
      outputChatBox("#7cc576[SeeMTA - Kosárlabda]:#FFFFFF Állj szembe a kosárral!", 0, 0, 0, true)
      return
    end
    triggerServerEvent("throwStart", localPlayer)
    _UPVALUE5_ = getTickCount()
    setElementData(localPlayer, "throwingBall", true)
    _UPVALUE2_ = false
    _UPVALUE6_ = true
    setTimer(function()
      setElementData(localPlayer, "throwingBall", false)
      _UPVALUE0_ = true
    end, 1500, 1)
    setTimer(function(_ARG_0_)
      if _UPVALUE0_ then
        _UPVALUE0_ = false
        setElementData(localPlayer, "throwRandom", math.random(22000, 22070) / 10)
        setElementData(localPlayer, "failThrowing", true)
        setElementData(localPlayer, "throwTo", false)
        setElementData(localPlayer, "ownsTheBall", false)
        setElementData(localPlayer, "throwTo", _ARG_0_)
      end
    end, 1100, 1, throwTo)
  end
end)
bindKey("e", "up", function(_ARG_0_, _ARG_1_)
  if isElementWithinColShape(localPlayer, _UPVALUE0_) and not _UPVALUE1_ and _UPVALUE2_ == localPlayer and _UPVALUE3_ then
    triggerServerEvent("throwStart", localPlayer)
    _UPVALUE3_ = false
    throwTo = "A"
    if isElementWithinColShape(localPlayer, _UPVALUE4_) then
      throwTo = "B"
    end
    if getTickCount() - _UPVALUE5_ >= 400 and getTickCount() - _UPVALUE5_ < 800 then
    elseif getTickCount() - _UPVALUE5_ == 800 then
    elseif getTickCount() - _UPVALUE5_ >= 800 and getTickCount() - _UPVALUE5_ < 1200 then
    end
    if throwTo == "A" then
    elseif throwTo == "B" then
    end
    setElementData(localPlayer, "throwRandom", math.random(22000, 22070) / 10)
    setElementData(localPlayer, "failThrowing", true)
    setElementData(localPlayer, "throwTo", false)
    setElementData(localPlayer, "ownsTheBall", false)
    setElementData(localPlayer, "throwTo", throwTo)
  end
end)
function getDegreesBetweenPositions(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  dX = _ARG_2_ - _ARG_0_
  dY = _ARG_3_ - _ARG_1_
  angle = math.atan2(dY, dX)
  angle = math.deg(angle) + 180
  return angle
end
bindKey("e", "down", function(_ARG_0_, _ARG_1_)
  if isElementWithinColShape(localPlayer, _UPVALUE0_) and _UPVALUE1_ and _UPVALUE2_ and _UPVALUE3_ == localPlayer and (isElementWithinColShape(localPlayer, _UPVALUE4_) or isElementWithinColShape(localPlayer, _UPVALUE5_)) then
    _UPVALUE1_ = false
    triggerServerEvent("dunkStart", localPlayer, getElementPosition(_UPVALUE5_))
    setElementData(localPlayer, "throwingBall", true)
    setTimer(function()
      setElementData(localPlayer, "throwingBall", false)
      setElementData(localPlayer, "dunkTo", false)
      setElementData(localPlayer, "ownsTheBall", false)
      setElementData(localPlayer, "dunkTo", _UPVALUE0_)
    end, 900, 1)
    setTimer(function()
      _UPVALUE0_ = true
    end, 2000, 1)
  end
end)
addEventHandler("onClientColShapeHit", createColRectangle(1627.7050781255 + 852.87421875, 2190.0986328125 + -919.1826171875, 33.087890625, 26.9580078125), function(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer and _ARG_1_ then
    outputChatBox("#7cc576[SeeMTA - Kosárlabda]: #FFFFFF Használat:", 255, 255, 255, true)
    outputChatBox("    - #7cc576Q#FFFFFF - labda felvétele/lerakása", 255, 255, 255, true)
    outputChatBox("    - #7cc576F#FFFFFF - leszerelés", 255, 255, 255, true)
    outputChatBox("    - #7cc576E (nyova tartva, majd pont a megfelelő időpontban felengedve)#FFFFFF - dobás", 255, 255, 255, true)
    outputChatBox("    - #7cc576E futás közben, a zsák előtt megnyomva#FFFFFF - zsákolás", 255, 255, 255, true)
    outputChatBox("    - #7cc576R (nyomva tartva, célozva, majd felengedve)#FFFFFF - passzolás", 255, 255, 255, true)
  end
end)
addEventHandler("onClientRender", getRootElement(), function()
  dxDrawMaterialLine3D(1643.83215 + _UPVALUE0_, 2211.50635 + _UPVALUE1_, 9.875, 1643.83215 + _UPVALUE0_, 2195.50635 + _UPVALUE1_, 9.875, _UPVALUE2_, 29, tocolor(255, 255, 255, 150), 1643.83215 + _UPVALUE0_, 2197.00635 + _UPVALUE1_, 19.875)
  if _UPVALUE3_ == localPlayer then
    toggleControl("fire", false)
    toggleControl("aim_weapon", false)
    toggleControl("walk", false)
    toggleControl("enter_exit", false)
    toggleControl("crouch", false)
    toggleControl("jump", false)
  end
  if _UPVALUE3_ == localPlayer and not isElementWithinColShape(localPlayer, _UPVALUE4_) then
    triggerServerEvent("stopAnim", localPlayer, _UPVALUE3_)
    setElementData(localPlayer, "ownsTheBall", false)
    setElementData(localPlayer, "placesBall", not getElementData(localPlayer, "placesBall"))
    _UPVALUE3_ = false
    triggerServerEvent("ballPosSet", localPlayer, 1633.9189453125, 2198.40625, _UPVALUE5_ + 0.1)
    toggleControl("fire", true)
    toggleControl("aim_weapon", true)
    toggleControl("walk", true)
    toggleControl("enter_exit", true)
    toggleControl("crouch", true)
    toggleControl("jump", true)
  end
  if _UPVALUE3_ == localPlayer and getKeyState("r") then
    if processLineOfSight(getElementPosition(localPlayer)) and isElement(processLineOfSight(getElementPosition(localPlayer))) then
      if getElementType(processLineOfSight(getElementPosition(localPlayer))) == "player" and isElementWithinColShape(processLineOfSight(getElementPosition(localPlayer))) then
        dxDrawText("[SeeMTA - Kosárlabda] Passzolás neki: " .. getPlayerName(processLineOfSight(getElementPosition(localPlayer))):gsub("_", " ") .. ".", 1, _UPVALUE7_ - 75 - 50 + 1, _UPVALUE6_ + 1, _UPVALUE7_ - 75 + 1, tocolor(0, 0, 0), 0.5, _UPVALUE8_, "center", "center", false, false, false, true)
        dxDrawText("#7cc576[SeeMTA - Kosárlabda] #FFFFFFPasszolás neki: #7cc576" .. getPlayerName(processLineOfSight(getElementPosition(localPlayer))):gsub("_", " ") .. ".", 0, _UPVALUE7_ - 75 - 50, _UPVALUE6_, _UPVALUE7_ - 75, tocolor(255, 255, 255), 0.5, _UPVALUE8_, "center", "center", false, false, false, true)
        _UPVALUE9_ = processLineOfSight(getElementPosition(localPlayer))
      else
        _UPVALUE9_ = false
      end
    else
      _UPVALUE9_ = false
    end
    dxDrawImage(_UPVALUE6_ / 2 - 37.5, _UPVALUE7_ / 2 - 37.5 - 100, 75, 75, "files/pointer.png", 0, 0, 0, (tocolor(255, 150, 0, 255)))
  else
    _UPVALUE9_ = false
  end
  if isElement(_UPVALUE3_) then
    if _UPVALUE11_ then
    end
    if getPedBonePosition(_UPVALUE3_, 25) >= 11 and not soundPlayed then
      playSound3D("files/ball_bounce.mp3", getPedBonePosition(_UPVALUE3_, 25))
      soundPlayed = true
    end
    if getPedBonePosition(_UPVALUE3_, 25) < 11 then
      soundPlayed = false
    end
    setElementPosition(_UPVALUE12_, getPedBonePosition(_UPVALUE3_, 25))
    setElementRotation(_UPVALUE12_, 0, 0, getElementRotation(_UPVALUE3_))
  end
end)
addEventHandler("onClientElementDataChange", getRootElement(), function(_ARG_0_)
  _ARG_0_ = utf8.gsub(_ARG_0_, "bball2:", "")
  if isElementWithinColShape(source, _UPVALUE0_) then
    if _ARG_0_ == "ownsTheBall" then
      if getElementData(source, _ARG_0_) then
        _UPVALUE1_ = source
        _UPVALUE2_ = true
        _UPVALUE3_ = false
      end
    elseif _ARG_0_ == "dunkTo" then
      if getElementData(source, _ARG_0_) then
        _UPVALUE1_ = false
        _UPVALUE2_ = false
        _UPVALUE3_ = false
        if getElementData(source, _ARG_0_) == "A" then
        elseif getElementData(source, _ARG_0_) == "B" then
        end
        playSound3D("files/ball_dunk.mp3", _UPVALUE5_[1], _UPVALUE5_[2], (_UPVALUE4_[3] + _UPVALUE5_[3]) / 2)
        moveObject(_UPVALUE6_, 500, _UPVALUE5_[1], _UPVALUE5_[2], _UPVALUE7_ + 0.1, 0, 0, 0, "Linear")
        if source == localPlayer then
          setTimer(function()
            triggerServerEvent("ballPosSet", localPlayer, getElementPosition(_UPVALUE0_))
          end, 500, 1)
        end
      end
    elseif _ARG_0_ == "throwTo" then
      if getElementData(source, _ARG_0_) then
        _UPVALUE1_ = false
        _UPVALUE2_ = false
        _UPVALUE3_ = false
        if getElementData(source, _ARG_0_) == "A" then
        elseif getElementData(source, _ARG_0_) == "B" then
        end
        if getElementData(source, "failThrowing") then
          if source == localPlayer then
            outputChatBox("#7cc576[SeeMTA - Kosárlabda]:#FFFFFF Sikertelen dobás.", 0, 0, 0, true)
          end
        elseif source == localPlayer then
          outputChatBox("#7cc576[SeeMTA - Kosárlabda]:#FFFFFF Sikeres dobás.", 0, 0, 0, true)
        end
        moveObject(_UPVALUE6_, getDistanceBetweenPoints3D(_UPVALUE5_[1] + 0.5, _UPVALUE5_[2], (_UPVALUE4_[3] + _UPVALUE5_[3]) / 2, getElementPosition(source)) / 2 * 100, _UPVALUE5_[1] + 0.5, _UPVALUE5_[2], (_UPVALUE4_[3] + _UPVALUE5_[3]) / 2, 0, 0, 0, "Linear")
        setTimer(function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
          if _ARG_3_ then
            _ARG_0_, _ARG_1_ = _UPVALUE0_[1] + 4, (getElementData(_ARG_4_, "throwRandom") or 2200) + _UPVALUE1_
            if _ARG_2_ == "B" then
              _ARG_0_ = _UPVALUE2_[1] - 4
            end
          end
          if _ARG_3_ then
          else
            setTimer(function()
              playSound3D("files/ball_bounce.mp3", getElementPosition(_UPVALUE0_))
            end, 900, 1)
          end
          if _ARG_4_ == localPlayer then
            setTimer(function()
              triggerServerEvent("ballPosSet", localPlayer, getElementPosition(_UPVALUE0_))
            end, 900, 1)
          end
          setSoundMaxDistance(playSound3D("files/ball_score.mp3", _ARG_0_, _ARG_1_, _UPVALUE4_ + 0.1), 500)
          moveObject(_UPVALUE3_, 900, _ARG_0_, _ARG_1_, _UPVALUE4_ + 0.1, 0, 0, 0, "Linear")
        end, getDistanceBetweenPoints3D(_UPVALUE5_[1] + 0.5, _UPVALUE5_[2], (_UPVALUE4_[3] + _UPVALUE5_[3]) / 2, getElementPosition(source)) / 2 * 100, 1, _UPVALUE5_[1] + 0.5, _UPVALUE5_[2], getElementData(source, _ARG_0_), getElementData(source, "failThrowing"), source)
      end
    elseif _ARG_0_ == "passTo" then
      if isElement((getElementData(source, _ARG_0_))) then
        _UPVALUE1_ = false
        _UPVALUE3_ = false
        moveObject(_UPVALUE6_, 55, getElementPosition((getElementData(source, _ARG_0_))))
        setTimer(function(_ARG_0_)
          sound = playSound3D("files/ball_passgot.mp3", getElementPosition(_ARG_0_))
          _UPVALUE0_ = _ARG_0_
        end, 55, 1, (getElementData(source, _ARG_0_)))
      end
    elseif _ARG_0_ == "throwingBall" and source == _UPVALUE1_ then
      _UPVALUE3_ = getElementData(source, _ARG_0_)
    elseif _ARG_0_ == "placesBall" then
      _UPVALUE2_ = false
      _UPVALUE1_ = false
      _UPVALUE3_ = false
      setElementPosition(_UPVALUE6_, getElementPosition(source) + (0 + (0 - 0) * math.cos((math.rad(getElementRotation(source)))) - (1 - 0) * math.sin((math.rad(getElementRotation(source))))), getElementPosition(source) + (0 + (0 - 0) * math.sin((math.rad(getElementRotation(source)))) + (1 - 0) * math.cos((math.rad(getElementRotation(source))))), 9.85)
      setElementFrozen(_UPVALUE6_, true)
    end
  end
end)
function ballPosSet(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if tonumber(_ARG_0_) and tonumber(_ARG_1_) and tonumber(_ARG_2_) and (not isElementWithinColShape(localPlayer, _UPVALUE0_) or _ARG_4_) then
    if _ARG_3_ then
      _UPVALUE1_ = false
      _UPVALUE2_ = false
      _UPVALUE3_ = false
    end
    setElementPosition(_UPVALUE4_, _ARG_0_, _ARG_1_, 9.85 + 0.1)
    setElementFrozen(_UPVALUE4_, true)
  end
end
addEvent("ballPosSet", true)
addEventHandler("ballPosSet", getRootElement(), ballPosSet)
function quitPlayer(_ARG_0_)
  if _UPVALUE0_ == source then
    _UPVALUE0_ = false
    _UPVALUE1_ = false
    _UPVALUE2_ = false
    setElementPosition(_UPVALUE3_, getElementPosition(source))
    setElementFrozen(_UPVALUE3_, true)
  end
end
addEventHandler("onClientPlayerQuit", getRootElement(), quitPlayer)
function bballAnimation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_1_ == 1 then
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_walk", 0, true, true, false, true)
  elseif _ARG_1_ == 2 then
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_run", 0, true, true, false, true)
  elseif _ARG_1_ == 3 then
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_idleloop", 0, true, false, false, true)
  elseif _ARG_1_ == 4 then
    setPedAnimation(_ARG_0_, "GANGS", "hndshkaa", 500, false, true, false, false)
    sound = playSound3D("files/ball_passgot.mp3", getElementPosition(_UPVALUE0_))
  elseif _ARG_1_ == 5 then
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_pickup", 1000, false, true, false, false)
    sound = playSound3D("files/ball_passgot.mp3", getElementPosition(_UPVALUE0_))
    _UPVALUE1_ = true
    setTimer(function()
      _UPVALUE0_ = false
    end, 1000, 1)
  elseif _ARG_1_ == 6 then
    setPedAnimation(_ARG_0_, "BIKED", "BIKEd_hit", -1, false, false, true, true)
    setTimer(function(_ARG_0_)
      setPedAnimation(_ARG_0_)
    end, 100, 1, _ARG_0_)
  elseif _ARG_1_ == 7 then
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_Jump_Shot", 300, false, false, false, true)
    setTimer(function(_ARG_0_)
      setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_idleloop", 0, true, false, false, true)
    end, 300, 1, _ARG_0_)
  elseif _ARG_1_ == 8 then
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_Jump_Shot", 350, false, false, false, false)
    setTimer(function(_ARG_0_)
      setPedAnimation(_ARG_0_)
    end, 355, 1, _ARG_0_)
  elseif _ARG_1_ == 9 then
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_Jump_Shot", 1500, false, false, false, false)
    setTimer(function(_ARG_0_)
      setPedAnimation(_ARG_0_)
    end, 1505, 1, _ARG_0_)
  elseif _ARG_1_ == 10 then
    setElementPosition(_ARG_0_, _ARG_2_, _ARG_3_, _ARG_4_)
    setElementRotation(_ARG_0_, 0, 0, _ARG_5_ - 90)
    setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_Jump_Shot", 500, false, false, false, false)
    setTimer(function(_ARG_0_)
      setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_Dnk", 1000, false, false, false, false)
      setTimer(function(_ARG_0_)
        setPedAnimation(_ARG_0_, "BSKTBALL", "BBALL_Dnk_Lnd", 500, false, false, false, false)
        setTimer(function(_ARG_0_)
          setPedAnimation(_ARG_0_)
          if _ARG_0_ == localPlayer then
            outputChatBox("#7cc576[SeeMTA - Kosárlabda]:#FFFFFF Sikeres zsákolás.", 0, 0, 0, true)
          end
        end, 500, 1, _ARG_0_)
      end, 1000, 1, _ARG_0_)
    end, 500, 1, _ARG_0_)
  end
end
addEvent("bballAnimation", true)
addEventHandler("bballAnimation", getRootElement(), bballAnimation)
