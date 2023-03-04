;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("while" "while (${1:condition}) {\n    `%`$0\n}\n" "while loop" nil nil nil "/home/camus/.doom.d/snippets/php-mode/while" nil nil)
                       ("dump" "var_dump(`%`$1);" "var_dump(...)" nil nil nil "/home/camus/.doom.d/snippets/php-mode/var_dump" nil "dump")
                       ("urle" "urlencode(${1:`%`})$0" "urlencode(...)" nil nil nil "/home/camus/.doom.d/snippets/php-mode/urlencode" nil "urle")
                       ("urld" "urldecode(${1:`%`})$0" "urldecode(...)" nil nil nil "/home/camus/.doom.d/snippets/php-mode/urldecode" nil "urld")
                       ("thi" "\\$this->$0" "$this->..." nil nil nil "/home/camus/.doom.d/snippets/php-mode/this" nil "thi")
                       ("switch" "switch (${on}) {\n    $0\n}" "switch (...) {...}" nil nil nil "/home/camus/.doom.d/snippets/php-mode/switch" nil nil)
                       ("p=" "<?=`%`$0 ?>" "<?= ... ?>" nil nil nil "/home/camus/.doom.d/snippets/php-mode/shorttag-print" nil "p=")
                       ("#!" "#!/usr/bin/env php\n<?php\n\n$0" "#!/usr/bin/env php" nil nil nil "/home/camus/.doom.d/snippets/php-mode/shebang" nil "#!")
                       ("sel" "self::$0" "self::..." nil nil nil "/home/camus/.doom.d/snippets/php-mode/self" nil "sel")
                       ("reqo" "require_once(\"${1:...}\");" "require_once(\"...\");" nil nil nil "/home/camus/.doom.d/snippets/php-mode/require_once" nil "reqo")
                       ("req" "require(\"${1:...}\");" "require(\"...\");" nil nil nil "/home/camus/.doom.d/snippets/php-mode/require" nil "req")
                       ("/**" "/**\n * ${0:`(if % (s-replace \"\\n\" \"\\n * \" %))`}\n */" "/** ... */" nil nil nil "/home/camus/.doom.d/snippets/php-mode/phpdoc" nil "/**")
                       ("php" "<?php $0 ?>" "<?php ... ?>" nil nil nil "/home/camus/.doom.d/snippets/php-mode/php" nil "php")
                       ("par" "parent::$0" "parent::..." nil nil nil "/home/camus/.doom.d/snippets/php-mode/parent" nil "par")
                       ("->" "\\$${1:obj_name}->${2:var}" "$o->..." nil nil nil "/home/camus/.doom.d/snippets/php-mode/object-accessor" nil "->")
                       ("met" "${1:public} function ${2:name}($3)\n{\n    `%`$0\n}" "class method" nil nil nil "/home/camus/.doom.d/snippets/php-mode/method" nil "met")
                       ("inco" "include_once(\"${1:...}\");" "include_once(\"...\");" nil nil nil "/home/camus/.doom.d/snippets/php-mode/include_once" nil "inco")
                       ("inc" "include(\"${1:...}\");" "include(\"...\");" nil nil nil "/home/camus/.doom.d/snippets/php-mode/include" nil "inc")
                       ("if" "if ($1) {\n    `%`$0\n}" "if (...) { ... }" nil nil nil "/home/camus/.doom.d/snippets/php-mode/if" nil "if")
                       ("fu" "function ${1:name}($2) {\n    `%`$0\n}" "function" nil nil nil "/home/camus/.doom.d/snippets/php-mode/function" nil "fu")
                       ("fori" "for (\\$i = ${1:0}; \\$i < ${2:10}; ++\\$i) {\n    `%`$0\n}\n" "for loop w/ $i" nil nil nil "/home/camus/.doom.d/snippets/php-mode/fori" nil "fori")
                       ("fore" "foreach (${1:collection} as ${2:var}) {\n    `%`$0\n}" "foreach (...) {...}" nil nil nil "/home/camus/.doom.d/snippets/php-mode/foreach" nil "fore")
                       ("for" "for ($1;$2;$3) {\n    `%`$0\n}" "for loop" nil nil nil "/home/camus/.doom.d/snippets/php-mode/for" nil "for")
                       ("eli" "elseif ($1) {\n    `%`$0\n}" "elseif (...) { ... }" nil nil nil "/home/camus/.doom.d/snippets/php-mode/elseif" nil "eli")
                       ("el" "else {\n    `%`$0\n}" "else { ... }" nil nil nil "/home/camus/.doom.d/snippets/php-mode/else" nil "el")
                       ("e" "echo `%`$0;" "echo ...;" nil nil nil "/home/camus/.doom.d/snippets/php-mode/echo" nil "e")
                       ("de" "define(\"${1:CONSTANT}\", ${2:`%`value});" "define(..., ...)" nil nil nil "/home/camus/.doom.d/snippets/php-mode/define" nil "de")
                       ("co" "continue;" "continue;" nil nil nil "/home/camus/.doom.d/snippets/php-mode/continue" nil "co")
                       ("cl" "class ${1:Name}${2: extends ${3:Parent}}\n{\n    `%`$0\n}" "PHP class" nil nil nil "/home/camus/.doom.d/snippets/php-mode/class" nil "cl")
                       ("br" "break;" "break;" nil nil nil "/home/camus/.doom.d/snippets/php-mode/break" nil "br")
                       ("=" "\\$${1:var_name} = `%`$0;" "$var = value;" nil nil nil "/home/camus/.doom.d/snippets/php-mode/assignment" nil "=")
                       ("arr" "array(`%`$0)" "array(...)" nil nil nil "/home/camus/.doom.d/snippets/php-mode/array" nil "arr")
                       ("acl" "abstract class ${1:Name}${2: extends ${3:Parent}}\n{\n    `%`$0\n}\n" "abstract class" nil nil nil "/home/camus/.doom.d/snippets/php-mode/abstract-class" nil "acl")))


;;; Do not edit! File generated at Fri Mar  3 16:50:44 2023
