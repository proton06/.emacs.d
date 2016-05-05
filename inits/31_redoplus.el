;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Redo+
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(global-set-key (kbd"C-M-z") 'redo)
(global-set-key (kbd"C-x C-z") 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
