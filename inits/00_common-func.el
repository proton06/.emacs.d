;; revert-buffer (バッファの再読み込み) を y/n の入力無しで

(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  (message "revert-buffer")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

;; key-binding
(global-set-key (kbd "<f6>") 'revert-buffer-no-confirm)


(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(defun eval-region-with-message ()
  (interactive)
  (eval-region (region-beginning) (region-end))
  (message "eval region")
  (keyboard-escape-quit))

;; key-binding
(global-set-key (kbd "C-t") 'other-window-or-split)
(global-set-key (kbd "C-c e") 'eval-region-with-message)
