;; Minimal UI
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

;; Shhh
(setq ring-bell-function (quote ignore))

;; Parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)
(electric-pair-mode 1)

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Doom themes
(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t))

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "fd")
  :config
  (evil-escape-mode 1))

;; Auto-completion
(use-package company
  :ensure t
  :config
  (global-company-mode))

;; Helm - Incremental completion and narrowing selections
(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  (setq helm-M-x-fuzzy-match t
	helm-mode-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-completion-in-region-fuzzy-match t
	helm-candidate-number-list 150
	helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; Which Key - key completion help
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " "
	which-key-prefix-prefix "+")
  :config
  (which-key-mode 1)
  (setq which-key-idle-secondary-delay 0))

;; Projectile - project management
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

(use-package helm-projectile
  :ensure t
  :init
  (setq helm-projectile-fuzzy-match t)
  :config
  (helm-projectile-on))

;; Git support
(use-package magit
  :ensure t)

;; Custom keybindings
(use-package general
  :ensure t
  :config
  
  ;; Spacebar keybindings
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"

   ;; Spacemacs style SPC menu
   "SPC" '(helm-M-x :which-key "M-x")

   ;;;; Projectile
   "pf"  '(helm-projectile-find-file :which-key "find files")

   ;;;; Files
   "ff"  '(helm-find-files :which-key "find files")

   ;;;; Windows
   "ws"  '(evil-window-split :which-key "split horizontal")
   "wv"  '(evil-window-vsplit :which-key "split vertical")
   "wk"  '(evil-window-up :which-key "up")
   "wj"  '(evil-window-down :which-key "down")
   "wh"  '(evil-window-left :which-key "left")
   "wl"  '(evil-window-right :which-key "right")
   "wd"  '(evil-window-delete :which-key "delete")

   ;;;; Buffers
   "bb"  '(helm-buffers-list :which-key "find/list buffers")
   "bd"  '(evil-delete-buffer :which-key "delete buffer")
   )

  ;; Vim normal mode keybindings
  (general-define-key
   :states '(normal emacs)
   "C-u" 'evil-scroll-up
   "[b"  'evil-prev-buffer
   "]b"  'evil-next-buffer)

  ;; Which-key prefix titles
  (which-key-add-key-based-replacements
    "SPC p" "projectile"
    "SPC f" "files"
    "SPC w" "windows"
    "SPC b" "buffers"))

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit doom-themes evil-escape evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
