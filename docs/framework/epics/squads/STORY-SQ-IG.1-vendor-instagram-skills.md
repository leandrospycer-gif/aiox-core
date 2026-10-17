# Story SQ-IG.1: Vendorizar instagram-skills em .claude/skills/instagram

## Status

InReview

## Story

Como usuário do AIOX que produz conteúdo pra Instagram,
quero as 9 skills de [sergebulaev/instagram-skills](https://github.com/sergebulaev/instagram-skills) disponíveis em `.claude/skills/instagram/`,
pra usar caption/carrossel/hook/hashtag/planejamento sem instalar nada externo.

## Acceptance Criteria

- [x] Conteúdo upstream (skills, references, lib, scripts, SKILL.md, plugin manifest, LICENSE MIT) em `.claude/skills/instagram/`.
- [x] Origem rastreável: repo, commit e versão em `config.yaml`; README original preservado em `README.upstream.md`.
- [x] Versionado em `.claude/skills/` (sem whitelist no `.gitignore`), sem `.env` nem voice-profile preenchido.
- [x] Bundle excluído do pacote npm (`!.claude/skills/instagram/` em `package.json` `files`); verificado via npm-packlist: 59 → 0 arquivos.
- [x] Validadores upstream (`check_frontmatter`, `check_markdown_references`, `check_text_encoding`) passam no diretório vendorizado.

## Tasks

- [x] Copiar conteúdo upstream (commit `6a12448`, v1.0.32), excluindo CI/Codex/CLAUDE.md upstream e imagens pesadas.
- [x] Criar `config.yaml` e `README.md`.
- [x] Mover de `squads/instagram-skills/` para `.claude/skills/instagram/` (pedido do usuário).
- [x] Excluir `.claude/skills/instagram/` do pacote npm.
- [ ] @qa review.

## File List

- `package.json`
- `.gitignore` (whitelist adicionada e depois removida)
- `.claude/skills/instagram/**` (novo)
- `docs/framework/epics/squads/STORY-SQ-IG.1-vendor-instagram-skills.md`
