;;; init-org.el --- config for org mode
;;; Commentary:
;;; @overflow
;;; Code:

(use-package org-superstar
  :hook (org-mode . (lambda() (org-superstar-mode 1))))

(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))


;; latex即时预览
(use-package org-latex-impatient
  :defer t
  :hook (org-mode . org-latex-impatient-mode)
  :init
  (setq org-latex-impatient-tex2svg-bin
        ;; location of tex2svg executable
        "~/npm/node_modules/mathjax-node-cli/bin/tex2svg"))


(provide 'init-org)

;;; init-org.el ends here
