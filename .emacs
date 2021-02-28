(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(exec-path-from-shell-initialize)
(show-paren-mode)
(transient-mark-mode t)
(add-to-list 'load-path "~/.emacs.d/lisp")

(setq custom--inhibit-theme-enable nil)

(defun text-mode-theme-hook ()
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-leuven))
  ;; (color-theme-cyberpunk))

 (add-hook 'text-mode-hook
   'text-mode-theme-hook)
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)
(setq ispell-program-name "/usr/local/bin/aspell")
(setq-default show-trailing-whitespace t)

(defun git-grep-all-root ()
  "Grep a pattern across the entire repository."
  (interactive)
  (require 'grep)
  (vc-git-grep (grep-read-regexp) "\\*" (vc-git-root default-directory)))
(global-set-key (kbd "C-c g") 'git-grep-all-root)

(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 150) ; chars
              (height . 50) ; lines
              (left . 50)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 150)
              (height . 50)
              (left . 50)
              (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))
(setq inhibit-startup-screen t)

;; Set default open file directory
(setq default-directory (concat (getenv "HOME") "/"))

;;Startup with only one buffer showing
(setq inhibit-startup-screen t)

(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))
(require 'web-mode)
(require 'flycheck)
(global-flycheck-mode)
(flycheck-add-mode 'javascript-eslint 'web-mode)
(setq flycheck-eslintrc "~/.eslintrc.yml")
(setq flycheck-python-pylint-executable "/usr/local/bin/pylint")

(require 'prettier-js)
(add-hook 'web-mode-hook 'prettier-js-mode)
(defun indent-web-mode-hook ()
  "Hooks for indenting in Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'indent-web-mode-hook)
(setq prettier-js-args '(
                         "--single-quote" "true"
                         "--print-width" "88"
                         ))

  (load-file "~/.emacs.d/themes/cyberpunk-theme.el")
  (load-file "~/.emacs.d/themes/rainbow-delimiters.el")
  (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq auto-mode-alist (append
		       '(("\\.h\\'" . c++-mode)
			 ("\\.cu\\'" . c++-mode)
                         ("\\.jsx?\\'" . web-mode)
                         ("\\.tsx?\\'" . web-mode)
			 ("\\.tex\\'" . latex-mode))
		       auto-mode-alist))

(require 'locate)
 (global-set-key (kbd "C-c l") 'locate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes
   '("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "337f680a83de8fd5c66553c94fabf86d272df3c7c477118e203cde9de2b79e0b" "2ecc0e4d1ecb0da607237c2184bcb8a84b1619a5ce1d87ba109ab10d3340b7ec" "83b81b755904cad7c73c1e7d4c1db7ddbbcf007d86d5af6a2dc26cba5aba1c01" default))
 '(fci-rule-color "#383838")
 '(package-selected-packages
   '(ido-completing-read+ ido-vertical-mode flx-ido sublime-themes find-file-in-repository magit use-package company-tabnine company flycheck-ameba web-mode prettier-js exec-path-from-shell flycheck)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))


(add-hook 'after-init-hook 'global-company-mode)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)
(add-hook 'after-init-hook 'global-company-mode)

(use-package ido
  :config
  (setq ido-everywhere t
    ido-virtual-buffers t
    ido-use-faces t
    ido-default-buffer-method 'selected-window
    ido-auto-merge-work-directories-length -1)
  (ido-mode))
(use-package flx-ido :requires ido :ensure t :config (flx-ido-mode))
(use-package ido-vertical-mode :requires ido  :ensure t
  :config
  (ido-vertical-mode)
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))
(use-package ido-completing-read+ :requires ido :ensure t
  :config
  (setq	ido-cr+-max-items 50000)
  (ido-ubiquitous-mode 1))


;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x f" . magit-file-dispatch))
  :init (setq magit-completing-read-function 'magit-ido-completing-read))
(require 'vc)
(require 'vc-git)

;; fast file find in git repository
(use-package find-file-in-repository :ensure t
  :bind (("C-x C-f" . find-file-in-repository))
  :init 
  ;; ffir has a recent bug in which they added --recurse-submodules here, but that
  ;; seems incompatible with -o, so we change the command
  (add-to-list 'ffir-repository-types
	       `(".git"   . ,(lambda (dir)
			       (ffir-shell-command
				"git ls-files -zco --exclude-standard"     "\0" dir)))))
