;;; Compiled snippets and support files for `c++-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c++-mode
                     '(("__winmain.cpp" "#include <Windows.h>\n\nint CALLBACK WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)\n{\n    $0\n\n    return 0;\n}\n" "__winmain.cpp" nil
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/c++-mode/__winmain.cpp" nil nil)
                       ("__main.cpp" "#include <iostream>\n\nusing namespace std;\n\nint main(int argc, char *argv[]) {\n    $0\n\n    return 0;\n}\n" "__main.cpp" nil
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/c++-mode/__main.cpp" nil nil)
                       ("__hpp" "#ifndef ${1:`(upcase (file-name-base buffer-file-name))`_H_$(upcase yas-text)}\n#define $1\n\n$0\n\n#endif // $1\n" "__hpp" nil
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/c++-mode/__hpp" nil nil)
                       ("__cpp" "#include \"`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`.h\"\n\n$0\n" "__cpp" nil
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/c++-mode/__cpp" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:57 2023
