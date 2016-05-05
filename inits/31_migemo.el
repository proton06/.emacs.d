;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Migemo
(require 'migemo)
(setq migemo-command "C:/Users/fukumoto/home/.emacs.d/migimo/cmigemo")
(setq migemo-options '("-q" "--emacs"))

; Set your installed path
(setq migemo-dictionary "C:/Users/fukumoto/home/.emacs.d/migimo/dict/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)
