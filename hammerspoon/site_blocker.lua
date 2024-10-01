local obj = {}
obj.__index = obj

-- Metadata
obj.name = "PaulsSiteBlocker"

-- log a bunch of debugging information
obj._debug = false
obj._logger = nil
obj._hs = nil

obj._timeLimit = 60
obj._weekendTimeLimit = 60
obj._hostsFilePath = '/etc/hosts'
obj._hostsTemplate = '/Users/pauljohnson/.hosts_template'

obj._currentTimer = nil

function obj.new(config, debug, _logger, _hs)
    local self = setmetatable({}, obj)
    if _hs then
        obj._hs = _hs
    else
        obj._hs = hs
    end

    self._debug = debug or self.debug
    local loglevel = self._hs.logger.defaultLogLevel
    if self._debug then
        loglevel = 'debug'
    end
    if _logger then
        self._logger = _logger
    else
        self._logger = self._hs.logger.new('site_blocker', loglevel)
        self._logger.d("initializing...")
    end

    return self
end

function obj:updateBlockList(block)
    if block then
        local status, err = pcall(function()
            local handle = io.popen('/usr/bin/osascript /Users/pauljohnson/dotfiles/hammerspoon/tabCloser.scpt')
            if handle == nil then
                error('handle is nil')
            end
            handle:close()
        end)
        self._hs.printf(string.format("status: %s err: %s", status, self._hs.inspect(err)))
    end
    local blocklist_file = io.open('/Users/pauljohnson/.blocklist', 'r')
    if blocklist_file == nil then
        error('blocklist_file is nil')
    end
    local permanent_blocklist_file = io.open('/Users/pauljohnson/.permanent_blocklist', 'r')
    if permanent_blocklist_file == nil then
        error('permanent_blocklist_file is nil')
    end
    local tmpname = os.tmpname()
    local dest = io.open(tmpname, 'w')
    if dest == nil then
        error('dest is nil')
    end
    local template = io.open(self._hostsTemplate, 'r')
    if template == nil then
        error('template is nil')
    end
    for line in template:lines() do
        dest:write(line)
        dest:write('\n')
    end
    if block then
        for item in self._blocklist_file:lines() do
            dest:write(string.format('0.0.0.0    %s\n', item))
        end
    end
    for item in self._permanent_blocklist_file:lines() do
        dest:write(string.format('0.0.0.0    %s\n', item))
    end
    local command = string.format(
        "/usr/bin/osascript -e 'do shell script \"sudo cp %s %s\" with administrator privileges'",
        tmpname,
        self._hostsFilePath
    )
    local handle = io.popen(command)
    if handle == nil then
        error('handle is nil')
    end
    --   local result = handle:read("*a")
    --   self._hs.printf(result)
    handle:close()
    dest:close()
    os.remove(tmpname)
    template:close()
    blocklist_file:close()
    permanent_blocklist_file:close()
end

function obj:resetState()
    self._hs.settings.set('currentDay', nil)
    self._hs.settings.set('timeSpent', 0)
    self._currentTimer = nil
end

function obj:toggleSiteBlocking()
    local now = os.date('*t')
    local currentDay = self._hs.settings.get('currentDay')
    local timeSpent = self._hs.settings.get('timeSpent')
    if currentDay == nil or currentDay.day ~= now.day then
        currentDay = now
        self._hs.settings.set('currentDay', currentDay)
        if self._currentTimer ~= nil then
            self._currentTimer:stop()
        end
        self._currentTimer = nil
        timeSpent = 0
        self._hs.settings.set('timeSpent', timeSpent)
    end

    local weekday = now.wday > 1 and now.wday < 7
    if (weekday and timeSpent > self._timeLimit) or (not weekday and timeSpent > self._weekendTimeLimit) then
        self._hs.alert('No more time available today.')
        return
    end

    if self._currentTimer ~= nil then
        self._currentTimer:stop()
        self._currentTimer = nil
        -- write block list
        self:updateBlockList(true)
        self._hs.alert('Starting Blocking...')
    else
        -- hs.printf(hs.inspect(currentDay))
        -- hs.printf(hs.inspect(now))
        -- Check day of week
        -- if currentDay.wday > 1 and currentDay.wday < 7 and now.hour >= 8 and now.hour < 17 then
        if self._currentTimer ~= nil and now.hour >= 1 and now.hour < 18 then
            self._hs.alert('Go back too work.')
            return
        end

        -- remove block list
        self._updateBlockList(false)

        self._currentTimer = self._hs.timer.doEvery(
            60,
            function()
                local now = os.date('*t')
                local weekday = now.wday > 1 and now.wday < 7
                local timeSpent = self._hs.settings.get('timeSpent')
                local actualTimeLimit = nil
                if weekday then
                    actualTimeLimit = self._timeLimit
                else
                    actualTimeLimit = self._weekendTimeLimit
                end

                if timeSpent > actualTimeLimit then
                    self._updateBlockList(true)
                    self._hs.alert('Times Up, go do something important.')
                    self._currentTimer:stop()
                    self._currentTimer = nil
                    return
                end

                if self._actualTimeLimit < 5 then
                    self._hs.alert(string.format('%d Minutes remaining', actualTimeLimit - timeSpent))
                elseif timeSpent < 5 and timeSpent % 2 == 0 then
                    self._hs.alert(string.format('%d Minutes remaining', actualTimeLimit - timeSpent))
                elseif timeSpent % 5 == 0 then
                    self._hs.alert(string.format('%d Minutes remaining', actualTimeLimit - timeSpent))
                end

                timeSpent = timeSpent + 1
                -- hs.printf(string.format('Ticking... %d', timeSpent))
                self._hs.settings.set('timeSpent', timeSpent)
            end
        )
        self._currentTimer:start()
        self._hs.alert('Enjoy internet time...')
    end
end

function obj:_startBlockingTimer()
    self._timeOfDayTimer = self._hs.timer.doEvery(
        15,
        function()
            local now = os.date('*t')
            -- if currentTimer ~= nil and now.wday > 1 and now.wday < 7 and now.hour >= 8 and now.hour < 17 then
            if self._currentTimer ~= nil and now.hour >= 1 and now.hour < 18 then
                self._currentTimer:stop()
                self._currentTimer = nil
                self._updateBlockList(true)
                self._hs.alert('Go back to work.')
                return
            end
        end
    )
end

return obj

--permablockTimer = hs.timer.doEvery(
--  15,
--  function()
--    hs.printf('permablock timer running')
--    local permanent_blocklist_file = io.open('/Users/pauljohnson/.permanent_blocklist', 'r')
--    local hosts_file = io.open(hostsFilePath, 'r')
--    local hosts_data = hosts_file:read('*all')
--    local hosts_changed = false
--    for line in permanent_blocklist_file:lines() do
--      --hs.printf(string.format('checking %s', line))
--      local line_formatted = string.format('0.0.0.0    %s', line)
--      if string.find(hosts_data, line_formatted, 1, true) == nil then
--        hs.printf(string.format('host missing %s', line))
--        hosts_changed = true
--      end
--    end
--    permanent_blocklist_file:close()
--    hosts_file:close()
--    if hosts_changed then
--      if currentTimer == nil then
--        updateBlockList(true)
--      else
--        updateBlockList(false)
--      end
--    end
--  end
--)
--permablockTimer:start()

-- timeOfDayTimer:start()

-- Evening timer based accessing.
-- local blockState = "unknown"
-- eveningTimer = hs.timer.doEvery(
--   60,
--   function()
--     hs.printf(string.format('blockState = %s', blockState))
--     now = os.date('*t')
--     isUnblockTime = now.hour >= 20 and now.hour < 23
--     if blockState ~= "unblocked" and isUnblockTime then
--       updateBlockList(false)
--       blockState = "unblocked"
--       hs.printf('Setting unblocked')
--     elseif blockState ~= "blocking" and not isUnblockTime then
--       updateBlockList(true)
--       blockState = "blocking"
--       hs.printf('Setting blocking')
--     end
--  end
-- )
-- eveningTimer:start()