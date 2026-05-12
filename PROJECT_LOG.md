# PROJECT_LOG — fidchem-website

> Формат: каждая запись = одна завершённая итерация.  
> Начало новой сессии: прочти этот файл и сделай краткое резюме для пользователя.

---

## Итерация 1 — Базовая настройка нового сайта

**Дата:** 2026-05-12  
**Результат:** Hugo-сайт создан, настроен деплой на Cloudflare Pages (fidchem-web.pages.dev), базовая структура EN + ES.

---

## Итерация 2 — Пиксели, логотип, цветовая схема, изображения

**Дата:** 2026-05-12  
**Результат:**

- Добавлен Google Ads pixel (AW-17220157353) в `layouts/_default/baseof.html`
- Цветовая схема обновлена под палитру логотипа: navy `#0d1b29`, teal `#2887a8`, aqua `#40a0d0`
- Логотип добавлен в навбар и футер (белый в футере через CSS filter)
- SVG-градиент на главной обновлён под новые цвета
- Добавлены стили для иконок и фото технологий (`.tech-item-icon-wrap`, `.tech-page-photo-wrap`)
- Front matter для pcdr, pcdo, pcds, gloio обновлён: `icon_img`, `photo_img`
- `.gitignore` обновлён: `imgs/ArchivedReplased-Photobank/` исключён из Git
- Создан `download-images.sh` — скачивает все изображения со старого сайта fidchem.com, оптимизирует через `sips`, кладёт в `static/img/`

**Ожидает действия пользователя:**  
Запустить `bash download-images.sh` из терминала Mac в папке проекта, затем сделать git commit + push.

```bash
# Команды Git (без ArchivedReplased-Photobank):
git add .gitignore download-images.sh layouts/ static/ content/en/technologies/ imgs/logo.png
git commit -m "Add logo, teal colour scheme, Google Ads pixel, all site images"
git push origin main
```

---

## Итерация 3 — Страница технологии MAOP

**Дата:** 2026-05-12  
**Результат:**

- Создан `content/en/technologies/maop.md` — описание технологии Modified Advanced Oxidation Process
- Создан `content/es/technologies/maop.md` — испанский перевод
- Контент строго из PDF-флаера австралийского партнёра, без упоминания Puroh Pty Ltd
- Технология: Cold Plasma + Peroxy mix → ROS + solvated electrons → разрыв C-F связи → минерализация (F⁻ + CO₂)
- Weight = 5 (после GLOIO)
- Иконка и фото (`maop-icon.png`, `maop-photo.png`) — **ещё не созданы**, нужно добавить позже

**Ожидает действия пользователя:**  
Git commit + push страниц MAOP:

```bash
git add content/en/technologies/maop.md content/es/technologies/maop.md
git commit -m "Add MAOP technology page (EN + ES)"
git push origin main
```

---

## Pending (общие задачи)

- [ ] ES-переводы: pcdo.md, pcds.md, gloio.md, contacts.md
- [ ] Иконки и фото для MAOP: `maop-icon.png`, `maop-photo.png` → `static/img/`
- [ ] Запустить `download-images.sh` и залить изображения технологий
- [ ] DNS-перевод fidchem.com → Cloudflare Pages (после финального согласования)
