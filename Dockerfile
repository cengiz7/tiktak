FROM ruby:2.7.2
RUN gem install rails -v '6.1.3'
WORKDIR /app
ADD Gemfile Gemfile.lock /app/
RUN gem list bundler
RUN gem install bundler -v 2.0.2
RUN gem list bundler
RUN bundle install
# Copy the application into the container
COPY . /app
EXPOSE 3000
