;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; LoadPath
;; load-pathを再帰的に追加。
(defun add-to-load-path (&rest paths)
(let (path)
    (dolist (path paths paths)
    (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
    (add-to-list 'load-path default-directory)
     (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
         (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elpa")
(add-to-load-path "site-lisp")

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(cd "~/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; eww
;;; google で検索する
;(setq eww-search-prefix "http://www.google.co.jp/search?q=")
;;; eww を複数起動する (eww-list-buffers(kbd S)で生成した eww を一覧表示できる)
;(defun eww-mode-hook--rename-buffer ()
;  "Rename eww browser's buffer so sites open in new page."
;  (rename-buffer "eww" t))
;(add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)
;;; クイック検索
;(defun eww-mode-hook--rename-buffer ()
;  "Rename eww browser's buffer so sites open in new page."
;  (rename-buffer "eww" t))
;(add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)
;;; 画像非表示
;(defun eww-disable-images ()
;  "eww で画像表示させない"
;  (interactive)
;  (setq-local shr-put-image-function 'shr-put-image-alt)
;  (eww-reload))
;(defun eww-enable-images ()
;  "eww で画像表示させる"
;  (interactive)
;  (setq-local shr-put-image-function 'shr-put-image)
;  (eww-reload))
;(defun shr-put-image-alt (spec alt &optional flags)
;  (insert alt))
;;; はじめから非表示
;(defun eww-mode-hook--disable-image ()
;  (setq-local shr-put-image-function 'shr-put-image-alt))
;(add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)
;;;;; helm-eww-bookmarks
;(require 'helm-eww-bookmark)
;(define-key eww-mode-map "B" 'helm-eww-bookmark)
;;;;; ace-link
;(require 'ace-link)
;(eval-after-load 'eww '(define-key eww-mode-map "f" 'ace-link-eww))
;(ace-link-setup-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; dired+
;(require 'dired+)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; MAGIT
(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; sequential-command-config
(require 'sequential-command-config)
(global-set-key (kbd "C-a") 'seq-home)
(global-set-key (kbd "C-e") 'seq-end)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; point-undo
(require 'point-undo)
(define-key global-map [f7] 'point-undo)
(define-key global-map [S-f7] 'point-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; undohist
(require 'undohist)
(undohist-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; smooth-scroll
;(require 'smooth-scroll)
;(smooth-scroll-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;auto-install設定
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Migemo
(require 'migemo)
(setq migemo-command "C:/Users/fukumoto/home/.emacs.d/migimo/cmigemo")
(setq migemo-options '("-q" "--emacs"))

; Set your installed path
(setq migemo-dictionary "C:/Users/fukumoto/home/.emacs.d/migimo/dict/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; helm
(require 'helm-config)
(helm-mode 1)
(helm-migemo-mode 1)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-s") 'helm-select-action)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c r") 'helm-recentf)
(global-set-key (kbd "C-c f") 'helm-for-files)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ace-isearch
(require 'ace-isearch)
(global-ace-isearch-mode 1)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/mySnippets" ;; 自分用のスニペットフォルダ
	"~/.emacs.d/snippets"
	))
;; yas 起動
(yas-global-mode 1)
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Redo+
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(global-set-key (kbd"C-M-z") 'redo)
(global-set-key (kbd"C-x C-z") 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; eshell
(eval-after-load 'esh-opt
  '(progn (require 'eshell-prompt-extras)
          (setq eshell-highlight-prompt nil
                eshell-prompt-function 'epe-theme-lambda)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
(sp-pair "r\'" "\'")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; other option
;;ツールバーを消す
(tool-bar-mode -1)
;; スクロールバーを消す
;(scroll-bar-mode -1)
;(setq scroll-step 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 起動設定
;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)
;; scratch bufferを白紙に
(setq initial-scratch-message "")
; 起動時ウィンドウ最大化
(set-frame-parameter nil 'fullscreen 'maximized)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; highlight
(global-hl-line-mode t)                   ;; 現在行をハイライト
(show-paren-mode t)                       ;; 対応する括弧をハイライト
(setq show-paren-style 'mixed)            ;; 括弧のハイライトの設定。
(transient-mark-mode t)                   ;; 選択範囲をハイライト
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(flycheck-error-list-info ((t (:inherit success))))
 '(hl-line ((t (:background "gray12"))))
 '(show-paren-match ((t (:background "SteelBlue4" :foreground "white"))))
 '(vhl/default-face ((t (:background "gray15")))))

;; キーバインド
;; globalなC-zをUNDOに
(global-set-key (kbd"C-z") 'undo)
;; 置換
(global-set-key (kbd "C-x C-p") 'query-replace)
;; 正規表現置換
(global-set-key (kbd "C-x p") 'replace-regexp)
;; eshell
(global-set-key (kbd "C-c b") 'eshell)
;; C-hでBackSpace
(global-set-key (kbd "C-h") 'delete-backward-char)
;; M-hでbackward-kill-word
(global-set-key (kbd "M-h") 'backward-kill-word)
;; eval-region
(global-set-key (kbd "C-c e") 'eval-region)
;; package-install
(global-set-key (kbd "C-c p") 'package-install)


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; テンプレート設定
;;ファイル作成時にテンプレートを挿入する
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert "\\.c" "template.c")
(define-auto-insert "\\.cpp" "template.cpp")
(define-auto-insert "\\.plt" "template.plt")
(define-auto-insert "\\.py" "template.py")
(define-auto-insert "\\.pl" "template.pl")
(define-auto-insert "\\.sh" "template.sh")
(define-auto-insert "\.tex" "template.tex")
(define-auto-insert "progress.*\.tex" "progress_template.tex")



;; 選択範囲を直接編集できるように
(delete-selection-mode t)

;; ビープ音を消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
		    :foreground "#f0f8ff"  ;;行番号の色
		    :height 0.9)


;; GCを減らして軽くする(デフォルトの10倍)
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; インデント設定
;; TABキーの挙動を設定
(setq c-tab-always-indent nil)

;; 自動改行，インデント
(setq c-auto-newline t)

;; 空白を一度に削除
(setq c-hungry-delete-key t)

;; c, c++ mode hook
(defun my-c-c++-mode-init ()
  ;; コードスタイル
  (c-set-style "java")
  ;; オフセット
  (setq c-basic-offset 4)
  ;; タブ幅
  (setq tab-width 4)
  )
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

;; latex mode hook
(defun my-latex-mode-init ()
  ;; タブ幅
  (setq tab-width 2)
  )
(add-hook 'latex-mode-hook 'my-latex-mode-init)

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

;; 空白の可視化
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
			 trailing       ; 行末
			 ;;tabs           ; タブ
			 spaces         ; スペース
			 empty          ; 先頭/末尾の空行
			 space-mark     ; 表示のマッピング
			 ;;tab-mark       ; タブマーク
			 ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
	;; WARNING: the mapping below has a problem.
	;; When a TAB occupies exactly one column, it will display the
	;; character ?\xBB at that column followed by a TAB which goes to
	;; the next TAB column.
	;; If this is a problem for you, please, comment the line below.
	(tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)

;; 可視色設定
(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
		    :background my/bg-color
		    :foreground "DeepPink"
		    :underline t)
(set-face-attribute 'whitespace-tab nil
		    :background my/bg-color
		    :foreground "LightSkyBlue"
		    :underline t)
(set-face-attribute 'whitespace-space nil
		    :background my/bg-color
		    :foreground "GreenYellow"
		    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
		    :background my/bg-color)

;; テーマ
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(flycheck-chktexrc "C:/Users/fukumoto/home/.emacs.d/config/flycheck/.chktexrc")
 '(flycheck-flake8-maximum-line-length 120)
 '(flycheck-flake8rc "C:/Users/fukumoto/home/.emacs.d/config/flycheck/.flake8rc")
 '(inhibit-startup-screen t))






;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;;(when
;;    (load
;;     (expand-file-name "~/.emacs.d/elpa/package.el"))
;;  (package-initialize))

;;auto-install設定
;;起動時にEmacsWikiのページ名を補完候補に加える
;(auto-install-update-emacswiki-package-name t)
;; install-elisp.el互換モードにする
;(auto-install-compatibility-setup)
;; ediff関連のバッファを１つのフレームにまとめる
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; パッケージ管理
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
