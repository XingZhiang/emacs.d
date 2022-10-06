
;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; @overflow
;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;; 加载配置文件
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)
(require 'init-package)
(require 'init-lsp)

(when (file-exists-p custom-file)
  (load-file custom-file))




;;; init.el ends here

(put 'downcase-region 'disabled nil)
