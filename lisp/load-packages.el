 ;; Install these packages
(use-package magit
  :ensure t)

(use-package zenburn-theme
  :ensure t
  :pin "melpa")

(use-package projectile
  :ensure t)

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (projectile-mode 1))

;; PYTHON Specific Packages
(use-package py-autopep8
  :ensure t)

;; Scheme Package

(use-package geiser
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package tex
  :ensure auctex
  :pin "gnu")

(use-package php-mode
  :ensure t)

(use-package exec-path-from-shell
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package multiple-cursors
  :ensure t)


(use-package company
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package company-go
  :ensure t)

(use-package go-eldoc
  :ensure t)
