
# 🧱 Docker Kamailio 5.0.0

Imagem Docker otimizada do **Kamailio SIP Server** para cenários de alta performance, laboratórios VoIP, testes de carga (CPS), SBCs leves e ambientes de desenvolvimento.

![ver](https://img.shields.io/github/v/release/deizeppe/docker-kamailio-500?color=red&style=plastic)
![License](https://img.shields.io/github/license/deizeppe/docker-kamailio-500?color=yellow&style=plastic)
![reposize](https://img.shields.io/github/repo-size/deizeppe/docker-kamailio-500?color=orange&style=plastic)

---

## 📑 Sumário
- [📋 Requisitos](#-requisitos)  
- [🧱 Arquitetura](#-arquitetura)  
- [🚀 Instalação](#-instalação)  
- [⚙️ Comandos Básicos](#️-comandos-básicos)  
- [🧪 Testes](#-testes)  
- [🛡️ Segurança Recomendada](#️-segurança-recomendada)  
- [📝 Licença](#-licença)  
- [👨‍💻 Autor](#-autor)

---

## 📋 Requisitos

- 🐳 **Docker** >= 20.x  
- Linux (recomendado) ou macOS  
- Porta SIP 5060 liberada

---

## 🧱 Arquitetura

```
[Cliente SIP / Load Balancer] ──► [Docker Kamailio]
                                             │
                                             └──► SIP / UDP / TCP
```

- Kamailio roda dentro de um container isolado.  
- Ideal para SBCs simples, testes de carga, balanceamento de tráfego SIP e labs.  
- Pode atuar em conjunto com FreeSWITCH para terminação/originação de chamadas.

---

## 🚀 Instalação

### Clonar repositório
```bash
git clone https://github.com/deizeppe/docker-kamailio-500.git
cd docker-kamailio-500
```

### Build da imagem
```bash
docker build -t kamailio .
```

### Rodar container (local)
```bash
docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio kamailio
```

### Rodar container (Docker Hub)
```bash
docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio deizeppe/kamailio
```

---

## ⚙️ Comandos Básicos

### Acessar o container
```bash
docker exec -it kamailio bash
```

### Ver logs do Kamailio
```bash
docker logs -f kamailio
```

### Reiniciar container
```bash
docker restart kamailio
```

---

## 🧪 Testes

### Exemplo com SIPp
```bash
sipp -sf uac.xml -r 100 -m 1000 -s 551930600000 127.0.0.1:5060 -t u1 -l 2000
```

### Integração com Web Dialer
```bash
curl -sS -X POST http://10.0.0.5:8080/start   -H "Content-Type: application/json"   -H "X-API-Key: sua-chave-secreta"   -d '{
    "cid": "2130790079",
    "endpoint": "sofia/internal/5519306?????@<ip_kamailio>",
    "cps": 3,
    "duration": 15,
    "ncalls": 10,
    "fs_container": "freeswitch"
  }'
```

---

## 🛡️ Segurança Recomendada

- Restrinja a porta SIP (5060) apenas para IPs confiáveis.  
- Utilize firewall ou security groups para segmentação de tráfego.  
- Configure limites de CPS e controle de flood no `kamailio.cfg`.  
- Opcional: habilitar TLS/SRTP para cenários seguros.

---

## 📝 Licença

MIT License.

---

## 👨‍💻 Autor

Ricardo Deizeppe — Engenharia VoIP  
Imagem otimizada para uso em SBCs leves, cenários de teste e integrações VoIP.
