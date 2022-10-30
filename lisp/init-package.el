;;; init-package.el --- config for emacs package
;;; Commentary:
;;; @overflow
;;; Code:

(use-package restart-emacs)

;; 操作优化
(use-package crux
  :bind (("C-c k" . crux-smart-kill-line)
         ("C-a" . crux-move-beginning-of-line)
	 ("C-c ^" . crux-top-join-line)))

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))

;; 搜索
;; Settings for ivy & counsel & swiper
(use-package ivy
  :defer 1
  :demand
  :diminish
  :hook (after-init . ivy-mode)
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format "%d/%d "
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package ivy-rich
  :hook (after-init . ivy-rich-mode))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	     ("C-h b" . counsel-descbinds)
	     ("C-h f" . counsel-describe-function)
	     ("C-h v" . counsel-describe-variable)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)
	 ("C-c s" . counsel-rg)
	 ("C-c C-s" . counsel-ag)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t))

;; 调整minibuffer位置
(use-package ivy-posframe
  :defer nil
  :init
  (setq ivy-posframe-display-functions-alist
	'((swiper . ivy-display-function-fallback)
	  (complete-symbol . ivy-posframe-display-at-point)
	  (counsel-M-x . ivy-posframe-display-at-frame-center)
	  (counsel-find-file . ivy-posframe-display-at-frame-center)
	  (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
	  (t . ivy-posframe-display-at-frame-center))))
(ivy-posframe-mode 1)

;; 补全
;; Settings for company
(use-package company
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config (setq company-minimum-prefix-length 1
                company-selection-wrap-around t))

;; 语法检查
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

;; 彩虹括号
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


;; 区域选择快捷键
(use-package expand-region
  :bind ("C-=" . er/expand-region))


;; 打开上次会话
;; (use-package session
;;  :hook (after-init-hook . session-initialize))

;; vterm 终端
(use-package vterm
    :ensure t)

;暴露外部接口
(provide 'init-package)

;;; init-package.el ends here
