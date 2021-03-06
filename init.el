
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq package-check-signature nil);
;;Keybindings
(load "keybindings.el")

;;UI



;;Packages
(load "install-packages.el")
(load "load-packages.el")

;;Python Mode
(load "python-mode-config.el")

(ido-mode t)
(setq ido-create-new-buffer 'always)


(load "ui.el")
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

(defun new-clean-branch (name)
  (interactive "sName: ")
  (magit-checkout "master")
  (magit-clean)
  (message name)
  (magit-git-pull "origin/master" "-q")
  (message name)
  (magit-branch name "master")
  (message name)
  (magit-checkout name))



(defun new-note ()
  (interactive)
  (find-file "/Users/anduril/personal/notes/programming_notes.org")
  (end-of-buffer))
(defalias 'nn 'new-note)



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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" default)))
 '(markdown-command "/usr/bin/pandoc" t)
 '(package-selected-packages
   (quote
    (rainbow-mode monokai-theme pyenv-mode jedi json-mode restclient writeroom-mode zenburn-theme web-mode use-package smart-mode-line-powerline-theme py-autopep8 projectile php-mode multiple-cursors markdown-mode magit go-eldoc geiser exec-path-from-shell elpy company-go auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 170 :width normal :foundry "nil" :family "Inconsolata")))))
(put 'magit-clean 'disabled nil)
