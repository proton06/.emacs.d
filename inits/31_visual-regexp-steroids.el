;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Query regexp
;; (defvar emacs-root
;;   (eval-when-compile
;;     '(
;;       (require 'visual-regexp-steroids)
;;       )))
;; ;; 上記のように書かないと、コンパイル時に `regexp-string' 由来の警告を吐く
; 上記のように書いても警告が止まないのでコメントアウト


(require 'visual-regexp-steroids)
(setq vr/engine 'python)                ;python regexpならばこれ
;(setq vr/engine 'pcre2el)               ;elispでPCREから変換
(global-set-key (kbd "C-M-%") 'vr/query-replace)
;; multiple-cursorsを使っているならこれで
; global-set-key (kbd "C-c m") 'vr/mc-mark)
;; 普段の正規表現isearchにも使いたいならこれを
(global-set-key (kbd "C-M-r") 'vr/isearch-backward)
(global-set-key (kbd "C-M-s") 'vr/isearch-forward)
