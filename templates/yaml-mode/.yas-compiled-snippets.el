;;; Compiled snippets and support files for `yaml-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'yaml-mode
                     '(("__docker-compose.yml" "web:\n  build: .\n  ports:\n   - \"8080:80\"\n  volumes:\n   - ./public:/var/www\n  links:\n   - mysql\n   - memcache\n   \nmysql:\n  image: mysql\n  \nredis:\n  image: redis\n" "__docker-compose.yml" nil nil nil "/home/camus/.doom.d/templates/yaml-mode/__docker-compose.yml" nil nil)))


;;; Do not edit! File generated at Mon Mar 20 17:06:16 2023
