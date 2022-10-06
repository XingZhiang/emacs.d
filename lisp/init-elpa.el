;;; init-elpa.el ---  some config of elpa
;;; Commentary:
;;; @overflow
;;; Code:

;;清华镜像源
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

; use-package
(setq package-check-signature nil) ; 签名失效的情况
(require 'package)

(unless (bound-and-true-p package-initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; use-package配置
(require 'use-package)

(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  (setq use-package-verbose t))

;暴露外部接口
(provide 'init-elpa)

;;; init-elpa.el ends here
