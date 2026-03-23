# FIDCHEM Website — Management Guide
## Руководство по управлению сайтом

---

# ENGLISH

## How the site works

The FIDCHEM website is a **static site** hosted on Cloudflare Pages.
There is no WordPress, no database, and no hosting bill beyond the domain name (~€12/year).

**The golden rule:** Edit a file on GitHub → the site updates automatically in ~45 seconds.

---

## How to edit content (no coding needed)

### Step 1 — Open GitHub
Go to **github.com** and sign in to the FIDCHEM account.
Open the repository **fidchem-website**.

### Step 2 — Find the file you want to edit
All website text lives in the `content/` folder:
- English text: `content/en/`
- Spanish text: `content/es/`
- Technology pages: `content/en/technologies/pcdr.md` (etc.)
- Homepage: `content/en/_index.md`

### Step 3 — Edit the file
1. Click the file name to open it
2. Click the **pencil icon** (✏️) in the top right — "Edit this file"
3. Make your changes to the text
4. Scroll down to **"Commit changes"**
5. Write a short note about what you changed (e.g. "Update PCDR description")
6. Click **"Commit changes"** (green button)

**That's it.** The site will update in about 45 seconds.

---

## What you can safely edit

| What | File | Notes |
|---|---|---|
| Homepage headline | `content/en/_index.md` | Also edit `content/es/_index.md` for Spanish |
| Technology description | `content/en/technologies/pcdr.md` | One file per technology |
| Contact phone/email | `hugo.toml` | Look for `[params]` section |
| Footer text | `layouts/partials/footer.html` | Requires basic HTML knowledge |

---

## How to add or change an image

1. In the repository, go to `static/img/`
2. Click **"Add file"** → **"Upload files"**
3. Drag your image file (JPG or PNG, under 500KB recommended)
4. Commit the upload
5. In your content file, reference it as: `![Description](/img/your-image.jpg)`

---

## Content file format (Markdown)

Files use a simple format called **Markdown**:

```
---
title: "Page Title"
summary: "One sentence description"
---

## Section Heading

Normal paragraph text goes here.

- Bullet point one
- Bullet point two

**Bold text** and *italic text* work like this.
```

The section between `---` lines at the top is called **front matter** — it contains
settings for that page. The text below is the page content.

---

## Checking if the deploy worked

After committing a change:
1. Go to the **Actions** tab in the GitHub repository
2. You'll see a yellow circle (running) that turns green (success) or red (error)
3. Green = your changes are live on the website

If there's a red error, don't panic — the previous version of the site stays live.
Contact your developer or ask Claude (paste the error message).

---

## Important: what NOT to do

- Do not delete the `.github/` folder
- Do not delete `hugo.toml`
- Do not rename the `content/`, `layouts/`, or `static/` folders
- Do not paste HTML or `<script>` tags into `.md` content files unless sure

---
---

# РУССКИЙ

## Как работает сайт

Сайт FIDCHEM — это **статический сайт** на хостинге Cloudflare Pages.
Нет WordPress, нет базы данных, никаких регулярных расходов кроме домена (~12 €/год).

**Главное правило:** Отредактировал файл на GitHub → сайт обновился автоматически за ~45 секунд.

---

## Как редактировать контент (без знания кода)

### Шаг 1 — Открыть GitHub
Зайди на **github.com**, войди в аккаунт FIDCHEM.
Открой репозиторий **fidchem-website**.

### Шаг 2 — Найти нужный файл
Все тексты сайта находятся в папке `content/`:
- Английские тексты: `content/en/`
- Испанские тексты: `content/es/`
- Страницы технологий: `content/en/technologies/pcdr.md` (и так далее)
- Главная страница: `content/en/_index.md`

### Шаг 3 — Редактировать файл
1. Кликни на название файла
2. Нажми **иконку карандаша** (✏️) вверху справа — "Edit this file"
3. Внеси изменения в текст
4. Прокрути вниз до раздела **"Commit changes"**
5. Напиши короткую заметку о том, что изменил (например: "Обновлено описание PCDR")
6. Нажми **"Commit changes"** (зелёная кнопка)

**Всё.** Сайт обновится примерно через 45 секунд.

---

## Что можно безопасно редактировать

| Что | Файл | Примечание |
|---|---|---|
| Заголовок главной страницы | `content/en/_index.md` | Также редактируй `content/es/_index.md` для испанского |
| Описание технологии | `content/en/technologies/pcdr.md` | Один файл на каждую технологию |
| Телефон / email | `hugo.toml` | Найди раздел `[params]` |

---

## Формат файлов контента (Markdown)

Файлы используют простой формат **Markdown**:

```
---
title: "Заголовок страницы"
summary: "Одно предложение-описание"
---

## Заголовок раздела

Обычный текст параграфа.

- Пункт списка один
- Пункт списка два

**Жирный текст** и *курсив* работают вот так.
```

Блок между `---` вверху — это **front matter** (настройки страницы).
Текст ниже — содержимое страницы.

---

## Как проверить что изменения применились

После того как сохранил изменения:
1. Открой вкладку **Actions** в репозитории GitHub
2. Увидишь жёлтый кружок (выполняется) → зелёный (успех) или красный (ошибка)
3. Зелёный = изменения на сайте

Если красный — не паникуй. Старая версия сайта остаётся рабочей.
Опиши ошибку разработчику или скинь Клоду.

---

## Важно: чего НЕ делать

- Не удалять папку `.github/`
- Не удалять файл `hugo.toml`
- Не переименовывать папки `content/`, `layouts/`, `static/`
- Не вставлять HTML-теги или `<script>` в `.md` файлы без уверенности

---

## Быстрая шпаргалка

| Задача | Действие |
|---|---|
| Обновить текст | Найти `.md` файл в `content/` → карандаш → сохранить |
| Обновить телефон | `hugo.toml` → найти `whatsapp =` → изменить → сохранить |
| Добавить изображение | `static/img/` → Upload files → добавить ссылку в `.md` |
| Посмотреть статус деплоя | Вкладка Actions → ждать зелёного кружка |
| Что-то сломалось | Вкладка Actions → кликнуть красный → показать лог разработчику |
