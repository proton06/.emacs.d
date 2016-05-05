;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; quickrun
(global-set-key (kbd"C-c q") 'quickrun-sc)
(global-set-key (kbd"C-c C-q") 'quickrun-with-arg)
;(setq quickrun-focus-p t)
(global-set-key (kbd "<f5>") 'quickrun-sc)
(global-set-key (kbd "C-<f5>") 'quickrun-shell)

(defun quickrun-sc (start end)
  (interactive "r")
  (if mark-active
	  (quickrun :start start :end end)
    (quickrun)))

;; java を utf-8 で保存しても実行できるように -encoding UTF-8 オプションを付加する．
(quickrun-add-command "java"
                      '((:exec    . ("javac -encoding UTF-8 %o %s" "%c %N %a")))
		      :override t)

(quickrun-add-command "c++/c11"
                      '((:command . "g++")
                        (:exec    . ("%c -std=c++11 %o -o %e %s"
                                     "%e %a"))
                        (:remove  . ("%e")))
                      :default "c++")
