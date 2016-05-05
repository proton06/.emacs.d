;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; org-mode

;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org/TODO"))

;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")
(setq org-mobile-directory "~/org/mobileorg")
(setq org-mobile-files '("~/org" "~/org/TODO" "~/org/note" "~/org/buffer" "~/org/computer" "~/org/favorite_music" "~/org/game"))


;; key-binding
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
 	
(add-hook 'org-mode-hook
          '(lambda ()
	     (local-set-key (kbd "M-h") 'backward-kill-word)
	     (local-set-key (kbd "C-C C-h") 'org-mark-element)
	     (local-set-key (kbd "C-a") 'seq-home)
	     (local-set-key (kbd "C-e") 'seq-end)
	     ))

;; TODO状態
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

;; org-captureで2種類のメモを扱うようにする
(setq org-capture-templates
      '(("t" "New TODO" entry
         (file+headline "~/org/TODO/TODO.org" "ToDo")
         "* TODO %?\n\n")
        ("m" "Memo" entry
         (file+headline "~/org/memo.org" "memo")
         "* %U%?\n%i\n%a")
	("f" "良曲" item
         (file+headline "~/org/favorite_music/favorite_music.org" "良曲")
         "- [ ] %? | " :prepend t)
	("k" "難読漢字" item
         (file+headline "~/org/note/kanji.org" "難読漢字")
         "- %?()" :prepend t)))

;; DONE をまとめて archive する関数
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'file))


(custom-set-variables
 '(org-agenda-files nil)
 '(org-startup-indented t)) ;; STARTUP: indent を常に有効


;; LaTeX 設定
(require 'ox-latex)
;; LaTeX 変換
(add-to-list 'org-latex-classes
             '("progress"
               "\\documentclass[twocolumn]{jarticle}
\\setlength{\\topmargin}{-45pt}
\\setlength{\\oddsidemargin}{-7.5mm}
\\setlength{\\textheight}{24.1cm}
\\setlength{\\textwidth}{17.4cm}
\\setlength{\\columnsep}{11mm}
[NO-PACKAGES]
[NO-DEFAULT-PACKAGES]
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{amsmath}
\\usepackage{progresstitle}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-with-hyperref nil) ;; hypersetup が付与されてコンパイルが通らないため

;;; LaTeX 形式のファイル PDF に変換するためのコマンド
;; (setq org-latex-pdf-process
;;       '("platex %f"
;;         "platex %f"
;;         "dvipdfmx %b.dvi"))

;; (setq org-latex-pdf-process
;;       '("pdfplatex %f"))

(setq org-latex-pdf-process
      '("pdfplatex %f" "pdfplatex %f"))

;; #+LATEX_CLASSを書かないとき，jsarticleクラス
(setq org-latex-default-class "jsarticle")

;;; org-modeでlatexの関数に色を付ける。
;; キーワード用にFaceを作成 (1)
;; (make-face 'emphasis-face-red)
;; (make-face 'emphasis-face-blue)
;; (set-face-foreground 'emphasis-face-red "red")
;; (set-face-foreground 'emphasis-face-blue "blue")
;; ;; キーワード定義 (2)
;; (font-lock-add-keywords 'org-mode
;; 			'(
;; 			  ("\\\\begin{.*}" . 'emphasis-face-red)
;; 			  ("\\\\end{.*}" . 'emphasis-face-red)
;; 			  ("\\\\[1-9a-zA-Z]+" . 'emphasis-face-blue)
;; 			  ))
