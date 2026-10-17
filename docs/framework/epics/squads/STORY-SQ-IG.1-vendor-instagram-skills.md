# Story SQ-IG.1: Vendorizar instagram-skills como Squad

## Status

InReview

## Story

Como usuário do AIOX que produz conteúdo pra Instagram,
quero as 9 skills de [sergebulaev/instagram-skills](https://github.com/sergebulaev/instagram-skills) disponíveis como squad no repo,
pra usar caption/carrossel/hook/hashtag/planejamento sem instalar nada externo.

## Acceptance Criteria

- [x] Conteúdo upstream (skills, references, lib, scripts, SKILL.md, plugin manifest, LICENSE MIT) em `squads/instagram-skills/`.
- [x] Origem rastreável: repo, commit e versão em `config.yaml`; README original preservado em `README.upstream.md`.
- [x] Squad versionada (whitelist em `.gitignore`), sem `.env` nem voice-profile preenchido.
- [x] Validadores upstream (`check_frontmatter`, `check_markdown_references`, `check_text_encoding`) passam no diretório vendorizado.

## Tasks

- [x] Copiar conteúdo upstream (commit `6a12448`, v1.0.32), excluindo CI/Codex/CLAUDE.md upstream e imagens pesadas.
- [x] Criar `config.yaml` e `README.md` da squad.
- [x] Whitelist `!squads/instagram-skills/` no `.gitignore`.
- [ ] @qa review.

## File List

- `.gitignore`
- `squads/instagram-skills/**` (novo)
- `docs/framework/epics/squads/STORY-SQ-IG.1-vendor-instagram-skills.md`
