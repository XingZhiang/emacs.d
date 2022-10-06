;;; init-ui.el  --- config for emacs theme
;;; Commentary:
;;; @overflow
;;; Code:

;; 主题
(use-package doom-themes
  :defer nil
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ; (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

; 图标
(use-package all-the-icons
  :defer nil
  )

;; modeline
(use-package doom-modeline
  :ensure t 
  :defer nil
  :init (doom-modeline-mode 1))

;; neotree目录树
(use-package neotree
  :bind(
  ("<f8>" . neotree-toggle))
  :config
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-theme 'icons)
  )


;; 对外暴露接口
(provide 'init-ui)

;;; init-ui.el ends here
