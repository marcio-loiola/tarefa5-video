# ==============================================================================
#  TUTORIAL: CRIANDO UMA IMAGEM PARA SERVIDOR WEB (NGINX)
# ==============================================================================

# 1. BASE DA IMAGEM
# O comando FROM define qual sistema operacional e ferramentas pré-instaladas vamos usar.
# 'nginx:alpine' é uma versão oficial e super leve (Linux Alpine) do servidor Nginx.
FROM nginx:alpine

# 2. METADADOS (Opcional)
# Adiciona informações sobre a imagem. Útil para identificar quem criou.
LABEL maintainer="Aluno Capacita IREDE"
LABEL description="Servidor Web Nginx para hospedar o Dashboard de Infraestrutura"

# 3. REDE E COMUNICAÇÃO
# O comando EXPOSE serve como documentação para informar qual porta o serviço usa.
# A porta 80 é o padrão mundial para servidores Web HTTP.
EXPOSE 80

# 4. ARMAZENAMENTO E PERSISTÊNCIA
# O comando VOLUME cria um ponto de montagem para salvar dados importantes.
# Se o container for recriado, os dados nesta pasta podem ser preservados se
# você conectá-los a uma pasta do seu computador (Bind Mount).
VOLUME /var/log/nginx

# 5. CONSTRUÇÃO E 'DEPLOY'
# O comando COPY move os arquivos do seu projeto para dentro da imagem.
# Sintaxe: COPY <origem_no_host> <destino_no_container>
#   (.) Ponto: Significa "tudo nesta pasta atual".
#   /usr/share/nginx/html: É a pasta padrão onde o Nginx procura o 'index.html'.
COPY . /usr/share/nginx/html 