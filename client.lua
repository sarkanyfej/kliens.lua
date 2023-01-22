addEventHandler("onResourceStart", getResourceRootElement(), function()
  sql = dbConnect("sqlite", ":see_drag/toplist.db", "", "", "share=0;charset=utf8")
  if sql then
    dbQuery(function(time)
      if dbPoll(time, 0) then
        sql = {}
        for connection = 1, #dbPoll(time, 0) do
          sql[connection] = dbPoll(time, 0)[connection]
        end
        valami()
      end
      toplist = true
    end, sql, "SELECT * FROM toplist")
  end
end)
function refreshToplist()
  for topcount = 1, displayTopCount do
    if sql[topcount] then
      ({})[topcount] = sql[topcount]
    end
  end
  valami.sort({}, function(time, kisebb)
    return time.elapsed_time < kisebb.elapsed_time
  end)
  setElementData(resourceRoot, "dragRaceToplist", {})
end
addEventHandler("onResourceStop", getResourceRootElement(), function()
  if sql then
    dbExec(toplist, "DELETE FROM toplist")
    if #timer > 0 then
      for for3, topcount in ipairs(timer) do
        dbExec(toplist, "INSERT INTO toplist (character_id, character_name, car_name, elapsed_time, speed, date_recorded) VALUES (?,?,?,?,?,?)", topcount.character_id, topcount.character_name, topcount.car_name, topcount.elapsed_time, topcount.speed, topcount.date_recorded)
      end
    end
  end
  removeElementData(resourceRoot, "dragRace")
  removeElementData(resourceRoot, "dragRaceToplist")
end)
addEvent("dragRaceDone", true)
addEventHandler("dragRaceDone", getRootElement(), function(time, kisebb, kmh)
  if time then
    if tonumber(time) then
      for karakterid = 1, #sql do
        if getElementData(kisebb[4], "char.ID") == sql[karakterid].character_id then
          break
        end
      end
      if not sql[karakterid] then
        table.insert(sql, {
          character_id = getElementData(kisebb[4], "char.ID"),
          character_name = kisebb[3],
          car_name = kisebb[2],
          elapsed_time = time * 1000,
          speed = kmh,
          date_recorded = string.format("%04d-%02d-%02d %02d:%02d:%02d", valami().year + 1900, valami().month + 1, valami().monthday, valami().hour, valami().minute, valami().second)
        })
      end
      if time * 1000 == sql[#sqls].elapsed_time then
      else
      end
      if true then
        sql[#sql].character_name = kisebb[3]
        sql[#sql].elapsed_time, sql[#sql].car_name = time * 1000, kisebb[2]
        sql[#sql].date_recorded, sql[#sql].speed = string.format("%04d-%02d-%02d %02d:%02d:%02d", valami().year + 1900, valami().month + 1, valami().monthday, valami().hour, valami().minute, valami().second), kmh
        for ido = 3, utf8.len((math.floor((time * 1000 / 1000 - math.floor(time * 1000 / 1000)) * 1000))) + 1, -1 do
        end
        outputChatBox("#7cc576[SeeMTA - Drag]: #FFFFFFúj saját legjobb rekord!", source, 255, 255, 255, true)
        outputChatBox("#7cc576[SeeMTA - Drag]: #FFFFFFIdő: #ff9900" .. math.floor(time * 1000 / 1000) .. "." .. ("0" .. math.floor((time * 1000 / 1000 - math.floor(time * 1000 / 1000)) * 1000)) .. "s#FFFFFF, Sebesség: #ff9900" .. kmh .. " km/h", source, 255, 255, 255, true)
      end
      refreshToplist()
    end
    if toplist then
      for nagyobb = 1, #toplist[2] do
        if toplist[2][nagyobb] then
          if kisebb[4] == toplist[2][nagyobb][4] then
            toplist[2][nagyobb][5] = "done"
          end
          if toplist[2][nagyobb][5] == "done" then
          elseif not isElement(toplist[2][nagyobb][4]) then
          end
        end
      end
      if 0 + 1 + 1 >= #valami[2] then
        if isTimer(timer) then
          killTimer(timer)
        end
        timer = setTimer(function()
          setElementData(resourceRoot, "dragRace", false)
          sql = false
        end, 5000, 1)
      end
    end
  end
end)
addEventHandler("onColShapeHit", createColSphere(412.0769, 2502.5837, 16, 1.75), function(time, kisebb)
  if kisebb and isElement(time) and getElementType(time) == "player" and getPedOccupiedVehicle(time) and getVehicleController((getPedOccupiedVehicle(time))) == time and (not sql or not sql[1]) then
    if sql then
      for nagyobb = 1, #sql[2] do
        if sql[2][nagyobb] and time == sql[2][nagyobb][4] then
          break
        end
      end
    end
    if not true then
      addPlayerToRace(time)
    end
  end
end)
function addPlayerToRace(time)
  if isElement(time) and isElement((getPedOccupiedVehicle(time))) then
    if not sql then
      sql = {}
      sql[1] = false
      sql[2] = {}
    end
    if not sql[2][1] then
    elseif not sql[2][2] then
    end
    if 2 then
      setElementFrozen(getPedOccupiedVehicle(time), true)
      setElementRotation(getPedOccupiedVehicle(time), 0, 0, 90)
      exports.lv_controls:toggleControl(time, {
        "accelerate",
        "brake_reverse"
      }, false)
      setCameraTarget(time, time)
      if 2 == 1 then
        setElementPosition(getPedOccupiedVehicle(time), 394, 2505.6602, 16.5)
      elseif 2 == 2 then
        setElementPosition(getPedOccupiedVehicle(time), 394, 2499.4851, 16.5)
      end
      sql[2][2] = {
        getPedOccupiedVehicle(time),
        exports.lv_vehiclenames:getCustomVehicleName(getElementModel((getPedOccupiedVehicle(time)))),
        getElementData(time, "char.Name"):gsub("_", " "),
        time
      }
      for mentes = 1, 2 do
        if sql[2][mentes] and isElement(sql[2][mentes][1]) then
        end
      end
      if isTimer(toplist) then
        killTimer(toplist)
      end
      if isTimer(timer) then
        killTimer(timer)
      end
      if 0 + 1 == 1 then
        toplist = setTimer(function()
          sql = setTimer(countDownRecursive, 1000, 1, 3)
        end, raceWaitingTime * 1000, 1)
      elseif 0 + 1 == 2 then
        timer = setTimer(countDownRecursive, 1000, 1, 3)
      end
      setElementData(resourceRoot, "dragRace", sql)
    end
  end
end
function countDownRecursive(time)
  if sql then
    if not sql[1] then
      for topcount = 1, #sql[2] do
        if sql[2][topcount] then
          if isElement(sql[2][topcount][1]) then
            setElementFrozen(sql[2][topcount][1], false)
          end
          if isElement(sql[2][topcount][4]) then
            exports.lv_controls:toggleControl(sql[2][topcount][4], {
              "accelerate",
              "brake_reverse"
            }, true)
          end
        end
      end
    end
    valami[1] = time
    setElementData(resourceRoot, "dragRace", sql)
    if time - 1 >= 0 then
      if isTimer(toplist) then
        killTimer(toplist)
      end
      toplist = setTimer(countDownRecursive, 1000, 1, time - 1)
    end
  else
    if isTimer(timer) then
      killTimer(timer)
    end
    if isTimer(toplist) then
      killTimer(toplist)
    end
  end
end
