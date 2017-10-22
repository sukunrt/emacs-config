;; Miscellaneous configurations I like


;; no tabs
(setq-default indent-tabs-mode nil)


;; Most important thing that i've found
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(setq confirm-kill-emacs 'yes-or-no-p)


(setq tramp-default-method "ssh")

(setq confirm-nonexistent-file-or-buffer nil)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(defun pidof (name)
  (with-temp-buffer
    (if (zerop (shell-command (concat "pidof " name) (current-buffer)))
        (string-to-number (buffer-string))
      nil)))


;;utf-8 everywhere
;;Ripped off from sanjoy Das's .emacs config
(defun srt-utf8-everywhere ()
  (prefer-coding-system                   'utf-8)
  (set-language-environment               "utf-8")
  (set-default-coding-systems             'utf-8)
  (setq file-name-coding-system           'utf-8)
  (setq default-buffer-file-coding-system 'utf-8)
  (setq coding-system-for-write           'utf-8)
  (setq agda2-program-name "/Users/sanjoy/.cabal/bin/agda")
  (set-keyboard-coding-system             'utf-8)
  (set-terminal-coding-system             'utf-8)
  (set-clipboard-coding-system            'utf-8)
  (set-selection-coding-system            'utf-8)
  (setq default-process-coding-system     '(utf-8 . utf-8))
  (add-to-list 'auto-coding-alist         '("." . utf-8)))

(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))
