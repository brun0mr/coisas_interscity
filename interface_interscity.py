import requests
import json

def criar_or_update_capabilitie () :
    print("criando ou atualizando capability")
    name = input("Entre com o nome da capability\n")
    description = input("entre com a descricao\n")
    data = {"name" : "", "description" : "", "capability_type" : "sensor"}
    data["name"] = name
    data["description"] = description
    opcao = input("entre com 1 para criar ou 2 para atualizar\n")
    
    if opcao == "1" :
       r = requests.post("http://34.95.169.45:8000/catalog/capabilities", data=data)
       print("capability criada!")
        
    else:
       nome_cap = input("entre com o nome da capability que deseja atualizar\n")
       r = requests.put(f'http://34.95.169.45:8000/catalog/capabilities/{nome_cap}', data=data)

    print(r)
    print(r.content)

def criar_resource () :
    print("criando resource")

    

    
    


criar_or_update_capabilitie()

