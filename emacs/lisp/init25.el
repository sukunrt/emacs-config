(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq package-check-signature nil);
;;Keybindings
(load "keybindings.el")

;;UI
(load "ui.el")


;;Packages
(load "install-packages.el")
(load "load-packages.el")

;;Python Mode
(load "python-mode-config.el")

(ido-mode t)
(setq ido-create-new-buffer 'always)


;;Mode specific Commands
;; C mode
(setq c-default-style "linux"
      c-basic-offset 4)

;;Misc Defaults
(load "misc.el")
(srt-utf8-everywhere)
(setq system-uses-terminfo nil)

(defun new-shell (name)
  "Opens a new shell buffer with the given name in
asterisks (*name*) in the current directory and changes the
prompt to 'name>'."
  (interactive "sName: ")
  (pop-to-buffer (concat "*" name "*"))
  (unless (eq major-mode 'shell-mode)
    (shell (current-buffer))
    (sleep-for 0 200)
    (delete-region (point-min) (point-max))
    (comint-simple-send (get-buffer-process (current-buffer))
                        (concat "export PS1=\"\033[33m" name "\033[0m:\033[35m\\W\033[0m>\""))))
(global-set-key (kbd "C-c s") 'new-shell)



;;Mode specific Commands
;; C mode
(setq c-default-style "linux"
      c-basic-offset 4)


;; Octave mode that I don't really need
(setq inferior-octave-prompt ">> ")
(exec-path-from-shell-initialize)



(setq yas-prompt-functions '(yas-ido-prompt))
(setq yas-indent-line 'auto)
(setq yas-also-indent-first-line t)


;; WEBMode config that I need to redo some point in the future
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode)) ;; Override?
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))




(defun my-web-mode-hook ()
  "web-mode settings"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (web-mode-set-content-type "jsx")
  (tern-mode 1))

(add-hook 'web-mode-hook  'my-web-mode-hook)

(load "go-mode-config.el")
(add-hook 'go-mode-hook 'srt-go-mode-config)
