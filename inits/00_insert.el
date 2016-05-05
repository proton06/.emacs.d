;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; テンプレート設定
;;ファイル作成時にテンプレートを挿入する
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert "\\.c" "template.c")
(define-auto-insert "\\.cpp$" "template.cpp")
(define-auto-insert "main\\.cpp$" "template_programming_contest.cpp")
(define-auto-insert "\\.plt" "template.plt")
(define-auto-insert "\\.py" "template.py")
(define-auto-insert "\\.pl" "template.pl")
(define-auto-insert "\\.sh" "template.sh")
(define-auto-insert "\.tex" "template.tex")
(define-auto-insert "progress.*\.tex" "progress_template.tex")
(define-auto-insert "progress.*\.org" "progress_template.org")
