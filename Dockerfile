FROM alpine:3.7 

RUN apk --update add python3 bash curl && \
    pip3 install flask-cors flask_api

RUN mkdir -p /home/flask_simplified/server

COPY ./flask_simplified.py/ /home/flask_simplified/server/ 

COPY ./runflask.sh/ ./labelsFile.json/ /home/flask_simplified/

RUN chmod +x /home/flask_simplified

WORKDIR /home/flask_simplified

RUN ls

ENTRYPOINT ["./runflask.sh"]
