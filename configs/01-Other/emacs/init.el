(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode go-mode magit centaur-tabs company vscode-dark-plus-theme use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack Nerd Font" :slant normal :weight normal :height 100 :width normal)))))

(setq make-backup-files nil)         ; Отключить создание резервных копий
(setq auto-save-default nil)         ; Отключить автосохранение
(setq inhibit-startup-message t)     ; Отключить начальный экран
(global-display-line-numbers-mode 1) ; Современный способ
(tool-bar-mode -1)                   ; Выключить паннель инструментов
(scroll-bar-mode -1)                 ; Выключить строку прокрутки

(ido-mode 1)                         ; Включить ido-mode
(ido-everywhere 1)                   ; Включить ido для всех команд


;; Убедитесь, что пакет 'package' загружен
(require 'package)

;; Добавьте MELPA в список источников пакетов
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Установите use-package, если он еще не установлен
(unless (package-installed-p 'use-package)
  (package-refresh-contents)  ;; Обновите список пакетов
  (package-install 'use-package))

;; Загрузите use-package
(require 'use-package)

;; vscode theme
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

;; Company-mode (автодополнение)
;; Установка company-mode, если он не установлен
(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))

;; Включение company-mode
(require 'company)  ;; Убедитесь, что company-mode загружен
(add-hook 'after-init-hook 'global-company-mode)

;; Включение company-files для автодополнения путей к файлам
(add-to-list 'company-backends 'company-files)

;; Настройки company-mode
(setq company-minimum-prefix-length 1) ; Минимальная длина префикса для автодополнения
(setq company-idle-delay 0.3) ; Задержка перед показом подсказок

;; Git | It's Magit
;; M-x package-refresh-contents RET
;; M-x package-install RET magit RET

;; Поддрежка GO
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'go-mode)
  (package-refresh-contents)
  (package-install 'go-mode))

(add-hook 'go-mode-hook (lambda ()
                          (setq tab-width 4)
                          (setq indent-tabs-mode 1)))

(unless (package-installed-p 'yaml-mode)
  (package-refresh-contents)
  (package-install 'yaml-mode))

;; Настройка yaml-mode
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
