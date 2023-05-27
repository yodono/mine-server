# Os Mosquitinhos Minecraft Server

## Pré-requisitos
- [Docker](https://www.docker.com/)
- [Ngrok (authtoken)](https://dashboard.ngrok.com/login)

## Como rodar
- Certifique-se de que o server está configurado conforme sua preferência em `./server`
- Construa a imagem docker `docker run build -t mosquitinhos-server .`
- Rode a imagem passando a porta do seu servidor (geralmente `25565`) e o nome da tag
  - O parametro -d roda em modo _detached_. Rode `docker exec -it mosquitinhos-server /bin/bash` interagir no ambiente da imagem.

```bash
docker run -d -p 25565:25565 mosquitinhos-server
```
- Pronto! Seu servidor esta no ar =)

## Acessando o server local por redes externas
Isso pode ser feito de várias formas
- **Por provedores de VPN:** Opção acessível e simples, porém requer que os "clients" externos instalem o mesmo provedor de VPN que o host para conectar na rede privada. E o vitinho tem problemas com isso ja que ele usa Linux :-)
- **Por rede local, via encaminhamento de porta:** Permite abrir uma porta para acesso global. Muito chato mexer nisso, chances de DDoS, talvez o provedor de internet nem permita fazer isso etc
- **Alugando um host na cloud:** Ta podendo hein fi, tá bem de vida hein fi...
- **Por meio de um proxy:** Ngrok pode encapsular o tráfego entre a internet e o servidor local por meio de um túnel seguro de comunicação.
    - Com apenas um comando, exponha o servidor para a internet!
    - Sem mais Hamachi, RadminVPN e outros provedores. Basta qualquer client colocar o endereço e logar =)
    - Totalmente aberto e sem restrições - mas podemos limitar o server sempre para 4 pessoas e usar a whitelist!

### Rodando com Ngrok
- Tenha o servidor rodando no passo anterior
- Rode a imagem remota do NGrok, passando seu token de autenticação
```bash
docker run --net=host -it --region=sa -e NGROK_AUTHTOKEN=<seu-token> ngrok/ngrok:latest tcp 25565
```

