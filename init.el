;
;;keyboard bindings


(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-set-key "\C-m" 'newline-and-indent)


;; the ui
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(line-number-mode t)
(column-number-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; global modules and other configuration
(require 'ido)
(ido-mode t)
(set-default-font "Consolas")
(setq-default indent-tabs-mode nil)
(add-to-list 'load-path "~/.emacs.d/")


;; package manager



;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (require 'el-get)
;;  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;;(el-get 'sync)

;; python mode
;;(load "pythonconf.el")
;;(sukun-python-mode)
(let ((base "~/.emacs.d/el-get/"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))
;;(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)
(require 'jedi)

;; c mode
(setq c-default-style "linux"
      c-basic-offset 4)


;;installing packages
(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; You don't need this one if you prefer marmalade and released versions:
;; (add-to-list 'package-archives
;;  '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)



;;scheme mode
(setq scheme-program-name "scheme48")


;;markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


