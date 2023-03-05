;;; Compiled snippets and support files for `makefile-gmake-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'makefile-gmake-mode
                     '(("__cpp" "CC            = clang++\nTAGS          = ctags -e -x >TAGS\nFLAGS         = -std=c++11 -stdlib=libc++ -Iinclude -I/usr/local/include -L/usr/local/lib\nCFLAGS        = -pedantic -Wall -Wextra -ggdb3\nLIBS          = # ...\n\nDEBUG_FLAGS   = -O0 -D _DEBUG\nRELEASE_FLAGS = -O2 -D NDEBUG -combile -fwhole-program\n\nRELEASE_DIR   = ./build/release\nDEBUG_DIR     = ./build/debug\n\nTARGET        = ${1:appname$(replace-regexp-in-string \" \" \"\" yas-text nil t)}\nHEADERS       = \\$(shell echo include/*.h)\nSOURCES       = \\$(shell echo src/*.cpp) \\$(shell echo src/**/*.cpp)\nOBJECTS       = \\$(SOURCES:.cpp=.o)\n\n###\n\nall: \\$(TARGET)\n\ndebug: FLAGS += \\$(DEBUG_FLAGS)\ndebug: \\$(TARGET)\n\nrelease: FLAGS += \\$(RELEASE_FLAGS)\nrelease: \\$(TARGET)\n\nprofile: CFLAGS += -pg\nprofile: \\$(TARGET)\n\n\\$(TARGET): \\$(OBJECTS)\n    \\$(CC) \\$(FLAGS) \\$(CFLAGS) -o \\$(TARGET) \\$(OBJECTS)\n\n%.o: %.cpp\n	\\$(CC) \\$(FLAGS) \\$(CFLAGS) -c -o \\$@ \\$<\n\ntags: \\$(SOURCES)\n    \\$(CTAGS) \\$(SOURCES)\n\nclean:\n    -rm -f \\$(OBJECTS) \\$(TARGET)\n\n.PHONY: all profile release debug clean" "__cpp" nil nil nil "/home/camus/.doom.d/templates/makefile-gmake-mode/__cpp" nil nil)
                       ("__" "##\n# ${1:Project Title}\n#\n# @file\n# @version 0.1\n\n$0\n\n# end\n" "__" nil nil nil "/home/camus/.doom.d/templates/makefile-gmake-mode/__" nil nil)))


;;; Do not edit! File generated at Sun Mar  5 15:17:40 2023
