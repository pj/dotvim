package.path = package.path ..
    ";./hammerspoon/?.lua;/opt/homebrew/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?/init.lua;/opt/homebrew/lib/lua/5.4/?.lua;/opt/homebrew/lib/lua/5.4/?/init.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua"

local lu = require('luaunit')
local new_wm = require("new_wm")

-- -- Get and print the current working directory
-- local current_dir = lfs.currentdir()
-- print("Current Working Directory: " .. current_dir)

function mockGeometry()
    local mockGeometry = {}
    function mockGeometry.new(x, y, w, h)
        return {
            x = x,
            y = y,
            w = w,
            h = h
        }
    end

    function mockGeometry.copy(frame)
        return {
            x = frame.x,
            y = frame.y,
            w = frame.w,
            h = frame.h
        }
    end

    return mockGeometry
end

function mockWindowModule(windows)
    local mockWindowModule = {}
    function mockWindowModule.focusedWindow()
        return mockWindowModule._focusedWindow
    end

    mockWindowModule.filter = {
        new = function()
            return {
                getWindows = function()
                    return windows
                end
            }
        end
    }

    return mockWindowModule
end

function mockHs(windows)
    return {
        logger = { defaultLogLevel = "warning" },
        spaces = {
            focusedSpace = function()
                return 1
            end
        },
        screen = {
            mainScreen = function()
                return {
                    frame = function()
                        return {
                            x = 0,
                            y = 0,
                            w = 120,
                            h = 100
                        }
                    end
                }
            end
        },
        geometry = mockGeometry(),
        window = mockWindowModule(windows)
    }
end

function mockLogger()
    local testLogger = {}
    testLogger.messages = {}
    testLogger.df = function(format, ...)
        table.insert(testLogger.messages, string.format(format, ...))
    end
    testLogger.d = function(message)
        table.insert(testLogger.messages, message)
    end
    return testLogger
end

function mockWindow(id, name)
    local mockWindow = {}
    function mockWindow:id()
        return id
    end

    function mockWindow:setFrame(frame)
        self._frame = frame
    end

    function mockWindow:title()
        return name
    end

    return mockWindow
end

function testSetLayout()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            }
        }
    }, true)

    lu.assertEquals(fooWindow._frame, { x = 60, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
end

function testMoveTo()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")
    local hs = mockHs({ fooWindow, barWindow, bazWindow })
    local wm = new_wm.new(true, mockLogger(), hs)

    hs.window._focusedWindow = bazWindow

    wm:moveFocusedTo(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
            }
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = bazWindow:title(),
            window = bazWindow
        }
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 60, y = 0, w = 60, h = 100 })
end

function testMoveToExtend()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")
    local hs = mockHs({ fooWindow, barWindow, bazWindow })
    local wm = new_wm.new(true, mockLogger(), hs)

    hs.window._focusedWindow = bazWindow

    wm:moveFocusedTo(3)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
            }
        },
        {
            type = new_wm.__EMPTY,
            span = 1
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = bazWindow:title(),
            window = bazWindow
        }
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 80, y = 0, w = 40, h = 100 })
end

function testMoveToExistingPosition()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")
    local hs = mockHs({ fooWindow, barWindow, bazWindow })
    local wm = new_wm.new(true, mockLogger(), hs)

    hs.window._focusedWindow = bazWindow

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__EMPTY,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = bazWindow:title(),
                window = bazWindow
            }
        }
    }, true)

    wm:moveFocusedTo(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
            }
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = bazWindow:title(),
            window = bazWindow
        },
        {
            type = new_wm.__EMPTY,
            span = 1
        },
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 40, y = 0, w = 40, h = 100 })
end

function testMoveToSamePosition()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")
    local hs = mockHs({ fooWindow, barWindow, bazWindow })
    local wm = new_wm.new(true, mockLogger(), hs)

    hs.window._focusedWindow = bazWindow

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = bazWindow:title(),
                window = bazWindow
            }
        }
    }, true)

    wm:moveFocusedTo(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
            }
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = bazWindow:title(),
            window = bazWindow
        },
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 60, y = 0, w = 60, h = 100 })
end

function testMoveToStack()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")
    local hs = mockHs({ fooWindow, barWindow, bazWindow })
    local wm = new_wm.new(true, mockLogger(), hs)

    hs.window._focusedWindow = bazWindow

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = bazWindow:title(),
                window = bazWindow
            }
        }
    }, true)

    wm:moveFocusedTo(1)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        },
        {
            type = new_wm.__EMPTY,
            span = 1,
        },
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
end

function testSetSpanOnPositionedWindow()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")
    local hs = mockHs({ fooWindow, barWindow, bazWindow })
    local wm = new_wm.new(true, mockLogger(), hs)

    hs.window._focusedWindow = bazWindow

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = bazWindow:title(),
                window = bazWindow
            }
        }
    }, true)

    wm:setColumnSpan(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow
            }
        },
        {
            type = new_wm.__WINDOW,
            span = 2,
            name = bazWindow:title(),
            window = bazWindow
        },
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 40, y = 0, w = 80, h = 100 })
end

function testSetSpanOnStackWindow()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")
    local hs = mockHs({ fooWindow, barWindow, bazWindow })
    local wm = new_wm.new(true, mockLogger(), hs)

    hs.window._focusedWindow = bazWindow

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            }
        }
    }, true)

    wm:setColumnSpan(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 2,
            windows = {
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = fooWindow:title(),
            window = fooWindow
        },
    })

    lu.assertEquals(fooWindow._frame, { x = 80, y = 0, w = 40, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 80, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 80, h = 100 })
end

function testSplit()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setSplits(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        },
        {
            type = new_wm.__EMPTY,
            span = 1
        }
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 60, h = 100 })

    wm:setSplits(3)
    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        },
        {
            type = new_wm.__EMPTY,
            span = 1
        },
        {
            type = new_wm.__EMPTY,
            span = 1
        }
    })
    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
end

function testSplitMultiple()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
        }
    }, true)

    wm:setSplits(3)
    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        },
        {
            type = new_wm.__EMPTY,
            span = 1
        },
        {
            type = new_wm.__EMPTY,
            span = 1
        }
    })
    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 40, h = 100 })
end

function testReduceSplit()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = bazWindow:title(),
                window = bazWindow
            }
        }
    }, true)

    wm:setSplits(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = fooWindow:title(),
            window = fooWindow
        },
    })

    lu.assertEquals(fooWindow._frame, { x = 60, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
end

function testReduceSplitMultiple()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            },
            { type = new_wm.__EMPTY, span = 1 },
            { type = new_wm.__EMPTY, span = 1 },
        }
    }, true)

    wm:setSplits(2)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = fooWindow:title(),
            window = fooWindow
        },
    })

    lu.assertEquals(fooWindow._frame, { x = 60, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
end

function testReduceSplitRepositionStack()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            },
            {
                type = new_wm.__STACK,
                span = 1
            }
        }
    }, true)

    wm:setSplits(1)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        }
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 120, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 120, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 120, h = 100 })
end

function testAddNewWindow()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            }
        }
    }, true)

    wm:addWindow(bazWindow)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            },
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = fooWindow:title(),
            window = fooWindow
        }
    }
    )

    lu.assertEquals(fooWindow._frame, { x = 60, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
end

function testRemoveWindow()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            }
        }
    }, true)

    wm:removeWindow(bazWindow)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [barWindow:id()] = barWindow,
            },
        },
        {
            type = new_wm.__WINDOW,
            span = 1,
            name = fooWindow:title(),
            window = fooWindow
        }
    }
    )

    lu.assertEquals(fooWindow._frame, { x = 60, y = 0, w = 60, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
end

function testRemovePinnedWindow()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            }
        }
    }, true)

    wm:removeWindow(fooWindow)

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow,
            },
        },
        {
            type = new_wm.__EMPTY,
            span = 1,
        }
    }
    )

    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 60, h = 100 })
end

function testSetLayoutNormalRefresh()
    local fooWindow = mockWindow(1, "Foo")
    local barWindow = mockWindow(2, "Bar")
    local bazWindow = mockWindow(3, "Baz")

    local wm = new_wm.new(true, mockLogger(), mockHs({ fooWindow, barWindow, bazWindow }))

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
            {
                type = new_wm.__WINDOW,
                span = 1,
                name = fooWindow:title(),
                window = fooWindow
            },
        }
    }, true)

    wm:setLayout({
        columns = {
            {
                type = new_wm.__STACK,
                span = 1
            },
        }
    })

    lu.assertEquals(wm._current_layout[1].columns, {
        {
            type = new_wm.__STACK,
            span = 1,
            windows = {
                [fooWindow:id()] = fooWindow,
                [barWindow:id()] = barWindow,
                [bazWindow:id()] = bazWindow
            }
        }
    })

    lu.assertEquals(fooWindow._frame, { x = 0, y = 0, w = 120, h = 100 })
    lu.assertEquals(barWindow._frame, { x = 0, y = 0, w = 120, h = 100 })
    lu.assertEquals(bazWindow._frame, { x = 0, y = 0, w = 120, h = 100 })
end

os.exit(lu.LuaUnit.run())