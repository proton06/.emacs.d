(require 'powerline)
(powerline-default-theme)

(set-face-attribute 'mode-line nil
                    :foreground "gainsboro"
                    :background "steel blue"
                    :box nil)

(set-face-attribute 'mode-line-inactive nil
                    :foreground "gainsboro"
                    :background "steel blue"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "gainsboro"
                    :background "DodgerBlue4"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "gainsboro"
                    :background "midnight blue"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-inactive1 nil
                    :foreground "gainsboro"
                    :background "SlateBlue4"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-inactive2 nil
                    :foreground "gainsboro"
                    :background "MediumPurple4"
                    :inherit 'mode-line)
