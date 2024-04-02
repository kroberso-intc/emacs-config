;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes
   '("f23c609d5336a9f864f66d389d6829cbad44bf56471cf82d717172ecc58af0c7" "0ab2aa38f12640ecde12e01c4221d24f034807929c1f859cbca444f7b0a98b3a" "e3b2bad7b781a968692759ad12cb6552bc39d7057762eefaf168dbe604ce3a4b" default))
 '(ediff-split-window-function 'split-window-horizontally)
 '(package-selected-packages '(flycheck cl-libify impatient-mode magit))
 '(verilog-align-ifelse t)
 '(verilog-auto-delete-trailing-whitespace t)
 '(verilog-case-indent 3)
 '(verilog-cexp-indent 3)
 '(verilog-indent-level-behavioral 3)
 '(verilog-indent-level-declaration 3)
 '(verilog-indent-level-module 3))

;; disable menu bar
(menu-bar-mode -1)

;; keybindings                                                                                                                                                                                                    
(global-set-key (kbd "C-x C-k") (lambda ()
                                  (interactive)
                                  (kill-buffer (current-buffer))))

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(put 'upcase-region 'disabled nil)

;; Turn off tab indents
(setq-default indent-tabs-mode nil)

;; Mode for quartus project files
(add-to-list 'auto-mode-alist '("\\.sdc\\'" . tcl-mode))
(add-to-list 'auto-mode-alist '("\\.qsf\\'" . tcl-mode))
(add-to-list 'auto-mode-alist '("\\.qpf\\'" . tcl-mode))

;; Mode for OFS settings files
(add-to-list 'auto-mode-alist '("\\.ofss\\'" . conf-mode))

;; use melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Packages
;; Use project.el
(require 'project)

;; custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'dracula t)

(put 'downcase-region 'disabled nil)

;; Custom github markdown
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
           (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
         (current-buffer)))

;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
