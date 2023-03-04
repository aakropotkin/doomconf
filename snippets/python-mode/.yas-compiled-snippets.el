;;; Compiled snippets and support files for `python-mode'
;;; contents of the .yas-setup.el support file:
;;;
;; -*- no-byte-compile: t; -*-

(defun python-split-args (arg-string)
  "Split a python argument string into ((name, default)..) tuples"
  (mapcar (lambda (x)
             (split-string x "[[:blank:]]*=[[:blank:]]*" t))
          (split-string arg-string "[[:blank:]]*,[[:blank:]]*" t)))

(defun python-args-to-docstring ()
  "return docstring format for the python arguments in yas-text"
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args yas-text))
         (max-len (if args (apply 'max (mapcar (lambda (x) (length (nth 0 x))) args)) 0))
         (formatted-args (mapconcat
                (lambda (x)
                   (concat (nth 0 x) (make-string (- max-len (length (nth 0 x))) ? ) " -- "
                           (if (nth 1 x) (concat "\(default " (nth 1 x) "\)"))))
                args
                indent)))
    (unless (string= formatted-args "")
      (mapconcat 'identity (list "Keyword Arguments:" formatted-args) indent))))
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
                     '(("fw" "from __future__ import with_statement" "with_statement" nil
                        ("future")
                        nil "/home/camus/.doom.d/snippets/python-mode/with_statement" nil "fw")
                       ("with" "with ${1:expr}${2: as ${3:alias}}:\n     $0" "with" nil
                        ("control structure")
                        nil "/home/camus/.doom.d/snippets/python-mode/with" nil "with")
                       ("wh" "while ${1:True}:\n      $0" "while" nil
                        ("control structure")
                        nil "/home/camus/.doom.d/snippets/python-mode/while" nil "wh")
                       ("utf8" "# -*- coding: utf-8 -*-\n" "utf-8 encoding" nil nil nil "/home/camus/.doom.d/snippets/python-mode/utf8" nil "utf8")
                       ("un" "def __unicode__(self):\n    $0" "__unicode__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/unicode" nil "un")
                       ("try" "try:\n    $1\nexcept $2:\n    $3\nelse:\n    $0" "tryelse" nil nil nil "/home/camus/.doom.d/snippets/python-mode/tryelse" nil "try")
                       ("try" "try:\n    ${1:`(or % \"pass\")`}\nexcept ${2:Exception}:\n    $0" "try" nil nil nil "/home/camus/.doom.d/snippets/python-mode/try" nil "try")
                       ("tr" "import pdb; pdb.set_trace()" "trace" nil
                        ("debug")
                        nil "/home/camus/.doom.d/snippets/python-mode/trace" nil "tr")
                       ("tf" "import unittest\n${1:from ${2:test_file} import *}\n\n$0\n\nif __name__ == '__main__':\n    unittest.main()" "test_file" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/test_file" nil "tf")
                       ("tcs" "class Test${1:toTest}(${2:unittest.TestCase}):\n      $0\n" "test_class" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/test_class" nil "tcs")
                       ("super" "super(${1:Class}, self).${2:function}(${3:args})" "super" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/super" nil "super")
                       ("str" "def __str__(self):\n    $0" "__str__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/str" nil "str")
                       ("defs" "@staticmethod\ndef ${1:method_name}($1):\n    $0" "static" nil nil nil "/home/camus/.doom.d/snippets/python-mode/static" nil "defs")
                       ("size" "sys.getsizeof($0)" "size" nil nil nil "/home/camus/.doom.d/snippets/python-mode/size" nil "size")
                       ("#!" "#!/usr/bin/env python\n$0" "shebang line"
                        (eq 1
                            (line-number-at-pos))
                        nil nil "/home/camus/.doom.d/snippets/python-mode/shebang" nil "#!")
                       ("setup" "from setuptools import setup\n\npackage = '${1:name}'\nversion = '${2:0.1}'\n\nsetup(name=package,\n      version=version,\n      description=\"${3:description}\",\n      url='${4:url}'$0)\n" "setup" nil
                        ("distribute")
                        nil "/home/camus/.doom.d/snippets/python-mode/setup" nil "setup")
                       ("setdef" "${1:var}.setdefault(${2:key}, []).append(${3:value})" "setdef" nil nil nil "/home/camus/.doom.d/snippets/python-mode/setdef" nil "setdef")
                       ("sn" "self.$1 = $1" "selfassign" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/selfassign" nil "sn")
                       ("s" "self" "self_without_dot" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/self_without_dot" nil "s")
                       ("." "self.$0" "self" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/self" nil ".")
                       ("script" "#!/usr/bin/env python\n\ndef main():\n   pass\n\nif __name__ == '__main__':\n   main()\n" "script" nil nil nil "/home/camus/.doom.d/snippets/python-mode/script" nil "script")
                       ("r" "return $0" "return" nil nil nil "/home/camus/.doom.d/snippets/python-mode/return" nil "r")
                       ("repr" "def __repr__(self):\n    $0" "__repr__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/repr" nil "repr")
                       ("reg" "${1:regexp} = re.compile(r\"${2:expr}\")\n$0" "reg" nil
                        ("general")
                        nil "/home/camus/.doom.d/snippets/python-mode/reg" nil "reg")
                       ("prop" "def ${1:foo}():\n   doc = \"\"\"${2:Doc string}\"\"\"\n   def fget(self):\n       return self._$1\n\n   def fset(self, value):\n       self._$1 = value\n\n   def fdel(self):\n       del self._$1\n   return locals()\n$1 = property(**$1())\n\n$0\n" "prop" nil nil nil "/home/camus/.doom.d/snippets/python-mode/prop" nil nil)
                       ("p" "print($0)" "print" nil nil nil "/home/camus/.doom.d/snippets/python-mode/print" nil "p")
                       ("ps" "pass" "pass" nil nil nil "/home/camus/.doom.d/snippets/python-mode/pass" nil "ps")
                       ("pars" "parser = argparse.ArgumentParser(description='$1')\n$0" "parser" nil
                        ("argparser")
                        nil "/home/camus/.doom.d/snippets/python-mode/parser" nil "pars")
                       ("pargs" "def parse_arguments():\n    parser = argparse.ArgumentParser(description='$1')\n    $0\n    return parser.parse_args()" "parse_args" nil
                        ("argparser")
                        nil "/home/camus/.doom.d/snippets/python-mode/parse_args" nil "pargs")
                       ("np" "import numpy as np\n$0" "np" nil
                        ("general")
                        nil "/home/camus/.doom.d/snippets/python-mode/np" nil "np")
                       ("not_impl" "raise NotImplementedError" "not_impl" nil nil nil "/home/camus/.doom.d/snippets/python-mode/not_impl" nil "not_impl")
                       ("defd" "def ${1:name}(self$2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    `%`$0" "method_docstring" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/method_docstring" nil "defd")
                       ("method" "def ${1:method_name}(self${2:, $3}):\n    $0\n" "method" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/method" nil nil)
                       ("mt" "__metaclass__ = type" "metaclass" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/metaclass" nil "mt")
                       ("main" "def main():\n    $0" "main" nil nil nil "/home/camus/.doom.d/snippets/python-mode/main" nil "main")
                       ("log" "logger = logging.getLogger(\"${1:name}\")\nlogger.setLevel(logging.${2:level})\n" "logging" nil nil nil "/home/camus/.doom.d/snippets/python-mode/logging" nil "log")
                       ("ln" "logger = logging.getLogger(__name__)" "logger_name" nil nil nil "/home/camus/.doom.d/snippets/python-mode/logger_name" nil "ln")
                       ("li" "[${1:x} for $1 in ${2:list}]" "list" nil
                        ("definitions")
                        nil "/home/camus/.doom.d/snippets/python-mode/list" nil "li")
                       ("lam" "lambda ${1:x}: $0" "lambda" nil nil nil "/home/camus/.doom.d/snippets/python-mode/lambda" nil "lam")
                       ("iter" "def __iter__(self):\n    return ${1:iter($2)}" "__iter__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/iter" nil "iter")
                       ("itr" "import ipdb; ipdb.set_trace()" "ipdb trace" nil
                        ("debug")
                        nil "/home/camus/.doom.d/snippets/python-mode/ipdbdebug" nil "itr")
                       ("int" "import code; code.interact(local=locals())" "interact" nil nil nil "/home/camus/.doom.d/snippets/python-mode/interact" nil "int")
                       ("initd" "def __init__(self$1):\n    \\\"\\\"\\\"$2\n    ${1:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "init_docstring" nil
                        ("definitions")
                        nil "/home/camus/.doom.d/snippets/python-mode/init_docstring" nil "initd")
                       ("init" "def __init__(self${1:, args}):\n    $0" "init" nil
                        ("definitions")
                        nil "/home/camus/.doom.d/snippets/python-mode/init" nil "init")
                       ("imp" "import ${1:lib}${2: as ${3:alias}}\n$0" "import" nil
                        ("general")
                        nil "/home/camus/.doom.d/snippets/python-mode/import" nil "imp")
                       ("ifmain" "if __name__ == '__main__':\n    ${1:`(or % \"pass\")`}" "ifmain" nil nil nil "/home/camus/.doom.d/snippets/python-mode/ifmain" nil nil)
                       ("ife" "if $1:\n    ${2:`(or % \"pass\")`}\nelse:\n    $0" "ife" nil
                        ("control structure")
                        nil "/home/camus/.doom.d/snippets/python-mode/ife" nil "ife")
                       ("if" "if ${1:cond}:\n    ${2:`(or % \"pass\")`}" "if" nil
                        ("control structure")
                        nil "/home/camus/.doom.d/snippets/python-mode/if" nil "if")
                       ("fd" "def ${1:name}($2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "function_docstring" nil
                        ("definitions")
                        nil "/home/camus/.doom.d/snippets/python-mode/function_docstring" nil "fd")
                       ("from" "from ${1:lib} import ${2:funs}" "from" nil
                        ("general")
                        nil "/home/camus/.doom.d/snippets/python-mode/from" nil "from")
                       ("for" "for ${1:var} in ${2:collection}:\n    ${3:`(or % \"pass\")`}" "for ... in ... : ..." nil
                        ("control structure")
                        nil "/home/camus/.doom.d/snippets/python-mode/for" nil "for")
                       ("eq" "def __eq__(self, other):\n    return self.$1 == other.$1" "__eq__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/eq" nil "eq")
                       ("doc" ">>> ${1:function calls}\n${2:desired output}\n$0" "doctest" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/doctest" nil "doc")
                       ("d" "\"\"\"$0\n\"\"\"" "doc" nil nil nil "/home/camus/.doom.d/snippets/python-mode/doc" nil "d")
                       ("defm" "def ${1:method_name}(self${2:, $3}):\n    ${4:`(or % \"pass\")`}" "method" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/defm" nil "defm")
                       ("def" "def ${1:func_name}($2):\n    ${3:`(or % \"pass\")`}" "def function" nil
                        ("definitions")
                        nil "/home/camus/.doom.d/snippets/python-mode/def" nil "def")
                       ("dec" "def ${1:decorator}(func):\n    $2\n    def _$1(*args, **kwargs):\n        $3\n        ret = func(*args, **kwargs)\n        $4\n        return ret\n\n    return _$1" "def decorator" nil
                        ("definitions")
                        nil "/home/camus/.doom.d/snippets/python-mode/dec" nil "dec")
                       ("defc" "@classmethod\ndef ${1:method_name}(cls, $1):\n    $0" "classmethod" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/classmethod" nil "defc")
                       ("cl" "class ${1:Name}($2):\n    $0" "class" nil
                        ("object oriented")
                        nil "/home/camus/.doom.d/snippets/python-mode/class" nil "cl")
                       ("cdb" "from celery.contrib import rdb; rdb.set_trace()" "celery pdb" nil
                        ("debug")
                        nil "/home/camus/.doom.d/snippets/python-mode/celery_pdb" nil "cdb")
                       ("at" "self.assertTrue($0)" "assertTrue" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/assertTrue" nil "at")
                       ("ar" "with self.assertRaises(${1:Exception}):\n     $0\n" "assertRaises" nil nil nil "/home/camus/.doom.d/snippets/python-mode/assertRaises.with" nil "ar")
                       ("assertRaises" "assertRaises(${1:Exception}, ${2:fun})" "assertRaises" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/assertRaises" nil nil)
                       ("ane" "self.assertNotEqual($1, $2)" "assertNotEqual" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/assertNotEqual" nil "ane")
                       ("ai" "self.assertIn(${1:member}, ${2:container})" "assertIn" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/assertIn" nil "ai")
                       ("af" "self.assertFalse($0)" "assertFalse" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/assertFalse" nil "af")
                       ("ae" "self.assertEqual($1, $2)" "assertEqual" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/assertEqual" nil "ae")
                       ("assert" "assert $0" "assert" nil
                        ("testing")
                        nil "/home/camus/.doom.d/snippets/python-mode/assert" nil nil)
                       ("argp" "parser.add_argument('${1:varname}', $0)" "arg_positional" nil
                        ("argparser")
                        nil "/home/camus/.doom.d/snippets/python-mode/arg_positional" nil "argp")
                       ("arg" "parser.add_argument('-$1', '--$2',\n                    $0)\n" "arg" nil
                        ("argparser")
                        nil "/home/camus/.doom.d/snippets/python-mode/arg" nil "arg")
                       ("all" "__all__ = [\n        $0\n]" "all" nil nil nil "/home/camus/.doom.d/snippets/python-mode/all" nil nil)
                       ("setit" "def __setitem__(self, ${1:key}, ${2:val}):\n    $0" "__setitem__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/__setitem__" nil "setit")
                       ("new" "def __new__(mcs, name, bases, dict):\n    $0\n    return type.__new__(mcs, name, bases, dict)\n" "__new__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/__new__" nil "new")
                       ("len" "def __len__(self):\n    $0" "__len__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/__len__" nil "len")
                       ("getit" "def __getitem__(self, ${1:key}):\n    $0" "__getitem__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/__getitem__" nil "getit")
                       ("ex" "def __exit__(self, type, value, traceback):\n    $0" "__exit__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/__exit__" nil "ex")
                       ("ent" "def __enter__(self):\n    $0\n\n    return self" "__enter__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/__enter__" nil "ent")
                       ("cont" "def __contains__(self, el):\n    $0" "__contains__" nil
                        ("dunder methods")
                        nil "/home/camus/.doom.d/snippets/python-mode/__contains__" nil "cont")))


;;; Do not edit! File generated at Fri Mar  3 16:50:45 2023
