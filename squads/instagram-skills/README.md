# Instagram Skills Squad

> 9 skills de marketing para Instagram, vendorizadas de [sergebulaev/instagram-skills](https://github.com/sergebulaev/instagram-skills) (MIT, v1.0.32, commit `6a12448`).

README original: [`README.upstream.md`](README.upstream.md) · Licença: [`LICENSE`](LICENSE)

## Skills

| Skill | Pra quê |
|-------|---------|
| `ig-caption-writer` | Caption com hook nos primeiros 125 chars, corpo e CTA |
| `ig-carousel-planner` | Carrossel slide a slide (hook → payoff) |
| `ig-hook-extractor` | Engenharia reversa do hook de Reel/carrossel viral |
| `ig-hashtag-strategist` | 3-5 hashtags niche/mid/broad |
| `ig-humanizer` | Remove "cara de IA" + `--mode audit` pré-post |
| `ig-content-planner` | Semana de Reels, carrosséis e stories |
| `ig-repurposer` | Adapta LinkedIn/blog/YouTube/X pra Instagram |
| `ig-profile-optimizer` | Audita bio, nome, link, highlights, grid |
| `ig-audience-insights` | Lê nicho/perfil com dados reais (Apify) |

Roteamento entre skills: [`SKILL.md`](SKILL.md).

## Uso

**Como plugin do Claude Code** (a partir da raiz do repo):

```
/plugin marketplace add ./squads/instagram-skills
/plugin install instagram-skills@instagram-skills
```

**Direto:** peça ao agente pra ler `squads/instagram-skills/skills/<skill>/SKILL.md` antes da task.

## Leitura e publicação (opcional)

Escrever caption/carrossel/plano não precisa de nada. Pra ler dados reais ou publicar:

```bash
pip install -r squads/instagram-skills/requirements.txt
cp squads/instagram-skills/.env.example squads/instagram-skills/.env  # preencha APIFY_TOKEN / PUBLORA_API_KEY
```

Nada publica sem aprovação explícita (`lib/approval.py`).

## Atualizar do upstream

Recopie `skills/`, `references/`, `lib/`, `scripts/`, `SKILL.md`, `.claude-plugin/` do upstream e atualize `upstream.commit`/`version` em `config.yaml`. `references/voice-profile.md` vem em branco: não commite versão preenchida (dado pessoal).
