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
  (load-theme 'doom-palenight t)

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


(use-package ace-window
  :functions hydra-frame-window/body
  :bind ([remap other-window] . ace-window)
  :custom-face
  (aw-leading-char-face ((t (:inherit 'error :bold t :height 1.2))))
  (aw-mode-line-face ((t (:inherit 'mode-line-emphasis :bold t))))
  :preface
  (defun toggle-window-split ()
    (interactive)
    (if (= (count-windows) 2)
        (let* ((this-win-buffer (window-buffer))
               (next-win-buffer (window-buffer (next-window)))
               (this-win-edges (window-edges (selected-window)))
               (next-win-edges (window-edges (next-window)))
               (this-win-2nd (not (and (<= (car this-win-edges)
                                          (car next-win-edges))
                                       (<= (cadr this-win-edges)
                                          (cadr next-win-edges)))))
               (splitter
                (if (= (car this-win-edges)
                       (car (window-edges (next-window))))
                    'split-window-horizontally
                  'split-window-vertically)))
          (delete-other-windows)
          (let ((first-win (selected-window)))
            (funcall splitter)
            (if this-win-2nd (other-window 1))
            (set-window-buffer (selected-window) this-win-buffer)
            (set-window-buffer (next-window) next-win-buffer)
            (select-window first-win)
            (if this-win-2nd (other-window 1))))))
  :hook (after-init . ace-window-display-mode)
  :config
  ;; (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

  (with-eval-after-load 'hydra
    ;; https://github.com/abo-abo/ace-window/wiki/Hydra
    ;; hydra-frame-window is designed from `ace-window' and
    ;; matches aw-dispatch-alist with a few extra
    (defhydra hydra-frame-window (:color red :hint nil)
      "
^Frame^                 ^Window^      Window Size^^^^^^    ^Text Zoom^               (__)
_0_: delete             _t_oggle        ^ ^ _k_ ^ ^            _=_                   (oo)
_1_: delete others      _s_wap          _h_ ^+^ _l_            ^+^             /------\/
_2_: new                _d_elete        ^ ^ _j_ ^ ^            _-_            / |    ||
_F_ullscreen            ^ ^             _b_alance^^^^          ^ ^        *  /\---/\  ~~  C-c w/C-x o w
"
      ("0" delete-frame :exit t)
      ("1" delete-other-frames :exit t)
      ("2" make-frame  :exit t)
      ("b" balance-windows)
      ("s" ace-swap-window)
      ("F" toggle-frame-fullscreen)
      ("t" toggle-window-split)
      ("d" ace-delete-window :exit t)
      ("-" text-scale-decrease)
      ("=" text-scale-increase)
      ("h" shrink-window-horizontally)
      ("k" shrink-window)
      ("j" enlarge-window)
      ("l" enlarge-window-horizontally)
      ("q" nil "quit"))
    (add-to-list 'aw-dispatch-alist '(?w hydra-frame-window/body) t)
    (bind-key "C-c w" #'hydra-frame-window/body)))

;; 对外暴露接口
(provide 'init-ui)

;;; init-ui.el ends here
