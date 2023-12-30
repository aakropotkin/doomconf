;;; Compiled snippets and support files for `ruby-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'ruby-mode
                     '(("__module" "# `(progn\n     (setq-local pkgs (split-string (string-remove-prefix (concat (doom-project-root) \"lib/\") (file-name-sans-extension buffer-file-name)) \"/\" t))\n     (setq-local pkgs-p (eq (length pkgs) 1))\n     (setq-local pkg-module (replace-regexp-in-string \" \" \"::\" (capitalize (if pkgs-p (car pkgs) (string-join (butlast pkgs) \" \"))) nil t))\n\n     (concat \"lib/\" (file-name-nondirectory buffer-file-name)))`\n\nmodule `pkg-module`\n`(when pkgs-p \"  VERSION='0.0.1'\\n\\n\")``(concat \"  class \" (if pkgs-p \"<< self\" (capitalize (car (last pkgs)))))`\n    `%`${0:# Code here}\n  end\nend" "__module" nil nil nil "/home/camus/.doom.d/templates/ruby-mode/__module" nil nil)
                       ("__Rakefile" "require 'bundler/setup'\n$:.unshift File.expand_path('../lib', __FILE__)\n\n# rake spec\nrequire 'rspec/core/rake_task'\nRSpec::Core::RakeTask.new(:spec) { |t| t.verbose = false   }\n\n# rake console\ntask :console do\n    require 'pry'\n    require '${1:gem_name}'\n    ARGV.clear\n    Pry.start\nend\n\n$0" "__Rakefile" nil nil nil "/home/camus/.doom.d/templates/ruby-mode/__Rakefile" nil nil)
                       ("__Gemfile" "source 'https://rubygems.org'\n\ngem '$0'\n" "__Gemfile" nil nil nil "/home/camus/.doom.d/templates/ruby-mode/__Gemfile" nil nil)
                       ("__.gemspec" "" "__.gemspec" nil nil nil "/home/camus/.doom.d/templates/ruby-mode/__.gemspec" nil nil)
                       ("__" "#!/usr/bin/env ruby\n\n$0\n" "__" nil nil nil "/home/camus/.doom.d/templates/ruby-mode/__" nil nil)))


;;; Do not edit! File generated at Mon Mar 20 17:06:16 2023
