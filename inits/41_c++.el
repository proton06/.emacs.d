
(require 'cc-mode)
 
;; c-mode-common-hook は C/C++ の設定
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "java") ;; 字下げスタイル
            (setq indent-tabs-mode nil)  ;; タブは利用しない
            (setq c-basic-offset 4)      ;; indent は 2 スペース
            ))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; c, c++ mode hook
;; (defun my-c-c++-mode-init ()
;;   ;; コードスタイル
;;   (c-set-style "java")
;;   ;; オフセット
;;   (setq c-basic-offset 4)
;;   ;; タブ幅
;;   (setq-default c-basic-offset 4
;;                 tab-width 4
;;                 indent-tabs-mode t))
;; (add-hook 'c-mode-hook 'my-c-c++-mode-init)
;; (add-hook 'c++-mode-hook 'my-c-c++-mode-init)
