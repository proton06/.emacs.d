;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 起動設定
;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)
;; scratch bufferを白紙に
(setq initial-scratch-message "")
; 起動時ウィンドウ最大化
(set-frame-parameter nil 'fullscreen 'maximized)
