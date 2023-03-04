;;; Compiled snippets and support files for `js-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("__webpack.config.js" "module.exports = {\n    entry: [\n        ${1:'./app/main.js'}\n    ],\n    output: {\n        path: __dirname + '/dist',\n        filename: \"app.bundle.js\"\n    },\n    module: {\n        rules: [\n            {\n              test: /\\.js$/,\n              exclude: /node_modules/,\n              use: {\n                  loader: \"babel-loader\"\n              }\n            }\n        ]\n  },\n    // plugins: []\n};\n" "__webpack.config.js" nil nil nil "/home/camus/.doom.d/templates/js-mode/__webpack.config.js" nil nil)
                       ("__gulpfile.js" "const gulp = require('gulp');\n\n// Default task\ngulp.task('default', [$1]);" "__gulpfile.js" nil nil nil "/home/camus/.doom.d/templates/js-mode/__gulpfile.js" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:57 2023
