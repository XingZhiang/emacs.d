;;; custom.el --- some custom config
;;; COmmentary:
;;; @overflow
;;; Code:

;; emacs生成配置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(vterm lua-mode lua-lsp exec-path-from-shell helm helm-xref magit session rust-mode lsp-rust-server expand-region lsp-metals scala-mode sbt-mode fira-code-mode org-latex-impatient org-superstar neotree rainbow-delimiters ivy-posframe flycheck counsel ivy-rich ivy drag-stuff crux use-package restart-emacs doom-themes doom-modeline company all-the-icons))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "FiraCode Nerd Font" :foundry "CTDB" :slant normal :weight normal :height 143 :width normal))))
 '(aw-leading-char-face ((t (:inherit 'error :bold t :height 1.2))))
 '(aw-mode-line-face ((t (:inherit 'mode-line-emphasis :bold t)))))



;;; custom.el ends here
