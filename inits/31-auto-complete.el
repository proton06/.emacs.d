;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Auto Complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ

;; 補完設定
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially     ; ファイル名の一部
	try-complete-file-name               ; ファイル名全体
	try-expand-all-abbrevs               ; 静的略語展開
	try-expand-dabbrev                   ; 動的略語展開(カレントバッファ)
	try-expand-dabbrev-all-buffers       ; 動的略語展開(全バッファ)
	try-expand-dabbrev-from-kill         ; 動的略語展開(キルリング)
	try-complete-lisp-symbol-partially   ; Lispシンボル名の一部
	try-complete-lisp-symbol             ; Lispシンボル名全体
	))
;; 補完キーバインド
(global-set-key (kbd "C-;") 'hippie-expand)
