;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; flycheck
;; Python
;(add-hook 'python-mode-hook 'flycheck-mode)
;; LaTeX
;(add-hook 'latex-mode-hook 'flycheck-mode)
;; キーバインド
(global-set-key (kbd "C-c m") 'flycheck-mode)
(global-set-key (kbd "M-p") 'flycheck-previous-error)
(global-set-key (kbd "M-n") 'flycheck-next-error)
