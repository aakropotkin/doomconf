;;; Compiled snippets and support files for `love-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'love-mode
                     '(("__main.lua" "" "__main.lua" nil nil nil "/home/camus/.doom.d/templates/love-mode/__main.lua" nil nil)
                       ("__conf.lua" "function love.conf(t)\n    t.identity = nil                   -- The name of the save directory (string)\n    t.version = \"0.9.1\"                -- The LÖVE version this game was made for (string)\n    t.console = false                  -- Attach a console (boolean, Windows only)\n\n    t.window.title = \"${1:Untitled}\"        -- The window title (string)\n    t.window.icon = nil                -- Filepath to an image to use as the window's icon (string)\n    t.window.width = 800               -- The window width (number)\n    t.window.height = 600              -- The window height (number)\n    t.window.borderless = false        -- Remove all border visuals from the window (boolean)\n    t.window.resizable = false         -- Let the window be user-resizable (boolean)\n    t.window.minwidth = 1              -- Minimum window width if the window is resizable (number)\n    t.window.minheight = 1             -- Minimum window height if the window is resizable (number)\n    t.window.fullscreen = false        -- Enable fullscreen (boolean)\n    t.window.fullscreentype = \"normal\" -- Standard fullscreen or desktop fullscreen mode (string)\n    t.window.vsync = true              -- Enable vertical sync (boolean)\n    t.window.fsaa = 0                  -- The number of samples to use with multi-sampled antialiasing (number)\n    t.window.display = 1               -- Index of the monitor to show the window in (number)\n    t.window.highdpi = false           -- Enable high-dpi mode for the window on a Retina display (boolean). Added in 0.9.1\n    t.window.srgb = false              -- Enable sRGB gamma correction when drawing to the screen (boolean). Added in 0.9.1\n\n    t.modules.audio = true             -- Enable the audio module (boolean)\n    t.modules.event = true             -- Enable the event module (boolean)\n    t.modules.graphics = true          -- Enable the graphics module (boolean)\n    t.modules.image = true             -- Enable the image module (boolean)\n    t.modules.joystick = true          -- Enable the joystick module (boolean)\n    t.modules.keyboard = true          -- Enable the keyboard module (boolean)\n    t.modules.math = true              -- Enable the math module (boolean)\n    t.modules.mouse = true             -- Enable the mouse module (boolean)\n    t.modules.physics = true           -- Enable the physics module (boolean)\n    t.modules.sound = true             -- Enable the sound module (boolean)\n    t.modules.system = true            -- Enable the system module (boolean)\n    t.modules.timer = true             -- Enable the timer module (boolean)\n    t.modules.window = true            -- Enable the window module (boolean)\n    t.modules.thread = true            -- Enable the thread module (boolean)\nend\n" "love.conf"
                        (eq major-mode 'lua-mode)
                        nil nil "/home/camus/.doom.d/templates/love-mode/__conf.lua" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:57 2023
