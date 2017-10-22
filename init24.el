(add-to-list 'load-path "~/.emacs.d/")                        ; Append the .emacs.d dir to the path

(package-initialize)
(message "hwllo-world")


;; Theme Settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")



(defconst debian-emacs-flavor 'emacs24
  "A symbol representing the particular debian flavor of emacs running.
 Something like 'emacs20, 'xemacs20, etc.")
;;Make full screen always
;; Default Modes and Settings
(require 'ido)
(ido-mode t)
(setq ido-create-new-buffer 'always)


;; Some keybindings
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key (kbd "RET") 'newline-and-indent) ;; enter for new line and indent

;;Make everything consistent with utf-8


;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


;;Mode specific Commands
;; C mode
(setq c-default-style "linux"
      c-basic-offset 4)

;;Package Manager

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://melpa.org/packages/") t)
(package-initialize)


;; MarkDown Mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'flyspell-mode) ;; Spell Checking Enabled by default.

;;Scheme Mode
(setq geiser-active-implementation '(guile))
(setq geiser-default-implementation '(guile))
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)



(load "auctex.el" nil t t)
(require 'tex-mik)

;; UI Settings

(load-theme 'zenburn t)
(set-cursor-color "firebrick")
(set-default-font "Inconsolata-14")
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(show-paren-mode 1) ;; how matching parenthesis
(setq show-paren-delay 0) ;; remove time lag in matching display
(setq-default line-spacing 12);
(blink-cursor-mode 1)
(column-number-mode) 

;;TRAMP Mode config
(setq tramp-default-method "ssh")

(require 'php-mode)
(add-hook 'php-mode-hook
	  '(lambda ()
	     (auto-complete-mode t)
	     (require 'ac-php)
	     (setq ac-sources  '(ac-source-php ) )
	     (require 'flymake-php)
	     (add-hook 'php-mode-hook 'flymake-php-load)	     
	     (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point  )   ;goto define
	     (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
	     (require 'codebug)
	     (define-key php-mode-map (kbd "C-c b") 'codebug)
	     ))
(require 'phpcbf)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1544e5f3ec892b090fac7255767850d2e3c7d8e0e579d13bbb9023ce5e3aa91e" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" default)))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(phpcbf-standard "PSR2"))




(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<C-M-b>") 'backward-sexp)

(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))

(require 'php-doc)
(add-hook 'php-mode-hook
	  (lambda ()
	    (local-set-key (kbd "M-P") 'php-insert-doc-block)))


;; ORG MODE Settings

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/organizer.org")


;; Enter cider mode when entering the clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)

;; Turn on auto-completion with Company-Mode
;;(global-company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; Replace return key with newline-and-indent when in cider mode.
(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))



;; I want an easy command for opening new shells:
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



(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (auto-complete-mode t)))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-tern))


(add-hook 'web-mode-hook
	  (lambda ()
	    (message "now set to: %s" web-mode-content-type)))

(add-hook 'web-mode-hook
	  (lambda ()
	    (if (equal web-mode-content-type "javascript")
		(web-mode-set-content-type "jsx")
	      (message "now set to: %s" web-mode-content-type))))

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(add-hook 'org-mode-hook 'org-indent-mode)


(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory temporary-file-directory)
(setq tramp-verbose 10)

(require 'deft)
(setq deft-extensions '("txt" "md" "org" "tex"))
(setq deft-strip-summary-regexp ".*")
(setq deft-directory "~/notes/")


(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(fullscreen)
