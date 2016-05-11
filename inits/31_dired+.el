(require 'dired+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; key-binding

(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)
;; バッファを増やさずにファイルを開く
(define-key dired-mode-map (kbd "a") 'dired-dwim-find-alternate-file)
;; バッファを増やさずに上の階層へ
(define-key dired-mode-map (kbd "^") 'dired-dwim-up-alternate-directory)
;; 2 画面分割時にいい感じに quit
(define-key dired-mode-map (kbd "q") 'dired-dwim-quit-window)
;; windows に関連付けられたアプリで開く
(define-key dired-mode-map (kbd "M-<RET>") 'uenox-dired-winstart)
;; writable な dired mode
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; option-setting

;; 2画面なら他方にコピー
(setq dired-dwim-target t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; define function

;; <RET> の挙動を賢くする
(defun dired-open-in-accordance-with-situation ()
  (interactive)
  (let ((file (dired-get-filename nil t)))
    ;; 選択したファイルが
    (if (file-directory-p file)
	;; ディレクトリならバッファを増やさずに開く
        (dired-dwim-find-alternate-file)
      ;; ファイルなら windows に関連付けられたアプリで開く
      (uenox-dired-winstart))))

;; diredでWindowsに関連付けられたｱﾌﾟﾘを起動する 
(defun uenox-dired-winstart () 
  "Type '[uenox-dired-winstart]': win-start the current line's file." 
  (interactive) 
  (if (eq major-mode 'dired-mode) 
      (let ((fname (dired-get-filename))) 
	(w32-shell-execute "open" fname) 
	(message "win-started %s" fname)))) 

(defun dired-dwim-find-alternate-file ()
  "画面分割に適した `dired-find-alternate-file'．
通常は `dired-find-alternate-file' を行うが，画面分割されていて
他方のウィンドウに同じバッファが表示されていれば `dired-find-file'．"
  (interactive)
  (cond
   ;; 同じバッファが他のwindowにある場合
   ((delq (selected-window) (get-buffer-window-list))
    (dired-find-file))
   ;; 同じバッファが他のwindowにない場合
   (t
    (dired-find-alternate-file))))

(defun dired-up-alternate-directory ()
  "バッファを増やさず上のディレクトリに移動．"
  (interactive)
  (let* ((dir (dired-current-directory))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (find-alternate-file up)
          (dired-goto-file dir)))))

(defun dired-dwim-up-alternate-directory ()
  "画面分割に適した `dired-up-alternate-directory'．"
  (interactive)
  (cond
   ;; 同じバッファが他のwindowにある場合
   ((delq (selected-window) (get-buffer-window-list))
    (dired-up-directory))
   ;; 同じバッファが他のwindowにない場合
   (t
    (dired-up-alternate-directory))))

(defun dired-dwim-quit-window ()
  "画面分割に適した `quit-window'．"
  (interactive)
  (quit-window (not (delq (selected-window) (get-buffer-window-list)))))
