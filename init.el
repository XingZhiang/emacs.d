
;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; @overflow
;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.
;;; Code:

;; 加载配置文件
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)
(require 'init-package)
(require 'init-lsp)
(require 'init-lang)
(require 'init-org)
(require 'init-dap)
(require 'init-git)

(when (file-exists-p custom-file)
  (load-file custom-file))


(put 'downcase-region 'disabled nil)


;;; init.el ends here

