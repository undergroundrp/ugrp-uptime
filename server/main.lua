Citizen.CreateThread(function()

  -- Initialize game timer
  local uptimeStart = GetGameTimer()

  -- Being execution
  while true do

    -- Execute every minute
    Citizen.Wait(1000 * 60)

    -- Calculate uptime
    local uptimeCurrent = GetGameTimer()
    local uptimeDays    = math.floor((uptimeCurrent - uptimeStart) / 86400000)
    local uptimeHours   = math.floor((uptimeCurrent - uptimeStart) / 3600000) % 24
    local uptimeMinutes = math.floor((uptimeCurrent - uptimeStart) / 60000) % 60

    -- Format uptime display
    uptime = string.format("%02d:%02d:%02d", uptimeDays, uptimeHours, uptimeMinutes)

    -- Set server variable
    SetConvarServerInfo('Uptime', uptime)

    -- Trigger events
    TriggerClientEvent('uptime:tick', -1, uptime)
    TriggerEvent('uptime:tick', uptime)

  end

end)
