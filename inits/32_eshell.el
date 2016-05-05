;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; eshell
(eval-after-load 'esh-opt
  '(progn (require 'eshell-prompt-extras)
          (setq eshell-highlight-prompt nil
                eshell-prompt-function 'epe-theme-lambda)))
;; eshell hook
(add-hook 'eshell-mode-hook
          '(lambda ()
             (progn
	       (local-set-key (kbd "C-z") 'eshell-self-insert-command)
               (define-key eshell-mode-map (kbd "C-p") 'eshell-previous-matching-input-from-input)
               (define-key eshell-mode-map (kbd "C-n") 'eshell-next-matching-input-from-input)
	       (define-key eshell-mode-map (kbd "M-p") 'previous-line)
               (define-key eshell-mode-map (kbd "M-n") 'next-line)
               )
             ))
