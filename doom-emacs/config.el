;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Good source of config juiciness: https://config.daviwil.com/emacs

(setq user-full-name "Tobias Gasslander"
      user-mail-address "tobias@gasslander.com")

(setq doom-theme 'doom-monokai-classic)
(setq org-directory "~/org/")
(setq display-line-numbers-type 'relative)

;; Get rid of the annoying confirm-to-exit dialog
(setq confirm-kill-emacs nil)

;; Projectile configs
(setq projectile-project-search-path '("~/Documents/projects"))

;; Neotree configs
(map! :leader
      :desc "Toggle neotree"
     "n n" #'neotree-toggle )

(setq neo-window-position 'right)
(setq neo-theme (if (display-graphic-p) 'icons 'nerd))
(setq-default neo-show-hidden-files t)
;; (setq neo-smart-open t)

;; Better window navigation
(map! "C-h" #'evil-window-left)
(map! "C-j" #'evil-window-down)
(map! "C-k" #'evil-window-up)
(map! "C-l" #'evil-window-right)

;; move line up and down
(global-set-key (kbd "M-k") 'move-text-up)
(global-set-key (kbd "M-j") 'move-text-down)

;; ESC cancels all the things
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Default to two tabs/spaces since... better
(defvar toga/std-tab-width 2)
(setq-default
  tab-width toga/std-tab-width
  evil-shift-width toga/std-tab-width
  typescript-indent-level toga/std-tab-width)

;; Tide
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; (add-hook 'typescript-mode-hook 'deno-fmt-mode)
;; (add-hook 'js2-mode-hook 'deno-fmt-mode)

(after! dtrt-indent
  (add-to-list 'dtrt-indent-hook-mapping-list '(typescript-mode javascript typescript-indent-level)))

(setq typescript-indent-level 2 js-indent-level 2)
