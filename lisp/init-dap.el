;;; init-dap,el --- config for dap-mode
;;; Commentary:
;;; @overflow
;;; Code:

(use-package exec-path-from-shell
  :ensure
  :init (exec-path-from-shell-initialize))

(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)

  (require 'dap-cpptools)
  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-cpptools-setup)
  
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "dap-lldb"
         :request "launch"
         :name "LLDB::Run"
	 :gdbpath "rust-lldb"
         :target nil
         :cwd nil)))

(provide 'init-dap)


;;; init-dap.el ends here
