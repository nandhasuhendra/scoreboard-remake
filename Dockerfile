FROM ruby:2.4.4

RUN apt-get update && \
    apt-get install -y \
      socat \
      sqlite3

RUN mkdir /home/app

COPY . /home/app
WORKDIR /home/app

RUN gem install bundler
RUN bundle install

# RUN rake db:migrate && \
#       rake db:seed

RUN chmod +x start.sh

CMD ["/bin/sh", "-c", "/home/app/start.sh"]
EXPOSE 60006 
