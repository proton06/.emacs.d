;; latex mode hook
(defun my-latex-mode-init ()
  ;; タブ幅
  (setq tab-width 2)
  )
(add-hook 'latex-mode-hook 'my-latex-mode-init)
