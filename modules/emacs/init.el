;; Remove UI unnecessary things
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ;; Disable visible scrollbar
(tool-bar-mode -1) ;; Disable toolbar
(tooltip-mode -1) ;; Disable tooltips
(set-fringe-mode 10) ;; Give some breathing room

(menu-bar-mode -1) ;; Disable menu bar

;; Visual flash on error
(setq visible-bell t)

;; Font
(set-face-attribute 'default nil :font "FiraCode Nerd Font") ;; set :height 200 for larger font size

;; Built-in theme
;; (load-theme 'tango-dark)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; Enable line and column numbers for all buffers
(global-display-line-numbers-mode t)
(column-number-mode)

;; Disable line numbers for some modes
(dolist (mode '(term-mode-hook
                ;; org-mode-hook
		shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Completion framework
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ;; ("C-j" . ivy-next-line)
         ;; ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ;; ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ;; ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Replace default buffers with Ivy-enhanced ones
(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))
;;  :config
;;  (setq ivy-initial-inputs-alist nil)) ;; Don't start search with ^

;; Include keybinds and descriptions on Ivy
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))


;; Better help pages
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


;; Doom modeline bc cute af
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Catppuccin FTW
(use-package catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)


;; Rainbow colors for brackets
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


;; Helper buffer on chained key presses
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1.5))

;; Open new buffers on vertical split instead of horizontal
(setq
 split-width-threshold 0
 split-height-threshold nil)

;; Get all the icons package. After that, do just once:
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)


;; Meow config
(use-package meow)

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))

  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("wi" . windmove-right)
   '("wn" . windmove-left)
   '("wu" . windmove-up)
   '("we" . windmove-down)
   '("wv" . split-window-right)
   '("wh" . split-window-below)
   '("wc" . delete-window)
   '("yy" . clipboard-kill-ring-save)
   '("yp" . clipboard-yank)
   '("p" . projectile-command-map)
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))

  (meow-normal-define-key
   '("/" . meow-visit)
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("'" . meow-inner-of-thing)
   '("\"" . meow-bounds-of-thing)
   ;;'("," . meow-inner-of-thing)
   ;;'("." . meow-bounds-of-thing)
   ;;'("[" . meow-beginning-of-thing)
   ;;'("]" . meow-end-of-thing)
   '("<" . meow-beginning-of-thing)
   '(">" . meow-end-of-thing)
   '("a" . meow-append)
   ;; '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-kill)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   ;;'("h" . meow-left)
   ;;'("H" . meow-left-expand)
   '("i" . meow-insert)
   ;; '("I" . meow-open-above)
   ;;'("j" . meow-next)
   ;;'("J" . meow-next-expand)
   ;;'("k" . meow-prev)
   ;;'("K" . meow-prev-expand)
   ;;'("l" . meow-right)
   ;;'("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   ;;'("o" . meow-block)
   ;;'("O" . meow-to-block)
   '("o" . meow-open-below)
   '("O" . meow-open-above)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   ;;'("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   ;;'("U" . meow-undo-in-selection)
   '("U" . undo-redo)
   ;; '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   ;; '("'" . repeat)
   '("." . repeat)
   '("<escape>" . ignore))

  (setq meow-selection-command-fallback
        '((meow-change . meow-change-char)
         (meow-kill . meow-delete)
         (meow-cancel-selection . keyboard-quit)
         (meow-pop-selection . meow-pop-grab)
         (meow-beacon-change . meow-beacon-change-char))))

(require 'meow)
(meow-setup)
(meow-global-mode 1)


;; Exit insert mode by pressing ; twice (;;) quickly
(use-package key-chord)
(setq key-chord-two-keys-delay 0.05)
(key-chord-define meow-insert-state-keymap ";;" 'meow-normal-mode)
(key-chord-mode 1)


;; Load Custom from external file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;; Projectile setup
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  ;; :bind-keymap
  ;; ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  (when (file-directory-p "~/Personal")
    (setq projectile-project-search-path '("~/Personal/Orgmind" "~/Personal/Hypermind")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))


;; Magit setup
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Org mode
(use-package org)
