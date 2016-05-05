;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; eww
;; google で検索する
(setq eww-search-prefix "http://www.google.co.jp/search?q=")

;;; eww を複数起動する (eww-list-buffers(kbd S)で生成した eww を一覧表示できる)
;(defun eww-mode-hook--rename-buffer ()
;  "Rename eww browser's buffer so sites open in new page."
;  (rename-buffer "eww" t))
;(add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)

;; クイック検索
;(defun eww-mode-hook--rename-buffer ()
;  "Rename eww browser's buffer so sites open in new page."
;  (rename-buffer "eww" t))
;(add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)

;; 画像非表示
(defun eww-disable-images ()
  "eww で画像表示させない"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image-alt)
  (eww-reload))
(defun eww-enable-images ()
  "eww で画像表示させる"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image)
  (eww-reload))
(defun shr-put-image-alt (spec alt &optional flags)
  (insert alt))
;; はじめから非表示
(defun eww-mode-hook--disable-image ()
  (setq-local shr-put-image-function 'shr-put-image-alt))
(add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)

;;;; helm-eww-bookmarks
(require 'helm-eww-bookmark)
(eval-after-load "eww"
  `(progn
     (define-key eww-mode-map "B" 'helm-eww-bookmark)
    ))

;;;; ace-link
(require 'ace-link)
(eval-after-load 'eww '(define-key eww-mode-map "e" 'ace-link-eww)) ;; key-binding
(ace-link-setup-default)
(require 'org)
(define-key org-mode-map (kbd "C-c M-o") 'ace-link-org)

;;; text-property-any -> next-single-property-change
;;; にしないと一部のリンクが辿れないので再定義
(defun ali--eww-collect-references ()
  "Collect the positions of visible links in the current `eww' buffer."
  (save-excursion
    (save-restriction
      (narrow-to-region
       (window-start)
       (window-end))
      (goto-char (point-min))
      (let ((skip (next-single-property-change (point) 'help-echo))
            candidates)
        (while (setq skip (text-property-not-all
                           skip (point-max) 'help-echo nil))
          (goto-char skip)
          (push skip candidates)
          (setq skip (next-single-property-change (point) 'help-echo)))
        (nreverse candidates)))))

;; key-binding
(global-set-key (kbd"C-c w") 'eww)
(global-set-key (kbd"C-c C-w") 'weblio-ejje)
(eval-after-load 'eww '(define-key eww-mode-map "w" 'scroll-up))
(eval-after-load 'eww '(define-key eww-mode-map "c" 'eww-copy-page-url))
(eval-after-load 'eww '(define-key eww-mode-map "L" 'eww-list-bookmarks))


;; google 検索画面で白色にならないようにする
(defvar eww-disable-colorize t)
(defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
  (unless eww-disable-colorize
    (funcall orig start end fg)))
(advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
(advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
(defun eww-disable-color ()
  "eww で文字色を反映させない"
  (interactive)
  (setq-local eww-disable-colorize t)
  (eww-reload))
(defun eww-enable-color ()
  "eww で文字色を反映させる"
  (interactive)
  (setq-local eww-disable-colorize nil)
  (eww-reload))

;; 指定のサイトで初期カーソル位置を設定する
(defvar eww-data)
(defun eww-current-url ()
  "バージョン間の非互換を吸収する。"
  (if (boundp 'eww-current-url)
      eww-current-url                   ;emacs24.4
    (plist-get eww-data :url)))         ;emacs25

(defun eww-set-start-at (url-regexp search-regexp)
  "URL-REGEXPにマッチするURLにて、SEARCH-REGEXPの行から表示させる"
  (when (string-match url-regexp (eww-current-url))
    (goto-char (point-min))
    (when (re-search-forward search-regexp nil t)
      (recenter 0))))

(defun region-or-read-string (prompt &optional initial history default inherit)
  "regionが指定されているときはその文字列を取得し、それ以外では`read-string'を呼ぶ。"
  (if (not (region-active-p))
      (read-string prompt initial history default inherit)
    (prog1
        (buffer-substring-no-properties (region-beginning) (region-end))
      (deactivate-mark)
      (message ""))))

(defun eww-render--after (&rest _)
  (eww-set-start-at "www.weblio.jp" "^ *Weblio 辞書")
  (eww-set-start-at "ncode.syosetu.com" "^.*[^(]作者")
  ;(eww-set-start-at "ncode.syosetu.com" "^ *×閉じる ")
  ;; 他のサイトの設定も同様に追加できる
  )
(advice-add 'eww-render :after 'eww-render--after)

;;; weblio
(defun weblio (str)
  (interactive (list
                (region-or-read-string "Weblio: ")))
  (eww-browse-url (format "http://www.weblio.jp/content/%s"
                      (upcase (url-hexify-string str)))))
;;; weblio 英和・和英辞典
(defun weblio-ejje (str)
  (interactive (list
                (region-or-read-string "Weblio ejje: ")))
  (eww-browse-url (format "http://ejje.weblio.jp/content/%s"
                      (upcase (url-hexify-string str)))))
;;; wikipedia
(defun wikipedia (str)
  (interactive (list
                (region-or-read-string "Wikipedia: ")))
  (eww-browse-url (format "http://ja.wikipedia.org/wiki/%s"
                      (upcase (url-hexify-string str)))))

