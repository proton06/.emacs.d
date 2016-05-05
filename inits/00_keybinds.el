;; キーバインド
;; key-binding

;; globalなC-zをUNDOに
(global-set-key (kbd "C-z") 'undo)
;; 置換
(global-set-key (kbd "C-x C-p") 'query-replace)
;; 正規表現置換
;(global-set-key (kbd "C-x p") 'replace-regexp)
;; eshell
(global-set-key (kbd "C-c b") 'eshell)
;; C-hでBackSpace
(global-set-key (kbd "C-h") 'delete-backward-char)
;; M-hでbackward-kill-word
(global-set-key (kbd "M-h") 'backward-kill-word)
;; package-install
(global-set-key (kbd "C-c p") 'package-install)
;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; C-j
(global-set-key (kbd "C-j") 'newline-and-indent)
