;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; hlinum
;; 現在行を強調表示する

;; init
(require 'hlinum)
(hlinum-activate)

;; customize face
(custom-set-faces
 '(linum-highlight-face ((t (:foreground "light slate blue")))))
