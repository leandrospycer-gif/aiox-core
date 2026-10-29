# uso: python3 -I mkdocs.py spec.json  -> grava docs/ e imprime writes
import json,sys,os
sp=json.load(open(sys.argv[1])); d0=os.path.dirname(os.path.abspath(sys.argv[1])); os.makedirs(d0+'/docs',exist_ok=True)
base={"marca":sp.get("marca","Onça Preta"),"colecao":sp.get("colecao","Inverno 27"),"pasta":"Influenciadora: "+sp["nome"],"influenciadora":sp["nome"],"revisada":True,"formatosPermitidos":["story"]}
w=[]
for it in sp["itens"]:
  did=it["id"]; d=dict(base,arquivo=it["arquivo"],driveId=did,link=f"https://drive.google.com/file/d/{did}/view",thumb="/_blob/"+it["blob"],tipo=it["tipo"],descricao=it["desc"]+" Só story.")
  if it["tipo"]=="video": d.update(formato="9:16",duracao=it["dur"])
  doc=f"onca-inv27-{sp['slug']}-"+did[:10].replace("_","-"); p=f"{d0}/docs/{doc}.json"; json.dump(d,open(p,"w"),ensure_ascii=False)
  w.append({"op":"set","collection":"midia","doc_id":doc,"file_path":p})
print(json.dumps(w))
