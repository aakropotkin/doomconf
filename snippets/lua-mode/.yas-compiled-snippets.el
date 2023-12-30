;;; Compiled snippets and support files for `lua-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'lua-mode
                     '(("while" "while ${1:true} do\n    $0\nend" "while ... do ... end" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/while" nil nil)
                       ("ton" "tonumber($1)\n" "tonumber(...)" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/ton" nil nil)
                       ("=-" "${1:varName} = $1 - ${2:1}" "self-subtraction" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/sub" nil "=-")
                       ("sqrt" "# -*- mode: snippet -*-\nmath.sqrt($0)\n" "sqrt" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/sqrt" nil nil)
                       ("self:" "function self:${1:methodName}($2)\n    $0\nend\n" "psuedo method declaration" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/self" nil "self:")
                       ("req" "require(\"${1:filename}\")\n" "require(...)" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/require" nil "req")
                       ("p" "print(`%`$1)\n" "print" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/print" nil "p")
                       ("pi" "# -*- mode: snippet -*-\nmath.pi\n" "pi" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/pi" nil nil)
                       ("open" "io.open(${1:\"${2:filename}\"}, \"${3:r}\")\n" "io.open" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/open" nil nil)
                       ("math.tanh" "# -*- mode: snippet -*-\nmath.tanh($0)\n" "math.tanh" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.tanh" nil nil)
                       ("math.tan" "# -*- mode: snippet -*-\nmath.tan($0)\n" "math.tan" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.tan" nil nil)
                       ("math.sqrt" "# -*- mode: snippet -*-\nmath.sqrt($0)\n" "math.sqrt" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.sqrt" nil nil)
                       ("math.sinh" "# -*- mode: snippet -*-\nmath.sinh($0)\n" "math.sinh" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.sinh" nil nil)
                       ("math.sin" "# -*- mode: snippet -*-\nmath.sin($0)\n" "math.sin" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.sin" nil nil)
                       ("math.randomseed" "# -*- mode: snippet -*-\nmath.randomseed($0)\n" "math.randomseed" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.randomseed" nil nil)
                       ("math.random" "# -*- mode: snippet -*-\nmath.random($0)\n" "math.random" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.random" nil nil)
                       ("math.rad" "# -*- mode: snippet -*-\nmath.rad($0)\n" "math.rad" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.rad" nil nil)
                       ("math.pow" "# -*- mode: snippet -*-\nmath.pow($0)\n" "math.pow" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.pow" nil nil)
                       ("math.pi" "# -*- mode: snippet -*-\nmath.pi\n" "math.pi" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.pi" nil nil)
                       ("math.modf" "# -*- mode: snippet -*-\nmath.modf($0)\n" "math.modf" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.modf" nil nil)
                       ("math.min" "# -*- mode: snippet -*-\nmath.min(${0:x, y, ...})\n" "math.min" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.min" nil nil)
                       ("math.max" "# -*- mode: snippet -*-\nmath.max(${0:x, y, ...})\n" "math.max" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.max" nil nil)
                       ("math.log10" "# -*- mode: snippet -*-\nmath.log10($0)\n" "math.log10" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.log10" nil nil)
                       ("math.ldexp" "# -*- mode: snippet -*-\nmath.ldexp($0)\n" "math.ldexp" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.ldexp" nil nil)
                       ("math.huge" "# -*- mode: snippet -*-\nmath.huge($0)\n" "math.huge" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.huge" nil nil)
                       ("math.frexp" "# -*- mode: snippet -*-\nmath.frexp($0)\n" "math.frexp" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.frexp" nil nil)
                       ("math.fmod" "# -*- mode: snippet -*-\nmath.fmod($0)\n" "math.fmod" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.fmod" nil nil)
                       ("math.floor" "# -*- mode: snippet -*-\nmath.floor($0)\n" "math.floor" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.floor" nil nil)
                       ("math.exp" "# -*- mode: snippet -*-\nmath.exp($0)\n" "math.exp" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.exp" nil nil)
                       ("math.deg" "# -*- mode: snippet -*-\nmath.deg($0)\n" "math.deg" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.deg" nil nil)
                       ("math.cosh" "# -*- mode: snippet -*-\nmath.cosh($0)\n" "math.cosh" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.cosh" nil nil)
                       ("math.cos" "# -*- mode: snippet -*-\nmath.cos($0)\n" "math.cos" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.cos" nil nil)
                       ("math.ceil" "# -*- mode: snippet -*-\nmath.ceil($0)\n" "math.ceil" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.ceil" nil nil)
                       ("math.atan2" "# -*- mode: snippet -*-\nmath.atan2(${1:y}, ${2:x})$0\n" "math.atan2" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.atan2" nil nil)
                       ("math.atan" "# -*- mode: snippet -*-\nmath.atan($0)\n" "math.atan" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.atan" nil nil)
                       ("math.asin" "# -*- mode: snippet -*-\nmath.asin($0)\n" "math.asin" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.asin" nil nil)
                       ("math.acos" "# -*- mode: snippet -*-\nmath.acos($0)\n" "math.acos" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.acos" nil nil)
                       ("math.abs" "# -*- mode: snippet -*-\nmath.abs($0)\n" "math.abs" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/math.abs" nil nil)
                       ("l" "local $0" "local ..." nil nil nil "/home/camus/.doom.d/snippets/lua-mode/local" nil "l")
                       ("?" "if ${1:true} then `%`$0 end" "inline if ... then ... end" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/inline-if" nil "?")
                       ("f=" "${1:name} = function($2)\n    ${3:-- code}\nend\n" "? = function(...) ... end" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/inline-function" nil "f=")
                       ("if" "if ${1:true} then\n   `%`$0\nend" "if ... then ... end" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/if" nil nil)
                       ("functioni" "function ${1:name}($2) $3 end" "function" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/functioni" nil nil)
                       ("fu" "function ${1:name}($2)\n    ${3:-- code}\nend" "function" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/function" nil "fu")
                       ("forline" "f = io.open(${1:\"${2:filename}\"}, \"${3:r}\")\n\nwhile true do\n    line = f:read()\n    if line == nil then break end\n\n    ${0:-- code}\nend\n" "read file line-by-line" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/forline" nil nil)
                       ("fori" "for ${1:i}=${2:1},${3:10} do\n    $0\nend\n" "for loop range" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/fori" nil nil)
                       ("foreach" "for i, ${1:x} in pairs(${2:table}) do\n    $0\nend\n" "for loop range" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/foreach" nil nil)
                       ("for" "for ${1:i}=${2:1},${3:10} do\n    $0\nend\n" "for loop range" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/for" nil nil)
                       ("fi" "function ${1:name}($2) $3 end" "function" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/fi" nil nil)
                       ("elseif" "elseif ${1:true} then\n   `%`$0" "elseif ... then ..." nil nil nil "/home/camus/.doom.d/snippets/lua-mode/elseif" nil nil)
                       ("cl" "${1:ClassName} = {}\n$1.new = function($2)\n    local self = {}\n\n    ${3:-- code}\n\n    return self\nend" "psuedo class declaration" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/class" nil "cl")
                       ("=" "${1:varName} = ${0:value}" "... = ..." nil nil nil "/home/camus/.doom.d/snippets/lua-mode/assignment" nil "=")
                       ("=+" "${1:varName} = $1 + ${2:1}" "self-addition" nil nil nil "/home/camus/.doom.d/snippets/lua-mode/add" nil "=+")))


;;; Do not edit! File generated at Mon Mar 20 17:06:15 2023
