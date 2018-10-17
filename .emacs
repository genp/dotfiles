(show-paren-mode)  
(transient-mark-mode t)
  ;--------------------;
  ; Enable MATLAB mode ;
  ; -------------------;
  (add-to-list 'load-path "~/.emacs.d/")
  (load-file "~/.emacs.d/themes/cyberpunk-theme.el")
  (load-file "~/.emacs.d/themes/rainbow-delimiters.el")
  ;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
  (add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
  (setq matlab-indent-function t)
  (global-auto-revert-mode t)  
  (defun my-matlab-mode-hook ()
    (setq matlab-indent-function t)  ; if you want function bodies indented
    (setq fill-column 76)            ; where auto-fill should wrap
    (turn-on-auto-fill))

  (setq matlab-mode-hook 'my-matlab-mode-hook)
  (autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
 ;:* Initialise aucTeX
     ;:*(require 'tex-site)
     ;:*=======================
     ;:* load TeX-toolbar
     ;:*(require 'tex-toolbar)
     ;:*=======================
     ;:* autoload style files
     (setq TeX-auto-save t)
     (setq TeX-parse-self t)
     ;:*=======================
     ;; The documentstyle command is usually near the beginning.
     (setq-default TeX-auto-parse-length 200)
     (setq LaTeX-default-options "a4paper,12pt,german,normalheadings")
     (setq-default TeX-master t)
     ;:* 
     (add-hook 'latex-mode-hook 
               (function (lambda ()
                           (local-set-key (quote [228]) (quote "\"a"))
                           (local-set-key (quote [246]) (quote "\"o"))
                           (local-set-key (quote [252]) (quote "\"u"))
                           (local-set-key (quote [223]) (quote "\"s"))
                           (local-set-key (quote [196]) (quote "\"A"))
                           (local-set-key (quote [214]) (quote "\"O"))
                           (local-set-key (quote [220]) (quote "\"U"))
                                             
     (setq ispell-extra-args '("-t"))       ; start ispell in TeX mode
                           )))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

(require 'locate)
 (global-set-key (kbd "C-c l") 'locate)
