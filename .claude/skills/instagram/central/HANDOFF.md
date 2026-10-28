# Central Mix Brands — handoff para novas sessões

Leia isto antes de mexer no Instagram do @showroom.mix_brands.

## Onde está tudo

- **Central (artifact):** https://claude.ai/artifact/HEM8H7hZwjVmApuEMAUztX
  - Fonte da página: `central-mix-brands.html` (republicar com o mesmo `url`).
  - Banco (ArtifactData): coleções `posts`, `midia`, `regras`. Escritas pedem `if_version`.
  - Thumbs/slides ficam no asset store do artifact (`/_blob/<id>`).
- **Publora (backup / atual):** Instagram `instagram-17841453054808029`.
  - Plano Starter: 15 posts/mês, 3 agendados ao mesmo tempo, horizonte 7 dias.
  - Story = vídeo `videoType: STORIES` (foto vira mp4 de 6s com zoompan).
  - Fluxo: `create_post` (draft) → `get_upload_url` → PUT → `complete_media` → `update_post` (scheduled/publishNow).
  - Faça upload em ordem e confira com `get_post` (a ordem das mídias = ordem dos slides).
- **Meta Graph API (migração):** token em `META_IG_TOKEN`, host `graph.facebook.com` liberado no ambiente.
  Primeiro passo: `GET /v21.0/me/accounts?fields=name,instagram_business_account`. Mídia precisa de URL pública.

## Regras do Leandro (ver também a coleção `regras`)

1. **Sempre mostrar prévia e esperar aprovação** antes de publicar/agendar (inclusive stories).
   **Sempre confirmar a legenda final** antes de postar, inclusive quando ela mudar depois de aprovada.
2. **Não misturar coleções** na mesma divulgação.
3. **Inverno 27** (Onça Preta, Meia Loka) = **só story**, em venda pra lojista.
4. **Alto Verão 27** (Onça Preta Artemis, Meia Loka Serenidade, Pigmento Sense Resort) = feed/carrossel/reels/story, mas **venda encerrada**: só divulgação pro cliente final, **sem chamada pro showroom**.
4b. **Chamada padrão** (regra `chamada-padrao`, 28/10): Verão/Alto Verão = **"Já nas lojas!"**;
   Inverno = **"Disponível para lojistas no Showroom Mix Brands"**.
5. Duzani Nativa 2027: ainda em venda.
6. Sequências de story: fotos da **mesma família de tecido/estampa** + **1 a 2 vídeos da mesma família** (cada família tem seu "filmlook"/Reels).
7. Conteúdo de influenciadora = só story, marcar o @ (handles ainda não informados).
8. Vide Bula: não trabalhamos mais.

## Pastas do Drive (ids)

- Onça Preta Inverno 27: `1xq_L7X0Xfa0eZB06J_V4Fm4YLJU3vkdE` (vídeos/filmlooks: `1KLnV__GyROSy905ie7Igz2fu5w0Nqz-I`)
- Onça Preta Alto Verão 27 Artemis: `1wedJ6RUc7biwFtNKgDq1ulgWsarDj6gX`
- Meia Loka AV27 Serenidade: `1C6ogK0EZPiHnWw35Zixlz9sJBpsj_rYo`
- Meia Loka INV27 Reflexo: `1jEvFYZUdrPiHgMU5IqIXK59xwTBmwTHJ`
- Pigmento AV27 Sense Resort: `1qA4TRzhnp8fsV7P58nr5MhN-0ITwuoeC`
- Duzani Nativa 2027: `1geF5GDUEZO01gWp4IVNGCGVoGNyIMvxo`

Listar pasta pública: `https://drive.google.com/embeddedfolderview?id=<ID>#list`.
Thumb: `https://drive.google.com/thumbnail?id=<ID>&sz=w1600`.
Arquivo: `https://drive.usercontent.google.com/download?id=<ID>&export=download&confirm=t`.

## Ferramentas (`tools/`)

- `ingest.sh <folderId> <slug>`: lista a pasta, baixa thumbs/vídeos, gera contact sheet e thumbs 540x960 em `.aiox/tmp/<slug>`.
  Use `SCRATCH=<pasta temporária>` (padrão: $TMPDIR/ig-ingest).
- `mkdocs.py spec.json`: gera docs da coleção `midia` + lista de writes para ArtifactData batch.

## Pendências (atualizado 28/10/2026 à noite)

- Agendados no Publora (horário -03:00): Reel Carol maiô pink 29/10 09:30 (`6ae269816895dad5965ee96d`),
  Reel Carol kimono 01/11 10:00 (`6ae269826895dad5965ee98e`), Carrossel Artemis 02/11 09:30 (`6ae2698342e75d8753f6885b`).
  Autorização de imagem da Carol: OK (Leandro, 28/10). Legendas dos três já com "Já nas lojas!" (confirmadas).
- Reel Meia Loka Serenidade (s5): remarcado pra 03/11 09:30, ainda **não agendado** (fila 3/3 cheia).
  Legenda com "Já nas lojas!" já confirmada. Agendar depois que o Reel de 29/10 publicar
  (lembrete `trig_01C3dxBXbTYNoWZJqNFLzURp` pra 29/10 10:00 BRT).
- Cota Publora de outubro: usada a última vaga (r2). Volta em 01/11.
- **Meta Graph API:** `META_IG_TOKEN` não estava no ambiente em 28/10. Leandro quer migrar (opção 2) assim que o token for configurado.
- Pasta "2. Nadine & Agnes" (Onça Inverno 27) vazia/sem permissão; @ das influenciadoras pendentes.
