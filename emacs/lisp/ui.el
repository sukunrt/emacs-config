;; UI Configurations for emacs

(set-default-font "Inconsolata-13")
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(set-cursor-color "firebrick")
(show-paren-mode 1) ;; how matching parenthesis
(setq show-paren-delay 0) 
(setq-default line-spacing 6);; 
(blink-cursor-mode 1)
(column-number-mode)

(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(fullscreen)


(setq sml/no-confirm-load-theme t)
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'powerline)
(sml/setup)
