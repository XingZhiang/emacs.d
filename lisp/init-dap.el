;;; init-dap,el --- config for dap-mode
;;; Commentary:
;;; @overflow
;;; Code:

(use-package dap-mode
  :diminish
  :hook ((lsp-mode    . dap-mode)
         (dap-mode    . dap-ui-mode)
	 (dap-mode    . dap-tooltip-mode)
         (python-mode . (lambda() (require 'dap-python)))
         (go-mode     . (lambda() (require 'dap-go)))
	 (c-mode      . (lambda() (require 'dap-cpptools)))
	 (c++-mode    . (lambda() (require 'dap-cpptools)))))

(provide 'init-dap)

;;; init-dap.el ends here
