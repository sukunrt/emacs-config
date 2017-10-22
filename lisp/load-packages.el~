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

(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "meesho"
   :default t
   :client-id "26096640289.138768336000"
   :client-secret "2ee3b66a20bf5fd84c8b0f87afc78a70"
   :token "xoxp-26096640289-44993412743-140180497703-b17b95148087daec6583301797f2d8bf"
   :subscribed-channels '()))


(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

(use-package company
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package company-go
  :ensure t)

(use-package go-eldoc
  :ensure t)
